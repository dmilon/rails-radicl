class ZonePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
    def show?
      user.garden == record.garden
    end

    def create?
      user.garden == record.garden && user.admin?
    end

    def update?
      user.garden == record.garden && user.admin?
    end

    def delete?
      user.garden == record.garden && user.admin?
    end
end
