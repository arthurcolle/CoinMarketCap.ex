defmodule CoinMarketCap do
  def data_dump do
    HTTPoison.start
    %HTTPoison.Response{body: body} = HTTPoison.get! "https://api.coinmarketcap.com/v1/ticker/"
    Poison.decode!(body)
  end
end
