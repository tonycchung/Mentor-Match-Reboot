class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:login]

  def login
  end

  def create_account
  end

  def create_profile
  end

  def edit_profile
  end

  def intro
  end

  def dashboard
  end

  def browse
  end

  def toolkit
  end

  def tool
  end

end

