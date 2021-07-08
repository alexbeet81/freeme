class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @skill = Skill.new
    # show only the current users skills
    @skills = Skill.where(user_id: @user.id)
    @edit_skill = Skill.find(params[:id])

    @project = Project.new
    @projects = Project.where(user_id: @user.id)

    @experience = Experience.new
    @experiences = Experience.where(user_id: @user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
