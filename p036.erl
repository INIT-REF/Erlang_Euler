%% Solution for Project Euler prolem 036

-module(p036).
-export([solve/0]).

l2i(L) -> l2i(L, 0).
l2i([], N) -> N;
l2i([H|T], N) -> l2i(T, N * 10 + H).

ispal(N) -> ispal(N, N, 0).
ispal(N, 0, R) -> N == R;
ispal(N, T, R) -> ispal(N, T div 10, R * 10 + T rem 10).

b2(N) -> b2(N, []).
b2(0, B2) -> l2i(B2);
b2(N, B2) -> b2(N div 2, [N rem 2] ++ B2).

dbps(Limit) -> dbps(Limit, 0).
dbps(N, S) when N =< 0 -> S;
dbps(N, S) ->
    case ispal(N) and ispal(b2(N)) of
        true -> dbps(N - 2, S + N);
        false -> dbps(N - 2, S)
    end.

solve() -> dbps(999999).
