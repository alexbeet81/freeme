class ExperiencesController < ApplicationController
  def create
    @experience = Experience.new(experience_params)

    if @experience.save
      redirect_to user_path(@user)
    else
      # Can't render show - where should this lead to?
      render 'users/show'
    end
  end

  def destroy
    @experience.destroy

    redirect_to user_path(@user)
  end

  def update
    @experience.update(experience_params)

    if @experience.save
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end


  private

  def experience_params
    params.require(:experience).permit(:experience_name, :company, :role, :start_date, :end_datem, :location, :website_url)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
