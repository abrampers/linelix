defmodule Linelix do
  @moduledoc """
  Provides access to LINE Bot API.

  ## Reference
  https://developers.line.me/en/docs/messaging-api/reference/#text
  """

  import Linelix.API

  def send_reply(reply_token, messages) do
    request(:send_reply, reply_token, messages)# return
  end

  def send_push_message() do

  end

  def send_multicast_message() do

  end
end
