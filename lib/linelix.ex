defmodule Linelix do
  @moduledoc """
  Provides access to LINE Bot API.

  ## Reference
  https://developers.line.me/en/docs/messaging-api/reference/#text
  """

  import Linelix.API

  def send_reply(reply_token, messages) do
    request(:send_reply, reply_token, messages) |> response()# return
  end

  def send_push_message(target_id, messages) do
    request(:send_push_message, target_id, messages) |> response()# return
  end

  def send_multicast_message(target_ids, messages) do
    request(:send_multicast_message, target_ids, messages) |> response()# return
  end

  defp response({:ok, response}) do
     response |> Map.get(:body) |> Poison.decode!(keys: :atoms)
  end
end
