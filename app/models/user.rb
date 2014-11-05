class User < ActiveRecord::Base
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
                  against: [:first_name, :last_name, :stack, :background,
                    :professional_summary, :accomplishments,
                    :personal_statement, :company, :position],
                  using: {
                    tsearch:    { dictionary: 'english' }
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

  def mentor?
    role == 'mentor'
  end

  def mentee?
    role == 'mentee'
  end

  def admin?
    admin == true
  end

  def opposite_role
    return 'Mentees' if role == 'mentor'
    return 'Mentors'
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
    first_name + " " + last_name
  end

end
