class ProjectsController < ApplicationController
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to user_path(@user)
    else
      # Can't render show - where should this lead to?
      render 'users/show'
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :decription)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
