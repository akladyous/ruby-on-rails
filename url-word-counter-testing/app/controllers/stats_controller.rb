class StatsController < ApplicationController
  def index
    @stats = Stats.tokenize(params[:post_id], exclude: ["lorem", "ipsum"])
  end
end
