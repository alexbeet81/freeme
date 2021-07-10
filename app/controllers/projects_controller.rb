class ProjectsController < ApplicationController
    before_action :set_user, only: [:create]
    before_action :set_projcet, only: [:destroy, :update]

  def create
    @project = Project.new(project_params)
    @project.user = @user

    if @project.save
      redirect_to user_path(@user)
    else
      # Can't render show - where should this lead to?
      render 'users/show'
    end
  end

  def update
    @project.update(project_params)

    if @project.save
      redirect_to (user_path(@project.user) + "#project-#{@project.id}")
    else
      render 'users/show'
    end
  end

  def destroy
    @project.destroy

    redirect_to user_path(@user)
  end

  private

  def project_params
    params.require(:project).permit(:title, :decription)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_projcet
    @project = Project.find(params[:id])
  end
end
