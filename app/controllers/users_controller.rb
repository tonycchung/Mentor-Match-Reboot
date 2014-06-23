class UsersController < ApplicationController
  before_action: authenticate_user!, except: [:index]

  def index
  end

  def profile
  end

  def mentors
  end

  def mentees
  end
end
