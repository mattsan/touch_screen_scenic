defmodule TouchScreenScenic.Scene.Home do
  use Scenic.Scene
  require Logger

  alias Scenic.Graph

  import Scenic.Primitives
  import Scenic.Components

  @text_size 24

  def init(_, _opts) do
    graph =
      Graph.build(font: :roboto, font_size: @text_size)
      |> button("Greet", id: :btn_greet, translate: {200, 140}, width: 80, height: 40)
      |> text("", id: :text_greet, translate: {240, 200}, text_align: :center)

    {:ok, %{graph: graph, text: ""}, push: graph}
  end

  def filter_event({:click, :btn_greet}, _, %{graph: graph, text: text} = state) do
    {caption, text} =
      case text do
        "" -> {"Clear", "Hello!"}
        _ -> {"Greet", ""}
      end

    graph =
      graph
      |> Graph.modify(:btn_greet, &button(&1, caption))
      |> Graph.modify(:text_greet, &text(&1, text))

    {:noreply, %{state | graph: graph, text: text}, push: graph}
  end

  def handle_input(event, _context, state) do
    Logger.info("Received event: #{inspect(event)}")
    {:noreply, state}
  end
end
