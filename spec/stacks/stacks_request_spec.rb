require 'rails_helper'

RSpec.describe "Quick Questions", type: :request do
    
    it "should correctly route to the Quick Questions index view" do
        get stacks_path
        expect(response).to have_http_status(:ok)
    end
    it "should correctly route to the show view" do
        Stack.create!(user: "Jared", topic: "CS classes", coscclass: "COSC 101", comment: "hello!")
        get stack_path("1")
        expect(response).to have_http_status(:ok)
    end
    
end