class StacksController < ApplicationController
    def index
        #sorts the stack objects by a given variable if there is non given user is the default
        order = params[:order] || "user"
        @stack = Stack.order(order)
    end
    
    def new
        #create a new stack object
        @stack = Stack.new
    end
    
    def create
        #creates a new stack variable, gives a flash notice if it was successfully posted or now
        @stack = Stack.new(stack_params)
        if @stack.save
            flash[:notice] = "New Question has been posted"
            redirect_to stacks_path and return
        else
            flash[:alert] = "Failed to post new question"
            redirect_to new_stack_path and return
        end
    end
    
    def show
        #when you click on the description of a question it brings you to a page where you can:
        #1 view the question and 2 add a comment to answer the question being asked
        id = params[:id]
        @stack = Stack.find(id)
    end
    
    private
    def stack_params
        #params that are required when asking a question
        params.require(:stack).permit(:user, :topic, :coscclass, :comment)
    end
end