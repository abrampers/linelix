defmodule Linelix do
  @moduledoc """
  Provides access to LINE Bot API.

  ## Reference
  https://developers.line.me/en/docs/messaging-api/reference/#text
  """

  alias Linelix.Model.{User, Message, Update, UserProfilePhotos, File, Error}

  import Linelix.API

  def send_reply(reply_token, messages) do
    request(:send_reply, reply_token, messages) |> response()# return
  end

  # def send_push_message() do
  #   request(:send_reply, reply_token, messages) |> response()# return
  # end
  #
  # def send_multicast_message() do
  #   request(:send_reply, reply_token, messages) |> response()# return
  # end

  defp response({:ok, response}) do
     response |> Map.get(:body) |> Poison.decode!(keys: :atoms)
  end
end
