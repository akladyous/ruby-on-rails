class ExpensiveController < ApplicationController
  def index
  end

  def show 
    if params.include?(:seconds)
        seconds = params.permit(:seconds).fetch(:seconds).to_i
    else
        seconds = 1
    end
    sleep(seconds)
    render json: {message: "total waited time is #{seconds} #{'second'.pluralize(seconds)}"}, status: :ok
  end
end
