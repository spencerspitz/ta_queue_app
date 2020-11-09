class StacksController < ApplicationController
    def index
        id = params[:id]
        @stacks = Stack.order(id)
    end
end