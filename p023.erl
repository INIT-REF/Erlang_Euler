%% Solution for Project Euler prolem 023

-module(p023).
-export([solve/0]).

divsum(N) -> lists:sum([X || X <- lists:seq(1, N div 2), N rem X == 0]).

abnums(L) -> [X || X <- lists:seq(1, L), X < divsum(X)].

absums(L) -> absums(L, abnums(L), []).
absums(_, [], S) -> lists:uniq(S);
absums(L, [H|T], S) -> absums(L, T, S ++ [H + X || X <- [H|T], H + X < L]).

solve() -> lists:sum(lists:seq(1, 28123) -- absums(28123)).
