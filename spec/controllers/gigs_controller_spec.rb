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
end
