using OodleAnalytics
using Documenter

makedocs(;
    modules=[OodleAnalytics],
    authors="tobi-lipede-oodle <tobi.lipede@oodlefinance.com> and contributors",
    repo="https://github.com/tobi-lipede-oodle/OodleAnalytics.jl/blob/{commit}{path}#L{line}",
    sitename="OodleAnalytics.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://tobi-lipede-oodle.github.io/OodleAnalytics.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/tobi-lipede-oodle/OodleAnalytics.jl",
)
