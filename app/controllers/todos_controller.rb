class TodosController < ApplicationController

  before_filter :menu

  def index
    @todos = Todo.all
    @title = "All Actions's"
  end

  def show
    @todo = Todo.find(params[:id])
    @title = @todo.title
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

  def complete
    #TODO mark selected actions as complete
    redirect_to todos_path
  end

  :private

    def menu
      @menuoption = "todo"
    end

end

