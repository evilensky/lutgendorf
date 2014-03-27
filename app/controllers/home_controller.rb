class HomeController < ApplicationController
  before_filter :authenticate_participant!

  def index
  end
end