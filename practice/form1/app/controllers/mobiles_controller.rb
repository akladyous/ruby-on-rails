class MobilesController < ApplicationController
    before_action :set_mobile, only: [:show, :edit, :update,:destroy]

    def index
        @mobiles = Mobile.all
    end

    def show
        @mobile = Mobile.find(params[:id])
    end

    def new
        @mobile = Mobile.new
    end

    def create
        @mobile = Mobile.new(mobile_params)
        respond_to do |format|
            if @mobile.save
                format.html { redirect_to mobile_url(@mobile), notice: 'Mobile was successfully created'}
                format.json { render :show, status: :created, location: @mobile }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @mobile.errors, status: :unprocessable}
            end
        end
    end

    def edit
    end

    def update
        if @mobile.update
            redirect_to mobile_url(@mobile), notice: 'Mobile updated successfully'
        else
            render :edit, status: unprocessable_entity
        end
    end


    private
        def mobile_params
            params.require(:mobile).permit(:brand)
        end

        def set_mobile
            @mobile = Mobile.find(params[:id])
        end
end
