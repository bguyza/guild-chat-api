class MessagesController < ApplicationController

  # GET /messages
  def index
    @messages = Message.all

    render json: @messages
  end

  # GET /messages/1
  def show
    @message = Message.find(params[:id])
    render json: @message
  end

  # GET /messages/recent_for_user
  def recent_for_user
    last30 = params[:last30] || false
    if params[:sender_id] && params[:recipient_id]
      @messages = Message.recent_messages(params[:sender_id], params[:recipient_id], last30)
    end
    render json: @messages
  end

  # GET /messages/recent_all
  def recent_all
    last30 = params[:last30] || false
    render json: Message.all_recent_messages(last30)
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:chat_id, :text, :sent_at, :user_id)
  end
end
