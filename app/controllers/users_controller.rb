class UsersController < ApplicationController
  before_action :set_userm only: [:show]

  def show

    @skill = Skill.new
    @skills =

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
