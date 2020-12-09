class ResponsesController < ApplicationController
    def new
        @response = Response.new
    end
    
    def create
        #creates a new response variable, gives a flash notice if it was successfully posted or now
        #assign @stack to the stack object being associated
        @response = Response.new(response_params)
        @stack.responses << @response
        if @response.save
            flash[:notice] = "New Response has been posted"
            redirect_to stack_path(@stack) and return
        else
            flash[:alert] = "Failed to post new question"
            redirect_to new_response_path and return
        end
    end
    
    private
    def response_params
        params.require(:response).permit(:comment, :stack)
    end
end