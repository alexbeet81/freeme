class ProjectPolicy < CustomPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
