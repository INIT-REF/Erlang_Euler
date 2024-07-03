%% Solution for Project Euler problem 005

-module(p005).
-export([solve/0]).

gcd(0, B) -> B;
gcd(A, B) -> gcd(B rem A, A).

lcm(A, B) -> A * B div gcd(A, B).

solve() -> lists:foldl(fun(A, B) -> lcm(A, B) end, 1, lists:seq(2, 20)).
