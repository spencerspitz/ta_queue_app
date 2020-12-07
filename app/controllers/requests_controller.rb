class RequestsController < ApplicationController
    def index
        id = params[:id]
        @requests = Request.order(id)
    end 
    
    def show
        id = params[:id]
        @request = Request.find(id)
    end
    
    def new
        @request = Request.new
    end
    

    def edit
        id = params[:id]
        @request = Request.find(id)
    end 
    
    def update
        @request = Request.find(params[:id])
        @request.update(request_params)
        flash[:notice] = "Request updated successfully."
        redirect_to request_path(@request)

    def destroy
      @request = Request.find(params[:id])
      @request.destroy
      flash[:alert] = "request removed"
      redirect_to requests_path

    end
    
    def create
        @request = Request.new(request_params)
        @request.time_submitted = Time.now.utc + Time.zone_offset('EST')
        if @request.save
            flash[:notice] = "New request created"
            redirect_to requests_path and return
        else
            flash[:alert] = "Failed to save new request"
            redirect_to new_request_path and return
        end
    end
    
    private
        def request_params
            params.require(:request).permit(:name, :email, :compsciclass, :qtype, :desc, :time_submitted, :zoomurl)
        end
end