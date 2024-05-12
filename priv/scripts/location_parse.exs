defmodule Critiki.LocationParse do
  def parse(file) do
    pattern = ~r{https://www\.critiki\.com/([^"]+)}
    file = File.read!(file)
    matches = Regex.scan(pattern, file)
    for m <- matches do
      IO.inspect m
    end
    {:ok, doc} = Floki.parse_document(file)
    IO.puts inspect doc
    IO.puts "-----------------------------------------------------------------------"
    for {val, idx} <- Enum.with_index(Floki.find(doc, "div[id=nearby-locations] a")) do
      IO.puts "#{idx}: #{inspect val}"
    end
    # IO.puts "-----------------------------------------------------------------------"
    # IO.puts inspect Floki.find(doc, "div[id=nearby-locations] a")
    # IO.puts "-----------------------------------------------------------------------"
    # IO.puts inspect Floki.find(doc, "div[id=nearby-locations] a[href]")
    # IO.puts "-----------------------------------------------------------------------"
    # IO.puts inspect Floki.find(doc, ".location-side")
    # IO.puts "-----------------------------------------------------------------------"
    # IO.puts inspect Floki.find(doc, ".location-back .location-main h4")
    IO.puts "-----------------------------------------------------------------------"
    for {val, idx} <- Enum.with_index(Floki.find(doc, ".location-data .location-datum")) do
      IO.puts "#{idx}: #{inspect val}"
      case Floki.find(val, "i.fa-phone") do
        [] -> :ok
        v ->
          IO.puts "☎️  found an i phone number: #{inspect v}"
      end
      case Floki.find(val, "i.fa-globe") do
        [] -> :ok
        v ->
          IO.puts "🌐 found an i globe: #{inspect v}"
      end
      IO.puts "#{idx}: #{inspect Floki.find(val, "i")}"
    end
  end
end

defmodule Main do
  def run(args) do
    option_parser = OptionParser.parse(args, strict: [])
    case option_parser do
      {_, files, _} ->
        for file <- files do
          Critiki.LocationParse.parse(file)
        end
    end
  end
end

# Main
Main.run(System.argv())
