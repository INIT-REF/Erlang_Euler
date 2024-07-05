%% Solution for Project Euler prolem 031

-module(p031).
-export([solve/0]).

coins() -> [1, 2, 5, 10, 20, 50, 100, 200].

count(S) -> count(coins(), 8, S).
count(_, _, S) when S == 0 -> 1;
count(_, _, S) when S < 0 -> 0;
count(_, N, _) when N =< 0 -> 0;
count(C, N, S) -> count(C, N, S - lists:nth(N, C)) + count(C, N - 1, S).

solve() -> count(200).
