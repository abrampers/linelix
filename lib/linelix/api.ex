defmodule Linelix.API do
  @moduledoc """
  Provides basic functionalities for Telegram Bot API.
  """

  @default_timeout 5
  @base_url "https://api.line.me/v2/bot"

  defp token, do: config_or_env(:token)
  defp recv_timeout, do: config_or_env(:recv_timeout) || @default_timeout
  defp authorization(), do: ["Authorization": "Bearer #{token}"]
  defp content_type("json"), do: ["Content-Type": "application/json"]

  defp config_or_env(key) do
    case Application.fetch_env(:linelix, key) do
      {:ok, {:system, var}} -> System.get_env(var)
      {:ok, {:system, var, default}} ->
        case System.get_env(var) do
          nil -> default
          val -> val
        end
      {:ok, value} -> value
      :error -> nil
    end
  end

  # defp process_response(response, method) do
  #   case decode_response(response) do
  #     {:ok, true} -> :ok
  #     {:ok, result} -> {:ok, Nadia.Parser.parse_result(result, method)}
  #     %{ok: false, description: description} -> {:error, %Error{reason: description}}
  #     {:error, %HTTPoison.Error{reason: reason}} -> {:error, %Error{reason: reason}}
  #   end
  # end
  #
  # defp decode_response(response) do
  #   with {:ok, %HTTPoison.Response{body: body}} <- response,
  #         %{result: result} <- Poison.decode!(body, keys: :atoms),
  #     do: {:ok, result}
  # end

  def request(:send_reply, reply_token, messages) do
    {:ok, body} =
    %{
      replyToken: reply_token,
      messages: messages
    }
    |> Poison.encode()

    @base_url <> "/message/reply"
    |> HTTPoison.post(body, content_type("json") ++ authorization())
  end
end
