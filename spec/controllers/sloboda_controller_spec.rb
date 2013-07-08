require 'spec_helper'

describe SlobodaController do

  describe "GET 'projects'" do
    it "returns http success" do
      get 'projects'
      response.should be_success
    end
  end

  describe "GET 'managers'" do
    it "returns http success" do
      get 'managers'
      response.should be_success
    end
  end

  describe "GET 'customers'" do
    it "returns http success" do
      get 'customers'
      response.should be_success
    end
  end

  describe "GET 'currency'" do
    it "returns http success" do
      get 'currency'
      response.should be_success
    end
  end

  describe "GET 'areas'" do
    it "returns http success" do
      get 'areas'
      response.should be_success
    end
  end

end
