defmodule Linelix.API do
  @moduledoc """
  Provides basic functionalities for Telegram Bot API.
  """

  # alias Linelix.Model.Error

  @default_timeout 5
  @base_url "https://api.line.me/v2/bot"
  @content_type_json ["Content-Type": "application/json"]

  defp build_messages(messages) do
    messages
    |> Enum.map(fn(message) -> convert_message(message) end)
  end

  defp convert_message({:text, string}) do
    %{type: "text", text: string}# return
  end

  defp convert_message({:sticker, package_id, sticker_id}) do
    %{type: "sticker", packageId: package_id, stickerId: sticker_id}# return
  end

  defp convert_message({:image, original_content_url, preview_image_url}) do
    %{type: "image", originalContentUrl: original_content_url, previewImageUrl: preview_image_url}# return
  end

  defp convert_message({:video, original_content_url, preview_image_url}) do
    %{type: "video", originalContentUrl: original_content_url, previewImageUrl: preview_image_url}# return
  end

  defp convert_message({:audio, original_content_url, duration}) do
    %{type: "audio", originalContentUrl: original_content_url, duration: duration}# return
  end

  defp convert_message({:location, title, address, latitude, longitude}) do
    %{type: "location", title: title, address: address, latitude: latitude, longitude: longitude}# return
  end

  def request(:send_reply, reply_token, messages) do
    IO.puts("send_reply called")
    messages = build_messages(messages)

    {:ok, body} =
    %{
      replyToken: reply_token,
      messages: messages
    }
    |> Poison.encode()

    @base_url <> "/message/reply"
    |> HTTPoison.post(body, @content_type_json ++ @authorization)
  end

  def request(:send_push_message, target_id, messages) do
    IO.puts("send_push_message called")
    messages = build_messages(messages)

    {:ok, body} =
    %{
      to: target_id,
      messages: messages
    }
    |> Poison.encode()

    @base_url <> "/message/push"
    |> HTTPoison.post(body, @content_type_json ++ @authorization)
  end

  def request(:send_multicast_message, target_ids, messages) do
    IO.puts("send_multicast_message called")
    messages = build_messages(messages)

    {:ok, body} =
    %{
      to: target_ids,
      messages: messages
    }
    |> Poison.encode()

    @base_url <> "/message/multicast"
    |> HTTPoison.post(body, @content_type_json ++ ["Authorization": "Bearer #{Application.get_env(:linelix, :token)}"])
  end
end
