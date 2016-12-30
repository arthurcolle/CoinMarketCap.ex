defmodule CoinMarketCap do
  def data_dump do
    HTTPoison.start
    %HTTPoison.Response{body: body} = HTTPoison.get! "https://api.coinmarketcap.com/v1/ticker/"
    Poison.decode!(body)
  end

  def specific_currency_data(currency_string) do
    Enum.filter(CoinMarketCap.data_dump, fn(x) -> x["name"] == currency_string end )
  end
end
