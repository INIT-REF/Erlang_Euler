%% Solution to Project Euler problem 004

-module(p004).
-export([solve/0]).

reverse(N) -> reverse(N, 0).
reverse(0, R) -> R;
reverse(N, R) -> reverse(N div 10, R * 10 + N rem 10).

solve() -> solve(lists:seq(100, 999)).
solve(L) -> lists:max([A * B || A <- L, B <- L, A * B == reverse(A * B)]).
