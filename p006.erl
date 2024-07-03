%% Solution to Project Euler problem 006

-module(p006).
-export([solve/0]).

ssd(Limit) -> ssd(0, 0, Limit).
ssd(A, B, 0) -> A * A - B;
ssd(A, B, N) -> ssd(A + N, B + N * N, N - 1).

solve() -> ssd(100).
