class UsersController < ApplicationController
  def index
    # redirect_to controller: "users", action: "utente"
  end

  def show
  end

  def utente
    @utenti = User.all.pluck(:first_name)
    render("users/utente")
  end
end
