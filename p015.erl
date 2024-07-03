%% Solution for Project Euler prolem 015

-module(p015).
-export([solve/0]).

paths(N) -> paths(N, 1, 1).
paths(N, P, I) ->
    case I > N of
        true -> P;
        false -> paths(N, P * (N + I) div I, I + 1)
    end.

solve() -> paths(20).
