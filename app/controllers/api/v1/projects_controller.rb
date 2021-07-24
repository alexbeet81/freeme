class Api::v1::ProjectsController < Api::V1::BaseController
  before_action :set_project, only: [:show, :update]

  def show; end

  def update
    if @project.update(project_params)
      redirect_to api_v1_user_path(@user)
    else
      render_error
    end
  end

  def update_positions
    params[:position].each do |e|
      project = Project.find_by_id(e[:project])
      project.position = e[:position]
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:position)
  end

  def render_error
    render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
  end

  def set_user
    @user = User.where(id: @project.user_id)
  end
end
