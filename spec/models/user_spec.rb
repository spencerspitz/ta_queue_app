require 'rails_helper'

RSpec.describe User, type: :model do
  it "should disallow creation with no email" do
    expect{ User.create! }.to raise_error(ActiveRecord::RecordInvalid)
  end
  
  describe "from_omniauth" do
    it "should return nil if email is nil" do
      o = double('oauth')
      d = double('data')
      expect(d).to receive(:[]).with("email") { nil }
      expect(o).to receive(:info) { d }
      expect(User.from_omniauth(o)).to be nil
    end

    it "should return nil if the email doesn't end in @colgate.edu" do
      o = double('oauth')
      d = double('data')
      expect(d).to receive(:[]).with("email") { "test@gmail.com" }
      expect(o).to receive(:info) { d }
      expect(User.from_omniauth(o)).to be nil
    end

    it "should return the email address if the user exists" do
      u = User.create!(:email => "test@colgate.edu")
      o = double('oauth')
      d = double('data')
      expect(d).to receive(:[]).with("email") { "test@colgate.edu" }
      expect(o).to receive(:info) { d }
      expect(User.from_omniauth(o)).to eq(u)
    end
  end
end
