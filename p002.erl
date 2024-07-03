%% Solution for Project Euler problem 002

-module(p002).
-export([solve/0]).

fib(Limit) -> fib([2,1], Limit).
fib([H|T], Limit) -> 
    case H > Limit of 
        true -> T;
        false -> fib([H + hd(T)] ++ [H|T], Limit)
    end.
   
solve() -> lists:sum([X || X <- fib(4000000), 0 == X rem 2]).
