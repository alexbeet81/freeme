class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  skip_before_action :authenticate_user!, only: :show
# Paul added to get to user profile page to edit

  def show
    authorize @user

    @new_skill = Skill.new
    # show only the current users skills
    @skills = Skill.where(user_id: @user.id)
    # @edit_skill = Skill.find(params[:id])

    @new_project = Project.new
    @projects = Project.where(user_id: @user.id)

    @new_experience = Experience.new
    @experiences = Experience.where(user_id: @user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
