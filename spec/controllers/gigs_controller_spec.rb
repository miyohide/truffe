require 'spec_helper'

describe GigsController do
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

    it "should have the page title" do
      get :index
      response.should have_selector("h1.page_title", :content => @page_title)
    end
  end

  describe "GET 'edit'" do

    before(:each) do
      @gig  = Factory(:gig)
      @user = Factory(:user)
      test_sign_in(@user)
    end

    it "should be successful" do
      get :edit, :id => @gig
      response.should be_success
    end

    it "should have the right title" do
      get :edit, :id => @gig
      response.should have_selector("title", :content => @page_title)
    end
  end

  describe "PUT 'update'" do

    before(:each) do
      @gig  = Factory(:gig)
      @user = Factory(:user)
      test_sign_in(@user)
    end

    describe "failure" do

      before(:each) do
        @attr = { :gig_date => "",
                  :gig_date_end => "",
                  :gig_title => "",
                  :group => "",
                  :location => "",
                  :charge => "",
                  :players => "",
                  :comment => "",
                  :recommend => "0",
                  :start_time => "19:00:00" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @gig, :gig => @attr
        response.should render_template('edit')
      end

      it "should have the right title" do
        put :update, :id => @gig, :gig => @attr
        response.should have_selector("h2", :content => "Edit gig")
      end
    end

    describe "success" do
      before(:each) do
        @attr = { :gig_date => "2014-01-01 00:00:00",
                  :gig_date_end => "2014-01-02 00:00:00",
                  :gig_title => "The New Year Live",
                  :group => "Elastic Band",
                  :location => "JJ Club Tokyo",
                  :charge => "2500",
                  :players => "Joshua(ts) McBride(b)",
                  :comment => "This is the first live for our band.",
                  :recommend => "1",
                  :start_time => "19:00:00" }
      end

      it "should change the gig's attributes" do
        put :update, :id => @gig, :gig => @attr
        @gig.reload
        @gig.gig_date == @attr[:gig_date]
      end

      it "should redirect to the gig index page" do
        put :update, :id => @gig, :gig => @attr
        response.should redirect_to(gigs_path)
      end
    end
  end

  describe "authentication of edit/update pages" do

    before(:each) do
      @gig = Factory(:gig)
      @user = Factory(:user)
    end

    describe "for non-signed-in users" do

      it "should deny access to 'edit'" do
        get :edit, :id => @gig
        response.should redirect_to(signin_path)
      end

      it "should deny access to 'update'" do
        put :update, :id => @gig, :user => {}
        response.should redirect_to(signin_path)
      end
    end
  end
end
