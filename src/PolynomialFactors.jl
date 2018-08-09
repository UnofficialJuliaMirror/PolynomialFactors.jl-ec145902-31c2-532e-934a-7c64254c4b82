
module PolynomialFactors


## TODO
## * performance is still really poor for larger degrees.


using AbstractAlgebra
using Combinatorics
using Primes
import Primes: factor
import LinearAlgebra: norm, vecdot, I


include("utils.jl")
include("polyutils.jl")
include("factor_zp.jl")
include("lll.jl")
include("factor_zx.jl")

export poly_factor, factormod
#export factor, rational_roots, factormod


end # module
