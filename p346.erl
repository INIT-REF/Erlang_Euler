-module(p346).
-export([solve/0]).

strongreps(Limit) -> strongreps(Limit, [1], 2, 4, 7).
strongreps(Limit, R, B, _, _) when B * B >= Limit -> lists:sum(R);
strongreps(Limit, R, B, P, C) ->
    case C < Limit of
        true -> strongreps(Limit, lists:umerge(R, [C]), B, P * B, C + P * B);
        false -> strongreps(Limit, R, B + 1, (B + 1) * (B + 1), 2 + B + (B + 1) * (B + 1))
    end.

solve() -> strongreps(1000000000).
