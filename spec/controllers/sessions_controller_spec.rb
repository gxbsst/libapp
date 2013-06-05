require 'spec_helper'
describe SessionsController do
  describe "GET new" do
    let!(:login){mock_model("LoginS").as_new_record}
    it "send new message" do
      Login.should_receive(:new)
      get :new
    end
    it "render new template" do
      get :new
      expect(response).to render_template :new
    end
    it "assigns @login instance variable to the view" do
      Login.stub(:new).and_return(login)
      get :new
      expect(assigns[:login]).to eq(login)
    end
  end

  describe "POST create" do
    let(:params) do
      {
        "email" => "email@email.com",
        "password" => "pass"
      }
    end
    let!(:login) {stub_model(Login)}
    before :each do
      Login.stub(:new).and_return(login)
    end
    context "when data is valid" do
      before :each do
        login.stub(:valid?).and_return(true)
      end
      it "sends authentication message to Login model"  do
        # 在controler应该执行authentication方法,但是这个方法不一定存在，因为是stub_model
        login.should_receive(:authenticate)
        post :create, login: params
      end
      context "when authentication method returns true" do
        before :each do
          login.stub(:authenticate).and_return(true)
          post :create, login: params
        end
        it "redirect to root_url" do
          expect(response).to redirect_to root_url
          #response.should redirect_to root_url
        end
        it "assigns a success flash message" do
          expect(flash[:notice]).not_to be_nil
        end
        it "authentication reader" do
          expect(session[:reader_id]).not_to be_nil
        end
      end
    end

  end
end
