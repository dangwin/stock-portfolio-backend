class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user
        else
            head status: :unprocessable_entity
        end
    end

    def update
        @user = User.find(params[:id])

        if @user && @user.update(user_params)
            render json: @user
        else
            head status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])

        if @user && @user.destroy
            head status: :success
        else
            head status: :not_found
        end
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end

end
