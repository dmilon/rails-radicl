class LogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user == record.user
  end

  def update?
    user == record.user
  end
end
