%% Solution for Project Euler prolem 014

-module(p014).
-export([solve/0]).

collatz(N) ->
    case 0 == N rem 2 of
        true -> [N div 2];
        false -> [3 * N + 1]
    end.

cseql(C) ->
   case hd(C) == 1 of
       true -> length(C);
       false -> cseql(collatz(hd(C)) ++ C)
   end.

longest_cseq(N) -> longest_cseq(N, cseql([N]), 0, 0).
longest_cseq(1, _, _, Max) -> Max;
longest_cseq(N, L, Maxl, Max) ->
    case L > Maxl of
        true -> longest_cseq(N - 1, cseql([N - 1]), L, N);
        false -> longest_cseq(N - 1, cseql([N - 1]), Maxl, Max)
    end.

solve() -> longest_cseq(999999). 
