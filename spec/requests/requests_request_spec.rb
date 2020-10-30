require 'rails_helper'

RSpec.describe "Requests", type: :request do
    it "should correctly route for the index view" do
        get requests_path
        expect(response).to have_http_status(:ok)
    end
    
    it "should correctly route for the show view" do
        Request.create!
        get request_path("1")
        expect(response).to have_http_status(:ok)
    end

end
