defmodule CoinMarketCap.API.Base do
  alias CoinMarketCap.Config

  @base_url "https://api.coinmarketcap.com/v1/"

  def get_base_url, do: @base_url

  defp handle_response(%HTTPoison.Response{body: body}), do: body

  defp build_url([part, []], requires_auth? \\ false) do
    config = %{ access_key:    Config.get(:ACCESS_KEY),
                access_secret: Config.get(:ACCESS_SECRET) }

    string =
      if requires_auth? do
        "access_secret=#{config.access_secret}"
      else
        "access_key=#{config.access_key}"
      end

    "#{@base_url}#{part}?#{string}"
  end

  @doc """
  General HTTP `GET` request function. Takes a url part
  and optionally a token and list of params.
  """
  def get(url_part, params \\ []) do
    [url_part, params]
      |> build_url()
      |> HTTPoison.get!
      |> handle_response
      |> Poison.decode!
  end

  @doc """
  General HTTP `POST` request function. Takes a url part,
  and optionally a token, data Map and list of params.
  """
  def post(url_part, data \\ "", params \\ []) do
    [url_part, params]
      |> build_url()
      |> HTTPoison.post!(data)
      |> Poison.decode!
  end

  @doc """
  General HTTP `DELETE` request function. Takes a url part
  and optionally a token and list of params.
  """
  def delete(url_part, params \\ []) do
    [url_part, params]
      |> build_url()
      |> HTTPoison.delete!
      |> Poison.decode!
  end
end
