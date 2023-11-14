class TasksController < ApplicationController
before_action :show_all, only: [:index]
before_action :find_one, only: [:show, :destroy, :edit, :update]

  def index
  end

  def show
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  def edit
    @task.completed.toggle!
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  private

  def find_one
    @task = Task.find(params[:id])
  end

  def show_all
    @tasks = Task.all
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end

end
