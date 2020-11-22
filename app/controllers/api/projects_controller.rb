class Api::V1::ProjectsController < ApplicationController
    def index 
        @projects = Project.all 
        render json: @projects
    end


    def create 
        project = Project.create(project_params)

        render json: {project: ProjectSerializer.new(project)}
        
    end

    def show 
        @project = Project.find(params[:id])
        if @project
            render json: @project
        else 
            render json: { error: "That project does not exist...yet"}, status: :not_acceptable
        end
    end

    def edit 
        @project = Project.find(params[:id])
        render json: @project
    end

    def update
        @project = Project.find(params[:id])

        @project.update(project_params)

        render json: @project
    end

    def destroy 
        @project = Project.find(params[:id])
        if @project 
            @project.destroy 
            render json: {message: "Project successfully deleted"}
        else 
            render json: {message: "Failed to destroy project"}
        end
    end

    private 

    def project_params
        params.require(:project).permit(:title, :user_id)
    end

end
