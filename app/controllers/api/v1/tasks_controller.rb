class Api::V1::TasksController < ApplicationController
  before_action :set_project, only: %i[create]
  before_action :check_owner, only: %i[create]

  def show
    render json: @task
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.project = @project

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @task.destroy
    render json: { message: "task deleted successfully!"}, head: :no_content
  end

  private

  def task_params
    params.require(:task).permit(:name, :date, :time)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def check_owner
     render json: { error: "forbidden" }, status: :forbidden unless (@project.user_id == current_user&.id)
  end
end
