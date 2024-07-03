%% Solution for Project Euler prolem 010

-module(p010).
-export([solve/0]).

noprime(S, D, Limit) -> noprime(S, D, D * D, Limit).
noprime(S, _, M, Limit) when M >= Limit -> S;
noprime(S, D, M, Limit) -> noprime(array:set(M, 0, S), D, M + D, Limit).

primes(Limit) -> primes(array:new([{size,Limit},{default,1}]), 2, Limit).
primes(S, D, Limit) when D * D >= Limit -> S;
primes(S, D, Limit) ->
    case 1 == array:get(D, S) of
        false -> primes(S, D + 1, Limit);
        true -> primes(noprime(S, D, Limit), D + 1, Limit)
    end.

primesum(S) -> primesum(S, 3, 2).
primesum(_, I, Sum) when I >= 2000000 -> Sum;
primesum(S, I, Sum) ->
    case 1 == array:get(I, S) of
        true -> primesum(S, I + 2, Sum + I);
        false -> primesum(S, I + 2, Sum)
    end.

solve() -> primesum(primes(2000000)).
