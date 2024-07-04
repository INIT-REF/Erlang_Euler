%% Solution for Project Euler prolem 024

-module(p024).
-export([solve/0]).

set() -> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].
facs() -> [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880].

l2i(L) -> l2i(L, 0).
l2i([], N) -> N;
l2i([H|T], N) -> l2i(T, N * 10 + H).

permute(S, P) -> permute(S, P, length(S), []).
permute([], _, _, R) -> l2i(R);
permute(S, P, L, R) -> permute(S -- [lists:nth(P div lists:nth(L, facs()) + 1, S)], 
                               P rem lists:nth(L, facs()), 
                               L - 1, R ++ [lists:nth(P div lists:nth(L, facs()) + 1, S)]).


solve() -> permute(set(), 999999).
