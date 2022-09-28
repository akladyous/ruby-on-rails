class DemoController < ApplicationController
    def index
        @test = [1,2,3,4,5]
        render :index, locals: {name: 'paolo', age: 30}
    end

    def create
    end

    def update
    end

    def delete
    end
end
