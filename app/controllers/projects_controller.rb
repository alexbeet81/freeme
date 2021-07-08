class ProjectsController < ApplicationController
    before_action :set_user
    before_action :set_projcet, only: [:destroy, :update]

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to user_path(@user)
    else
      # Can't render show - where should this lead to?
      render 'users/show'
    end
  end

  def destroy
    @project.destroy

    redirect_to user_path(@user)
  end

  def update
    @project.update(project_params)

    if @project.save
      redirect_to user_path(@user)
    else
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

  def set_projcet
    @project = Project.find(params[:id])
  end
end
