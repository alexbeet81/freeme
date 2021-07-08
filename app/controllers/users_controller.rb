class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @skill = Skill.new(skill_params)
    # show only the current users skills
    @skills = Skill.where(user_id: @user.id)
    @edit_skill = Skill.(params[:id])

    @project = Project.new(project_params)
    @projects = Project.where(user_id: @user.id)

    @experience = Experience.new(experience_params)
    @experiences = Experience.where(user_id: @user.id)
  end

  def update
    @edit_skill.update(skill_params)

    if @edit_skill.save
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:skill_name, :level, :years_of_experience)
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def experience_params
    params.require(:experience).permit(:experience_name, :company, :role, :start_date, :end_datem, :location, :website_url)
  end
end
