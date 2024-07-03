%% Solution to Project Euler problem 003
%% Simplified factorization to account for the fact that it is an odd number

-module(p003).
-export([solve/0]).

lpf(N) -> lpf(N, 3).
lpf(1,D) -> D;
lpf(N, D) when N rem D == 0 -> lpf(N div D, D);
lpf(N, D) -> lpf(N, D + 2).

solve() -> lpf(600851475143).
