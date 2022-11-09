class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def index
    @infos = Info.all
  end

  def show
  end

  def new
    @info = Info.new
  end

  def edit
  end

  def create
    @info = Info.new(people_params)
    respond_to do |format|
      if @info.save
        format.html { redirect_to info_url(@info), notice: 'created' }
      else
        format.html { redirect_to :new, notice: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @info.update
        format.html { redirect_to info_url(@info), notice: 'updated' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_utl, notice: 'deleted' }
    end
  end

  private

  def people_params
    params.require(:info).permit(:name)
  end
  def set_info
    @info = Info.find(params[:id])
  end
end
