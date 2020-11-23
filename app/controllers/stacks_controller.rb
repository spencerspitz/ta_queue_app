class StacksController < ApplicationController
    def index
        order = params[:order] || "user"
        @stack = Stack.order(order)
    end
    
    def new
        @stack = Stack.new
    end
    
    def create
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
        id = params[:id]
        @stack = Stack.find(id)
    end
    
    private
    def stack_params
        params.require(:stack).permit(:user, :topic, :coscclass, :comment)
    end
end