%% Solution for Project Euler problem 003
%% Simplified factorization to account for the fact that it is an odd number

-module(p003).
-export([solve/0]).

lpf(N) -> lpf(N, 3).
lpf(1,D) -> D;
lpf(N, D) -> 
    case N rem D == 0 of
        true -> lpf(N div D, D);
        false -> lpf(N, D + 2)
    end.

solve() -> lpf(600851475143).
