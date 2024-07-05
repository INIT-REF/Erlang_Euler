%% Solution for Project Euler prolem 034

-module(p034).
-export([solve/0]).

facs() -> [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880].

isdfacsum(N) -> isdfacsum(N, N, []).
isdfacsum(N, 0, L) -> N == lists:sum(L);
isdfacsum(N, R, L) -> isdfacsum(N, R div 10, L ++ [lists:nth(1 + R rem 10, facs())]).

solve() -> lists:sum([X || X <- lists:seq(3, 2540160), isdfacsum(X)]).
