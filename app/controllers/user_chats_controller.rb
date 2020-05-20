class UserChatsController < ApplicationController
  before_action :set_user_chat, only: [:show, :update, :destroy]

  # GET /user_chats
  def index
    @user_chats = UserChat.all

    render json: @user_chats
  end

  # GET /user_chats/1
  def show
    render json: @user_chat
  end

  # POST /user_chats
  def create
    @user_chat = UserChat.new(user_chat_params)

    if @user_chat.save
      render json: @user_chat, status: :created, location: @user_chat
    else
      render json: @user_chat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_chats/1
  def update
    if @user_chat.update(user_chat_params)
      render json: @user_chat
    else
      render json: @user_chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_chats/1
  def destroy
    @user_chat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_chat
      @user_chat = UserChat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_chat_params
      params.require(:user_chat).permit(:chat_id, :name)
    end
end
