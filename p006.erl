%% Solution to Project Euler problem 006

-module(p006).
-export([solve/0]).

solve() -> solve(lists:seq(1, 100)).
solve(L) -> trunc(math:pow(lists:sum(L), 2)) - lists:sum([X * X || X <- L]).
