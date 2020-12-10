class ResponsesController < ApplicationController
  def new
    @stack = Stack.find(params[:stack_id])
    @response = Response.new
  end
  
  def create
    @stack = Stack.find(params[:stack_id])
    @response = Response.new(create_params)
    @stack.responses << @response
    
    if @response.save
      flash[:notice] = 'Response Created!'
      redirect_to(stack_path(@stack))
    else
      flash[:notice] = "Couldn't create Response"
      redirect_to(new_stack_response_path(@stack))
    end
  end

  
  private 
    def create_params
      params.require(:response).permit(:comment)
    end
end
