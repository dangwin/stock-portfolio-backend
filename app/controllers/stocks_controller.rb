class StocksController < ApplicationController
    before_action :set_user

    def index
        @stocks = @user.stocks
        render json: @stocks.to_json(only: [:id, :symbol, :quantity, :name], methods: [:current_price])
    end

    def show
        @stock = @user.stocks.find(params[:id])
    end

    def create
        @stock = @user.stocks.build(stock_params)

        if @stock.save
            render json: @stock
        else
            head status: :unprocessable_entity
        end
    end

    def update
        @stock = @user.stocks.find(params[:id])

        if @stock && @stock.update(stock_params)
            render json: @stock
        else
            head status: :unprocessable_entity
        end
    end

    def destroy
        @stock = @user.stocks.find(params[:id])

        if @stock && @stock.destroy
            head status: :success
        else
            head status: :not_found
        end
    end

    def price
        @stock = Stock.new(symbol: params[:symbol])
        render json: @stock.current_price
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def stock_params
        params.require(:stock).permit(:name, :symbol, :quantity)
    end

end
