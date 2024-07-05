%% Solution for Project Euler prolem 026

-module(p026).
-export([solve/0]).

period(N) -> period(N, 1, 10 rem N).
period (1, P, _) -> P;
period (_, P, 1) -> P;
period(N, _, _) when 0 == N rem 2 -> period(N div 2, 0, 10 rem N);
period(N, _, _) when 0 == N rem 5 -> period(N div 5, 0, 10 rem N);
period(N, P, K) -> period(N, P + 1, K * 10 rem N).

maxperiod(Limit) -> maxperiod(Limit, period(Limit), 0, 0).
maxperiod(1, _, Max, _) -> Max;
maxperiod(N, L, Max, Maxl) ->
    case L > Maxl of
        true -> maxperiod(N - 1, period(N - 1), N, L);
        false -> maxperiod(N - 1, period(N - 1), Max, Maxl)
    end.

solve() -> maxperiod(999).
