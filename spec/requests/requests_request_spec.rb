require 'rails_helper'

RSpec.describe "Requests", type: :request do
    it "should correctly route for the index view" do
        get requests_path
        expect(response).to have_http_status(:ok)
    end
    
    it "should correctly route for the show view" do
        Request.create!(name: "Jared", email: "jrose@colgate.edu", desc: "Test! Wow.")
        get request_path("1")
        expect(response).to have_http_status(:ok)
    end

    describe "/POST requests: happy path" do 
        it "go to index after create is good" do 
            r = Request.new 
            expect(Request).to receive(:new).and_return(r)
            expect(r).to receive(:save).and_return(true)
            post requests_path, params: {request: {name: "Aaron", email: "amendelson@colgate.edu", desc: "test"}}
            expect(response).to have_http_status(:redirect)
            expect(response).to redirect_to(requests_path)
        end
    end 

    describe "/POST requests: sad path" do 
        it "go to new after create is bad" do 
            r = Request.new 
            expect(Request).to receive(:new).and_return(r)
            expect(r).to receive(:save).and_return(false)
            post requests_path, params: {request: {name: "Aaron", email: "amendelson@colgate.edu", desc: "test"}}
            expect(response).to have_http_status(:redirect)
            expect(response).to redirect_to(new_request_path)
        end 
    end

    describe "/PATCH requests" do
       it "should update request" do 
           tr = Request.create!(name: "Spencer", email: "spence@colgate.edu", desc: "Test! Wow.")
           patch :edit, params: {id: tr.id, name: "Aaron"}
           expect(response).to have_http_status(:redirect)
           expect(response).to redirect_to(request_path(tr))
           expect(tr.name).to eq("Aaron")
           
        end
    end





end 
