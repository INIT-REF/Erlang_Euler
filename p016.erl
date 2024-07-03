%% Solution for Project Euler prolem 016

-module(p016).
-export([solve/0]).

digitsum(N) -> digitsum(N, 0).
digitsum(0, S) -> S;
digitsum(N, S) -> digitsum(N div 10, S + N rem 10).

solve() -> digitsum(trunc(math:pow(2, 1000))).
