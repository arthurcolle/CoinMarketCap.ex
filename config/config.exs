use Mix.Config
config :coinmarketcap, API_PUBLIC_KEY:  System.get_env("API_PUBLIC_KEY"),
                       API_SECRET_KEY:  System.get_env("API_SECRET_KEY")
