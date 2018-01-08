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
    |> Enum.map(fn(message) -> convert_message(message) end)
  end

  def convert_message({:text, string}) do
    %{type: "text", text: string}# return
  end

  def convert_message({:sticker, package_id, sticker_id}) do
    %{type: "sticker", packageId: package_id, stickerId: sticker_id}# return
  end

  def convert_message({:image, original_content_url, preview_image_url}) do
    %{type: "image", originalContentUrl: original_content_url, previewImageUrl: preview_image_url}# return
  end

  def convert_message({:video, original_content_url, preview_image_url}) do
    %{type: "video", originalContentUrl: original_content_url, previewImageUrl: preview_image_url}# return
  end

  def convert_message({:audio, original_content_url, duration}) do
    %{type: "audio", originalContentUrl: original_content_url, duration: duration}# return
  end

  def convert_message({:location, title, address, latitude, longitude}) do
    %{type: "location", title: title, address: address, latitude: latitude, longitude: longitude}# return
  end

  def request(:send_reply, reply_token, messages) do
    IO.puts("Request called")
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
