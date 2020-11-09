require 'rails_helper'

RSpec.describe "Requests", type: :request do
    it "should correctly route for the index view" do
        get requests_path
        expect(response).to have_http_status(:ok)
    end
    
    it "should correctly route for the show view" do
        Request.create!(name: "Jared", email: "jrose@gmail.com", desc: "Test! Wow.")
        get request_path("1")
        expect(response).to have_http_status(:ok)
    end

    describe "/POST requests: happy path" do 
        it "go to index after create is good" do 
            r = Request.new 
            expect(Request).to receive(:new).and_return(r)
            expect(r).to receive(:save).and_return(true)
            post requests_path, params: {request: {name: "Aaron", email: "amendelson@gmail.com", desc: "test"}}
            expect(response).to have_http_status(:redirect)
            expect(response).to redirect_to(requests_path)
        end
    end 

    describe "/POST requests: sad path" do 
        it "go to new after create is bad" do 
            r = Request.new 
            expect(Request).to receive(:new).and_return(r)
            expect(r).to receive(:save).and_return(false)
            post requests_path, params: {request: {name: "Aaron", email: "amendelson@gmail.com", desc: "test"}}
            expect(response).to have_http_status(:redirect)
            expect(response).to redirect_to(new_request_path)
        end 
    end







end 
