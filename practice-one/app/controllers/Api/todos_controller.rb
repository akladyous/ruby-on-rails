class Api::TodosController < Api::MainController
    def index
        @todos = Todo.all
        render json: @todos
    end

    def show
        @todo = Todo.find_by_id(params[:id])
        render json: @todo
    end
end
