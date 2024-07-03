%% My solution to Project Euler prolem 009

-module(p009).
-export([solve/0]).

tri(R, S, T) -> [R + S, R + T, R + S + T].
rs2(R) -> R * R div 2.

dickson() -> dickson(2, 1, []).
dickson(_, _, [A, B, C]) when A + B + C == 1000 -> A * B * C;
dickson(R, D, _) ->
    case D * D > rs2(R) of
        true -> dickson(R + 2, 1, []);
        false -> case 0 == rs2(R) rem D of
                     true -> dickson(R, D + 1, tri(R, D, rs2(R) div D));
                     false -> dickson(R, D + 1, [])
                 end
    end.

solve() -> dickson().
