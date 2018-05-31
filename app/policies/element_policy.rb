class ElementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.garden == record.zone.garden
  end

  def update?
    user.garden == record.zone.garden
  end

  def delete?
    user.garden == record.zone.garden
  end
end
