class GardenPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
      true
    end

    def show?
      user.garden == record
    end

    def update?
      user.garden == record && user.admin?
    end

    def destroy?
      user.garden == record && user.admin?
    end

    def stats?
      true
    end
end
