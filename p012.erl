%% Solution for Project Euler prolem 012

-module(p012).
-export([solve/0]).

dcans(N) -> [2] ++ lists:seq(3, trunc(math:sqrt(N)), 2).

ndivs(N) -> ndivs(N, dcans(N), 1, 1).
ndivs(N, D, _, Res) when D == [] -> 
    case N > 2 of
        true -> Res * 2;
        false -> Res
    end;

ndivs(N, [H|T], C, Res) ->
    case 0 == N rem H of
        true -> ndivs(N div H, [H|T], C + 1, Res);
        false -> ndivs(N, T, 1, Res * C)
    end.

tri500divs() -> tri500divs(1, 2).
tri500divs(Tri, I) -> 
    case ndivs(Tri) > 500 of
        true -> Tri;
        false -> tri500divs(Tri + I, I + 1)
    end.

solve() -> tri500divs().
