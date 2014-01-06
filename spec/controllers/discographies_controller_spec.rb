require 'spec_helper'

describe DiscographiesController do
  render_views

  describe "GET 'index'" do

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => @page_title) 
    end
  end

  describe "GET 'edit'" do

    before(:each) do
      @discography = Factory(:discography)
      @user = Factory(:user)
      test_sign_in(@user)
    end

    it "should be successful" do
      get :edit, :id => @discography
      response.should be_success
    end
  end

  describe "PUT 'update'" do

    before(:each) do
      @discography = Factory(:discography)
      @user = Factory(:user)
      test_sign_in(@user)
    end

    describe "failure" do

      before(:each) do
        @attr = { :release_date => "",
                  :title => "",
                  :artist => "",
                  :players => "",
                  :record_co => "",
                  :url => "",
                  :comment => "" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @discography, :discography => @attr
        response.should render_template('edit')
      end

      it "should have the right title" do
        put :update, :id => @discography, :discography => @attr
        response.should have_selector("h2", :content => "Edit discography")
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :release_date => "2014-01-01",
                  :title => "New Album",
                  :artist => "Yoshimasa",
                  :players => "",
                  :record_co => "ABC Record",
                  :url => "http://example.com",
                  :comment => "This CD is great." }
      end

      it "should change the discography's attributes" do
        put :update, :id => @discography, :discography => @attr
        @discography.reload
        @discography.title.should == @attr[:title]
      end

      it "should redirect to the discography index page" do
        put :update, :id => @discography, :discography => @attr
        response.should redirect_to(discographies_path)
      end
    end
  end

  describe "authentication of edit/update pages" do

    before(:each) do
      @discography = Factory(:discography)
      @user = Factory(:user)
    end

    describe "for non-signed-in users" do

      it "should deny access to 'edit'" do
        get :edit, :id => @discography
        response.should redirect_to(signin_path)
      end

      it "should deny access to 'update'" do
        put :update, :id => @discography, :user => {}
        response.should redirect_to(signin_path)
      end
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      @discography = Factory(:discography)
      @user = Factory(:user)
      test_sign_in(@user)
    end

    it "should destroy the discography" do
      lambda do
        delete :destroy, :id => @discography
      end.should change(Discography, :count).by(-1)
    end

    it "should redirect to the discographies index page" do
      delete :destroy, :id => @discography
      response.should redirect_to(discographies_path)
    end
  end

  describe "authentication of destroy action" do

    before(:each) do
      @discography = Factory(:discography)
      @user = Factory(:user)
    end

    describe "for non-signed-in users" do

      it "should deny access" do
        delete :destroy, :id => @discography
        response.should redirect_to(signin_path)
      end
    end
  end
end
