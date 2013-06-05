require 'spec_helper'

describe ReadersController do
  describe "GET new " do
    let!(:reader) {reader = mock_model('Reader').as_new_record}

    before(:each) do
      Reader.stub(:new).and_return(reader)
    end

    it "readers new template" do
      get :new
      expect(response).to render_template :new
    end

    it "assign @reader variable to the view" do
      get :new
      expect(assigns(:reader)).to eq(reader)
    end

  end
end
