class FarmPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
      true
    end

    def update?
      # (user.garden == record) && user.admin?
      true
    end

    def destroy?
      user.farm == record && user.admin?
    end

    def stats?
      true
    end
end
