class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def index
    @task = Task.new
    @tasks = Task.ordered
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path
    else
      @tasks = Task.ordered
      render :index, status: :unprocessable_entity
    end
  end

  # Переключает статус выполнено / не выполнено
  def update
    @task.toggle!(:completed)
    redirect_to root_path, status: :see_other
  end

  def destroy
    @task.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end