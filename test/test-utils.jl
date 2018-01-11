using PolynomialFactors
using Polynomials
using Compat.Test


## utils
@testset "Testing utils.jl" begin

## nextprime
@test PolynomialFactors.nextprime(4) == 5
@test PolynomialFactors.nextprime(400) == 401
@test PolynomialFactors.nextprime(big(400)) == 401

## EEA
a, b = big(2*3*7), big(3*7*9)
rs, ss, ts = PolynomialFactors.EEA(a, b)
@test reduce(&, [rs[i] - (ss[i] * a + ts[i] * b) == 0 for i in eachindex(rs)])


## bezout
g,u,v = PolynomialFactors.bezout(a,b)
@test u*a + v*b == g


## Chinese remainer theorem
ms = [3,5,7]
vs = [2,3,2]
a = PolynomialFactors.chinese_remainder_theorem(ms, vs)
@test reduce(&, [mod(a, m) == v for (m,v) in zip(ms,vs)])

a = big(12345)
ms = BigInt[11,  13,  17,  19,  23,  29,  31,  37]
vs = BigInt[mod(a, m) for m in ms]
b = PolynomialFactors.chinese_remainder_theorem(ms, vs)
@test a == b

a = big(123456789)
ms = BigInt[101, 103, 107, 109, 113, 127, 131, 137, 139, 149]
vs = BigInt[mod(a, m) for m in ms]
b = PolynomialFactors.chinese_remainder_theorem(ms, vs)
@test a == b

end
