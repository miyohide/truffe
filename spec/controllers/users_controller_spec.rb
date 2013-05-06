require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "should be success" do
      get :new
      response.should be_success
    end

    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => @page_title)
    end

    it "should have the page title" do
      get :new
      response.should have_selector("h1.page_title", :content => @page_title)
    end
  end
end
