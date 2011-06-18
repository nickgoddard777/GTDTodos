class TodosController < ApplicationController

  before_filter :menu

  def index
    @todos = Todo.all
    @title = "All Actions's"
  end

  def show
    @todo = Todo.find(params[:id])
    @title = @todo.title
    if @todo.project.blank?
      @project_title = ""
    else
      @project_title = @todo.project.title
    end
  end

  def new
    @todo = Todo.new
    @title = "New Action"
  end

  def create
    @todo = Todo.new(params[:todo])
    if @todo.save
      flash[:success] = "Action created successfully."
      redirect_to @todo
    else
      @title = "New Action"
      render 'new'
    end
  end

  :private

    def menu
      @menuoption = "todo"
    end

end

