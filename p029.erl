%% Solution for Project Euler prolem 029

-module(p029).
-export([solve/0]).

l() -> lists:seq(2, 100).

solve() -> length(lists:uniq([trunc(math:pow(A, B)) || A <- l(), B <- l()])).
