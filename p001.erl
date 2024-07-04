%% Solution for Project Euler problem 001

-module(p001).
-export([solve/0, alternative/0]).

solve() -> lists:sum([X || X <- lists:seq(1, 999), 0 == X rem 3 * X rem 5]).


%% Alternative using lists of multiples

alternative() -> lists:sum(lists:umerge(lists:seq(0, 999, 3), lists:seq(0, 999, 5))).
