class ProjectsController < ApplicationController

  def new
    @project = Project.new
    @title = "New project"
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:success] = "Project created successfully"
      redirect_to @project
    else
      @title = "New project"
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @title = @project.title
  end
end

