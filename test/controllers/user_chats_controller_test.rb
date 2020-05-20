require 'test_helper'

class UserChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_chat = user_chats(:one)
  end

  test "should get index" do
    get user_chats_url, as: :json
    assert_response :success
  end

  test "should create user_chat" do
    assert_difference('UserChat.count') do
      post user_chats_url, params: { user_chat: { chat_id: @user_chat.chat_id, name: @user_chat.name } }, as: :json
    end

    assert_response 201
  end

  test "should show user_chat" do
    get user_chat_url(@user_chat), as: :json
    assert_response :success
  end

  test "should update user_chat" do
    patch user_chat_url(@user_chat), params: { user_chat: { chat_id: @user_chat.chat_id, name: @user_chat.name } }, as: :json
    assert_response 200
  end

  test "should destroy user_chat" do
    assert_difference('UserChat.count', -1) do
      delete user_chat_url(@user_chat), as: :json
    end

    assert_response 204
  end
end
