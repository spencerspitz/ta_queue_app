class StacksController < ApplicationController
    def index
        @stack = Stack.order("class")
    end
end