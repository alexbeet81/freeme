class ExperiencePolicy < CustomPolicy
  class Scope < Scope
    def resolve
      scope.all
    # scope.where(user: user)
    end
end
