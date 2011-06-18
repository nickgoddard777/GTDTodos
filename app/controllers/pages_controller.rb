class PagesController < ApplicationController
  def home
    @title = "Home"
    @menuoption = "home"
  end

  def contact
    @title = "Contact"
    @menuoption = "home"
  end

  def about
    @title = "About"
    @menuoption = "home"
  end

end

