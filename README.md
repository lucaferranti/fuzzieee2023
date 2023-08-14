# FuzzyLogic.jl experiments for FUZZ-IEEE 2023

This repository contains the codes for the experiments in the paper [FuzzyLogic.jl: a Flexible Library for Efficient and Productive Fuzzy Inference](https://arxiv.org/abs/2306.10316) to be presented at the conference [fuzzieee 2023](https://fuzz-ieee.org/).

## Setup

1. If you haven't already install Julia. The recommended way is via [juliaup](https://github.com/JuliaLang/juliaup).
2. Open a terminal in the directory of this repository and run `julia --project`. This will start a julia session and activate the current environment.
3. The very first time you run these experiments, you will probably need to install the dependencies, to do so run

```julia
import Pkg. Pkg.instantiate()
```

4. You are now setup! Each experiment from the paper is in its own folder ('tipper', 'denoise', 'wall_robot'). You can run a file from the REPL by doing `include("file_name.jl")`
