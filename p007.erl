%% My solution to Project Euler prolem 007
%% The limit for the prime sieve can be found by the fact that
%% the nth prime is guaranteed to be < n * (ln(n) + ln(ln(n)))

-module(p007).
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

find10001st(S) -> find10001st(S, 3, 1).
find10001st(_, I, 10001) -> I - 2;
find10001st(S, I, C) ->
    case 1 == array:get(I, S) of
        true -> find10001st(S, I + 2, C + 1);
        false -> find10001st(S, I + 2, C)
    end.

solve() -> find10001st(primes(114500)).
