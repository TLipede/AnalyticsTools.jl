using Plots
using RecipesBase


function get_width_bounds(mid_point_x, interval_width)
    half_width = 0.5 * interval_width
    return mid_point_x .+ [-half_width, half_width]
end

function get_interval_vertices(width_bounds, length_bounds)
    lower_bound_width, upper_bound_width = width_bounds
    lower_bound_length, upper_bound_length = length_bounds
    vertices_x = [
        lower_bound_width,
        lower_bound_width,
        upper_bound_width,
        upper_bound_width
    ]
    vertices_y = [
        lower_bound_length,
        upper_bound_length,
        upper_bound_length,
        lower_bound_length
    ]
    return vertices_x, vertices_y
end

@shorthands confidenceinterval

@recipe function f(
        ::Type{Val{:confidenceinterval}},
        args...;
        interval_width=0.75,
        interval_color=:skyblue,
        line_color=:black
)
    interval_data = args[2]
    mid_point_x = plotattributes[:series_plotindex]
    width_bounds = get_width_bounds(mid_point_x, interval_width)

    legend := false
    @series begin
        # Confidence Interval Bar
        seriestype := :shape
        seriesalpha --> 0.5
        fillcolor := interval_color
        length_bounds = [interval_data[1], interval_data[3]]
        vertices = get_interval_vertices(width_bounds, length_bounds)
        x := vertices[1]
        y := vertices[2]
        ()
    end

    @series begin
        seriestype := :shape
        seriescolor := line_color
        line_value = interval_data[2]
        x := width_bounds
        y := [line_value, line_value]
        ()
    end
end
