class FollowPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    true
  end
  #follow should have two actions: create and destroy, this requires to change the code in the view tho
end
