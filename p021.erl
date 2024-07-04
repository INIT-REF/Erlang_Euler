%% Solution for Project Euler prolem 021

-module(p021).
-export([solve/0]).

divsum(N) -> lists:sum([X || X <- lists:seq(1, N div 2), N rem X == 0]).

amicables(Limit) -> amicables(1, 0, Limit).
amicables(N, S, Limit) when N == Limit -> S;
amicables(N, S, Limit) ->
    case N == divsum(divsum(N)) andalso N /= divsum(N) of
        true -> amicables(N + 1, S + N, Limit);
        false -> amicables(N + 1, S, Limit)
    end.

solve() -> amicables(10000).
