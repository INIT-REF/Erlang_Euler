%% Solution for Project Euler prolem 020

-module(p020).
-export([solve/0]).

fact(N) -> fact(N, 1).
fact(0, F) -> F;
fact(N, F) -> fact(N - 1, F * N).

digitsum(N) -> digitsum(N, 0).
digitsum(0, S) -> S;
digitsum(N, S) -> digitsum(N div 10, S + N rem 10).

solve() -> digitsum(fact(100)).
