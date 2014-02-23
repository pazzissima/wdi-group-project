class ClipsController < ApplicationController
  def index
    @clips = [{:title => "Song 1", :description => "great", :id => 1}, {:title => "Song 2", :description => "great", :id => 2}, {:title => "Song 3", :description => "great", :id => 3}]

  end

  def new
  end

  def create
    #create random string
  end

  def show
  end

  def destroy
  end

end
