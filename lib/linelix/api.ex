defmodule Linelix.API do
  @moduledoc """
  Provides basic functionalities for Telegram Bot API.
  """

  # alias Linelix.Model.Error

  @channel_access_token Application.get_env(:linelix, :token)
  @default_timeout 5
  @base_url "https://api.line.me/v2/bot"
  @content_type_json ["Content-Type": "application/json"]
  @authorization ["Authorization": "Bearer #{@channel_access_token}"]

  def build_messages(messages) do
    messages
    |> Enum.map(fn(text) -> %{type: "text", text: text} end)
  end

  def request(:send_reply, reply_token, messages) do
    messages = build_messages(messages)

    {:ok, body} =
    %{
      replyToken: reply_token,
      messages: messages
    }
    |> Poison.encode()

    IO.inspect(body)
    IO.inspect(@authorization)

    @base_url <> "/message/reply"
    |> HTTPoison.post(body, @content_type_json ++ @authorization)
  end
end
