%% Solution for Project Euler prolem 021

-module(p021).
-export([solve/0]).

divsum(N) -> lists:sum([X || X <- lists:seq(1, N div 2), N rem X == 0]).

amicables(Limit) -> amicables(Limit, 0).
amicables(0, S) -> S;
amicables(N, S) ->
    case N == divsum(divsum(N)) andalso N /= divsum(N) of
        true -> amicables(N - 1, S + N);
        false -> amicables(N - 1, S)
    end.

solve() -> amicables(10000).
