class UsersController < ApplicationController
  before_action :set_userm only: [:show]

  def show

    @skill = Skill.new
    @skills = Skill.all

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
