%% Solution for Project Euler prolem 028

-module(p028).
-export([solve/0]).

diasum(Size) -> diasum(Size, 1, 3, 5).
diasum(Size, Sum, N, I) ->
    case I > 2 * Size + 2 of
        true -> Sum;
        false -> diasum(Size, Sum + N, N + 2 * (I div 4), I + 1)
    end.

solve() -> diasum(1001).
