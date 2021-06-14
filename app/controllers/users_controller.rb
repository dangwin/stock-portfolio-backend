class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = @user.find(params[:id])
    end

    def create
        @user = @user.stocks.build(stock_params)

        if @user.save
            render json: @user
        else
            head status: :unprocessable_entity
        end
    end

    def destroy
        @user = @user.find(params[:id])

        if @suser && @user.destroy
            head status: :success
        else
            head status: :not_found
        end
    end


end
