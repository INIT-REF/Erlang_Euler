%% Solution for Project Euler prolem 025

-module(p025).
-export([solve/0]).


fib(L) -> fib(L, 2, 1, 1).
fib(L, I, F1, F2) ->
    case L == length(integer_to_list(F2)) of
        true -> I;
        false -> fib(L, I + 1, F2, F1 + F2)
    end.

solve() -> fib(1000).
