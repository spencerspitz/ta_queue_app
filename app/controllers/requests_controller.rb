class RequestsController < ApplicationController
    def index
        id = params[:id]
        @requests = Request.order(id)
    end 
    
    def show
        id = params[:id]
        @request = Request.find(id)
    end
end