class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def showcase?
    true
  end

  def index?
    true
  end

  def show?
    true
  end
end
