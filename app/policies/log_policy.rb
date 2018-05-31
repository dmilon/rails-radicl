class LogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user == record.user || user.admin?
  end

  # def update?
  #   user == record.user || user.admin?
  # end
end
