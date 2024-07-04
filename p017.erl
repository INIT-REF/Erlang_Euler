%% Solution for Project Euler prolem 017

-module(p017).
-export([solve/0]).

ones() -> array:from_list([0, 3, 3, 5, 4, 4, 3, 5, 5, 4]).
teens() -> array:from_list([3, 6, 6, 8, 8, 7, 7, 9, 8, 8]).
tens() -> array:from_list([0, 0, 6, 6, 5, 5, 5, 7, 6, 6]).
hundreds() -> array:from_list([0, 10, 10, 12, 11, 11, 10, 12, 12, 11]).

%init sum with 11 (for 1000) + 9 * 99 * 3 (for "and" in hundreds)
sum() -> sum(1, 11 + 9 * 99 * 3).
sum(1000, S) -> S;
sum(N, S) when N rem 100 < 10 ->
    sum(N + 1, S + array:get(N rem 10, ones()) + 
        array:get(N div 100, hundreds()));

sum(N,S) when N rem 100 < 20 ->
    sum(N + 1, S + array:get(N rem 10, teens()) + 
        array:get(N div 100, hundreds()));

sum(N,S) -> sum(N + 1, S + array:get(N rem 10, ones()) +
                array:get(N rem 100 div 10, tens()) +
                array:get(N div 100, hundreds())).

solve() -> sum().
