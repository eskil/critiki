# Critiki

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `critiki` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:critiki, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/critiki>.


###

```

      # Nearby places' links
      links = Floki.find(doc, "div[id=nearby-locations] a")
      link_urls = links |> Enum.map(&Floki.attribute(&1, "href"))

      # Address, hours, opened
      Floki.find(doc, ".location-data")


      # description is in "Humuhumu’s description"
      entries = Floki.find(doc, ".location-back .location-main h4")
      for entry <- entries do
        IO.puts inspect entry
      end
```

```
mix run priv/scripts/location_parse.exs samples/location.html
```
