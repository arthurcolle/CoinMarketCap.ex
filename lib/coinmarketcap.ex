defmodule CoinMarketCap do
  alias CoinMarketCap.Config
  HTTPoison.start

  def all_markets do
    %HTTPoison.Response{body: body} = HTTPoison.get!(CoinMarketCap.API.Base.get_base_url <> "ticker/")
    Poison.decode!(body)
  end

  def specific_currency_data(asset) do
    CoinMarketCap.all_markets
    |> Enum.filter(fn(item) -> String.equivalent?(item["name"], asset) end)
  end
end
