class ChatsController < ApplicationController

  # GET /chats
  def index
    @chats = Chat.all

    render json: @chats
  end

  # GET /chats/1
  def show
    begin
      @chat = Chat.find(params[:id])
      render json: @chat
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Chat not found' }.to_json, status: :not_found
    end
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
    @chat = Chat.find(params[:id])

    if @chat.update(chat_params)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chats/1
  def destroy
    @chat = Chat.find(params[:id])

    @chat.destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:name, user_ids: [])
  end
end
