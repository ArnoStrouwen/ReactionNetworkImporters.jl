using Documenter
using ReactionNetworkImporters

cp("./docs/Manifest.toml", "./docs/src/assets/Manifest.toml", force = true)
cp("./docs/Project.toml", "./docs/src/assets/Project.toml", force = true)

include("pages.jl")

mathengine = MathJax3(Dict(:loader => Dict("load" => ["[tex]/require", "[tex]/mathtools"]),
                           :tex => Dict("inlineMath" => [["\$", "\$"], ["\\(", "\\)"]],
                                        "packages" => [
                                            "base",
                                            "ams",
                                            "autoload",
                                            "mathtools",
                                            "require",
                                        ])))

makedocs(sitename = "ReactionNetworkImporters.jl",
         authors = "Samuel Isaacson",
         format = Documenter.HTML(; analytics = "UA-90474609-3",
                                  assets = ["assets/favicon.ico"],
                                  mathengine,
                                  prettyurls = (get(ENV, "CI", nothing) == "true"),
                                  canonical = "https://docs.sciml.ai/ReactionNetworkImporters/stable/"),
         modules = [ReactionNetworkImporters],
         checkdocs = :exports, warnonly = [:missing_docs],
         clean = true, doctest = false, linkcheck = true,
         pages = pages)

deploydocs(repo = "github.com/SciML/ReactionNetworkImporters.jl.git";
           push_preview = true)
