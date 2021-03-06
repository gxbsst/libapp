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

  describe "POST create" do
    let!(:reader){ stub_model(Reader)}
    before :each do
      Reader.stub(:new).and_return(reader)
    end
    it "sends new message to Reader class" do
      params = {
        "email" => "email@email.com",
        "password" => "pass",
        "password_confirmation" => "pass"
      }
      # 因为在controller有一个save的动作，如果不return reader, 
      # 当然会出错
      # Reader.stub(:new).and_return(reader)
      # controller 的action应该执行一下new且带参数params
      Reader.should_receive(:new).with(params)
      post :create, reader: params
    end
    it "sends save message to Reader class" do
      #Reader.stub(:new).and_return(reader)
      reader.should_receive(:save)
      post :create
    end
    context "when save message return true" do
      let(:params) do
         {
        "email" => "email@email.com",
        "password" => "pass",
        "password_confirmation" => "pass"
        }
      end
      before :each do
        reader.stub(:save).and_return(true)
      end
      it "redirects to root url" do
        post :create
        expect(response).to redirect_to root_url
      end
      it "assigns a success flash message" do
        post :create
        expect(flash[:notice]).not_to be_nil
      end
      it "logs in reader" do
        post :create, reader: params
        expect(session[:reader_id]).to eq(reader.id)
      end
    end


    context "when save message return false" do
      before :each do
        reader.stub(:save).and_return(false)
        post :create
      end
      it "renders new template" do
        expect(response).to render_template :new
      end
      it "assigns reader variable to the view" do
        expect(assigns[:reader]).to eq(reader)
      end
      it "assigns error flash message" do
        expect(flash[:error]).not_to be_nil
      end

    end
  end
end
