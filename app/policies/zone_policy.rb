class ZonePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
    def show?
      true
    end

    def new?
      # user.garden == record.garden && user.admin?
      true
    end

    def create?
      true
      # user.garden == record.garden && user.admin?
    end

    def update?
      user.garden == record.garden && user.admin?
    end

    def destroy?
      user.garden == record.garden && user.admin?
    end
end
