using FuzzyLogic, BenchmarkTools

fis = readfis(joinpath(@__DIR__, "wall_robot.fcl"))

inputs = (rd = 3.0 * rand(), dq = 2.0 * rand(), o = (900 * rand() - 450), v = rand())

@btime $fis($inputs)