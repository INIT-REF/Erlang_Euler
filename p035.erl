%% Solution for Project Euler prolem 035

-module(p035).
-export([solve/0]).

noprime(S, D, Limit) -> noprime(S, D, D * D, Limit).
noprime(S, _, M, Limit) when M >= Limit -> S;
noprime(S, D, M, Limit) -> noprime(array:set(M, 0, S), D, M + D, Limit).

sieve(Limit) -> sieve(array:new([{size,Limit},{default,1}]), 2, Limit).
sieve(S, D, Limit) when D * D >= Limit -> S;
sieve(S, D, Limit) ->
    case 1 == array:get(D, S) of
        false -> sieve(S, D + 1, Limit);
        true -> sieve(noprime(S, D, Limit), D + 1, Limit)
    end.

l2i(L) -> l2i(L, 0).
l2i([], N) -> N;
l2i([H|T], N) -> l2i(T, N * 10 + H).

rotate(N) -> rotate(N, []).
rotate(0, [H|T]) -> l2i(T ++ [H]);
rotate(N, L) -> rotate(N div 10, [N rem 10] ++ L).

circp() -> circp(103, rotate(103), 1, sieve(200)).
circp(N, _, C, _) when N >= 200 -> C;
circp(N, R, C, S) ->
    case array:get(N, S) of
        0 -> circp(N + 2, rotate(N + 2), C, S);
        1 ->
            case N == R of
                true -> circp(N + 2, rotate(N + 2), C + 1, S);
                false -> 
                    case array:get(R, S) of
                        1 -> circp(N, rotate(R), C, S);
                        0 -> circp(N + 2, rotate(N + 2), C, S)
                    end
            end
    end.

solve() -> circp().
