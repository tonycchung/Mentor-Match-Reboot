class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:splash, :intro]

  def intro
  end

  def splash
  end

  def toolbox
  end

  def feedback
  end

  def calendar
  end
end
