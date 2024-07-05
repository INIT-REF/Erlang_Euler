%% Solution for Project Euler prolem 030

-module(p030).
-export([solve/0]).

d5p(N) -> d5p(N, []).
d5p(0, L) -> lists:sum([X * X * X * X * X || X <- L]);
d5p(N, L) -> d5p(N div 10, L ++ [N rem 10]).

solve() -> lists:sum([X || X <- lists:seq(2, 354294), X == d5p(X)]).
