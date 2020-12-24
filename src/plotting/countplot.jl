using Plots
using RecipesBase
import StatsBase: countmap


@userplot CountPlot

@recipe function f(cp::CountPlot)
    bar_width --> 0.75
    color --> :skyblue
    legend --> nothing
    seriestype := :bar

    data_points = cp.args[1]
    counted_data = sort(countmap(data_points))

    label_ticks = keys(counted_data) |> collect
    count_values = values(counted_data) |> collect

    given_orientation = get(plotattributes, :orientation, nothing)

    if given_orientation == :horizontal
        yticks := get(plotattributes, :yticks, nothing) ==
            nothing ? label_ticks : nothing
        y, x = label_ticks, count_values
    else
        xticks := get(plotattributes, :xticks, nothing) ==
            nothing ? label_ticks : nothing
        x, y = label_ticks, count_values
    end
end
