class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update destroy]
  before_action :check_owner, only: %i[show update destroy]

  def show
    render json: @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :user)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def check_owner
     render json: { error: "forbidden" }, status: :forbidden unless @project.user_id == current_user&.id
  end
end
