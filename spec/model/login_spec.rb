require 'spec_helper'

describe 'Login' do

  describe "#authenticate" do
    before :each do
      Reader.create( id: 1, email: "bob@mail.com", password: "pass", password_confirmation: 'pass')
    end
    it "returns reader id if credentials are valid" do
      #login = Reader.new( id: 10, email: "bob@mail.com", password: "pass", password_confirmation: 'pass')
      #login.save
      login = Login.new( email: 'bob@mail.com', password: 'pass')
      # TODO
      expect(login.authenticate).to eq(1)
    end
    it "returns nil if email is not valid" do
      login = Login.new( email: 'rem@mail.com', password: 'pass')
      expect(login.authenticate).to be_nil
    end

    it "returns nil if  password is not valid" do
      login = Login.new( email: 'bob@mail.com', password: 'p')
      expect(login.authenticate).to be_nil
    end
  end

   context "attributes" do

    let(:login){Login.new}

    it "has email" do
      login.email = "email@email.com"
      expect(login.email).to eq('email@email.com')
    end
    it "has password" do
      login.password = "pass"
      expect(login.password).to eq("pass")
    end

  end
end
