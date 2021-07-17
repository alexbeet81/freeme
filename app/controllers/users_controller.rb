class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_visitor, only: [:showcase]
  before_action :set_projects
  before_action :set_skills
  before_action :set_experiences

  skip_before_action :authenticate_user!, only: [:show, :showcase]
# Paul added to get to user profile page to edit

  def show
    authorize @user

    @new_skill = Skill.new

    @new_project = Project.new

    @new_experience = Experience.new
  end

  def showcase; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_visitor
    @user = User.find(params[:user_id])
    authorize @user
  end

  def set_skills
    @skills = Skill.where(user_id: @user.id)
  end

  def set_projects
    @projects = Project.where(user_id: @user.id)
  end

  def set_experiences
    @experiences = Experience.where(user_id: @user.id)
  end
end
