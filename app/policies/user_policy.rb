class UserPolicy < ApplicationPolicy

  def update?
    user == record
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.admin?
        scope.all
      elsif user.present? && user.mentor?
        scope.where(:role => "mentee")
      elsif user.present? && user.mentee?
        scope.where(:role => "mentor")
      end
    end
  end
end
