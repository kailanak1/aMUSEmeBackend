class Api::V1::StoriesController < ApplicationController
    def index 
        @recipes = Story.all 
        render json: @stories
    end


    def create 
        story = Story.create(story_params)

        render json: {story: StorySerializer.new(story)}
        
    end

    def show 
        @story = Story.find(params[:id])
        if @story
            render json: @story
        else 
            render json: { error: "That story does not exist...yet"}, status: :not_acceptable
        end
    end

    def edit 
        @story = Story.find(params[:id])
        render json: @story
    end

    def update
        @story = Story.find(params[:id])

        @story.update(story_params)

        render json: @story
    end

    def destroy 
        @story = Story.find(params[:id])
        if @story 
            @story.destroy 
            render json: {message: "Story successfully deleted"}
        else 
            render json: {message: "Failed to destroy story"}
        end
    end

    private 

    def story_params
        params.require(:story).permit(:title, :project_id)
    end

    
end

