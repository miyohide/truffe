require 'spec_helper'

describe DiscographiesController do
  render_views

  describe "GET 'index'" do

    it "should have the right title" do
      get :index
      response.should have_selector("h1.page_title", :content => @page_title)
    end
  end
end
