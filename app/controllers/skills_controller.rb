class SkillsController < ApplicationController
  before_action :set_user
  before_action :set_skill, only: [:destroy, :update]

  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      redirect_to user_path(@user)
    else
      # Can't render show - where should this lead to?
      render 'users/show'
    end
  end

  def update
    @skill.update(skill_params)

    if @skill.save
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  def destroy
    @skill.destroy

    redirect_to user_path(@user)
  end

  private

  def skill_params
    params.require(:skill).permit(:skill_name, :level, :years_of_experience)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
