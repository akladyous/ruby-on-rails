class ProvaController < ApplicationController
    def index
        return render('prova/index') unless params.has_key?(:id)
            


        if params[:id].to_i < 5
            redirect_to(controller: 'welcome', action: 'index')
        else
            render('test_two/index')
        end
    end
end
