using ReactionNetworkImporters, Test

@time begin
    @time @testset "BNG Repressilator Test" begin include("test_repressilator_odes.jl") end
    @time @testset "BNG Higher Order Test" begin include("test_higherorder_odes.jl") end
end