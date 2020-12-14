require 'rails_helper'

RSpec.describe Stack, type: :model do
    context "check responses methods" do
        it "should have zero responses on creation" do
            s = Stack.create!(:user => "Jared", :topic => "CS Test", :coscclass => "COSC 101", :comment => "test comment")
            expect(s.responses).to match_array([])
        end
      
        it "should populate with responses properly" do
            s = Stack.create!(:user => "Jared", :topic => "CS Test", :coscclass => "COSC 101", :comment => "test comment")
            r1 = Response.create!(:comment => "comment1", :stack_id => s.id)
            r2 = Response.create!(:comment => "comment2", :stack_id => s.id)
            s.responses << r1
            s.responses << r2
            
            expect(s.responses).to match_array([r1, r2])
        end
    end
end
