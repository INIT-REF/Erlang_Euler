%% Solution to Project Euler problem 002

-module(p002).
-export([solve/0]).

fib(Limit) -> fib([2,1], Limit).
fib([H|T], Limit) when H > Limit -> T;
fib([H|T], Limit) -> fib([H + hd(T)] ++ [H|T], Limit).
   
solve() -> lists:sum([X || X <- fib(4000000), 0 == X rem 2]).
