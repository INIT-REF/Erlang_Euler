%% Solution for Project Euler prolem 032

-module(p032).
-export([solve/0]).

ispd(A, B, C) -> ispd(A, B, C, []).
ispd(0, 0, 0, L) -> lists:sort(L) == lists:seq(1, 9);
ispd(0, 0, C, L) -> ispd(0, 0, C div 10, L ++ [C rem 10]);
ispd(0, B, C, L) -> ispd(0, B div 10, C, L ++ [B rem 10]);
ispd(A, B, C, L) -> ispd(A div 10, B, C, L ++ [A rem 10]).

pdprods() -> pdprods(1, 1234, array:new([{size, 9877},{default, 0}])).
pdprods(100, _, P) -> P;
pdprods(A, B, P) when A * B > 9876 -> pdprods(A + 1, 1234 div (A + 1), P);
pdprods(A, B, P) ->
    case ispd(A, B, A * B) of
        true -> pdprods(A, B + 1, array:set(A * B, 1, P));
        false -> pdprods(A, B + 1, P)
    end.

pdpsum() -> pdpsum(pdprods(), 0, 0).
pdpsum(_, 9877, S) -> S;
pdpsum(P, I, S) ->
    case array:get(I, P) of
        1 -> pdpsum(P, I + 1, S + I);
        0 -> pdpsum(P, I + 1, S)
    end.

solve() -> pdpsum().
