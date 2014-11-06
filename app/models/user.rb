class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 },
            confirmation: true,
            :if => lambda{ new_record? || !password.nil? }

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: :"Friendship", foreign_key: :"friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  acts_as_votable
  acts_as_voter
  include Gravtastic
  gravtastic

  include PgSearch
  pg_search_scope :super_search,
                  against: [:first_name, :last_name, :course, :background,
                    :professional_summary, :accomplishments,
                    :personal_statement, :company, :position, :technologies],
                  using: {
                    tsearch:    { dictionary: 'english', prefix: true }
                    # trigram:    { threshold:  0.1 },
                    # dmetaphone: {}
                  }

  def self.search(query)
    if query.present?
      super_search query
    else
      order('users.created_at DESC').all
    end
  end

  def first_name=(new_name)
    write_attribute(:first_name, new_name.capitalize)
  end

  def last_name=(new_name)
    write_attribute(:last_name, new_name.capitalize)
  end

  def mentor?
    role == 'mentor'
  end

  def mentee?
    role == 'mentee'
  end

  def admin?
    admin == true
  end

  def can_request?(user)
    !friends.include?(user) && !inverse_friends.include?(user) && user != self
  end

  def change_availability
    available == true ? false : true
  end

  def display_availability
    available == true ? 'available' : 'unavailable'
  end

  def opposite_role
    role == 'mentor' ? 'mentee' : 'mentor'
  end

  # Courtesy of https://gist.github.com/ivanoats/7076128
  def self.from_omniauth(auth, role)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.nickname
      user.email = auth.info.email
      user.role = role
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def fullname
    first_name + ' ' + last_name
  end

  def accepted_friends
    friends = []

    friend_ids.each do |id|
      friends << User.find(id)
    end
    friends
  end

  def friend_ids
    id_collection = []
    inverse_friendships.each do |friend|
      id_collection << friend.user_id if friend.state == 'Accepted'
    end
    friendships.each do |friend|
      id_collection << friend.friend_id if friend.state == 'Accepted'
    end
    id_collection
  end
end
