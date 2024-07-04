%% Solution for Project Euler prolem 019

-module(p019).
-export([solve/0]).

dim(Year) ->
    case 0 == Year rem 4 of
        false -> [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        true -> [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end.

sundays() -> sundays(1901, 1, 1, 2, 0).
sundays(2001, _, _, _, S) -> S;
sundays(Y, M, 1, CD, S) when CD rem 7 == 0 -> sundays(Y, M, 2, CD + 1, S + 1);
sundays(Y, 13, _, CD, S) -> sundays(Y + 1, 1, 2, CD, S);
sundays(Y, M, D, CD, S) -> 
    case D == lists:nth(M, dim(Y)) of
        true -> sundays(Y, M + 1, 1, CD + 1, S);
        false -> sundays(Y, M, D + 1, CD + 1, S)
    end.

solve() -> sundays().
