class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :update, :destroy]

  # GET /chats
  def index
    @chats = Chat.all

    render json: @chats
  end

  # GET /chats/1
  def show
    render json: @chat
  end

  # POST /chats
  def create
    @chat = ChatCreator.call(params[:chat][:user_ids], params[:chat][:name])

    if @chat.valid?
      render json: @chat, status: :created, location: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update(chat_params)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:name, user_ids: [])
  end
end
