class UserPolicy < ApplicationPolicy
  def update?
    user == record
  end

  class Scope < Struct.new(:user, :scope)
    def resolve # rubocop made me use a guard clause! Blame it on rubocop!!!
      return false unless user.present?
      if user.admin?
        scope.all
      elsif user.mentor?
        scope.where(role: 'mentee')
      elsif user.mentee?
        scope.where(role: 'mentor')
      end
    end
  end
end
