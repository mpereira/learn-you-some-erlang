-module(recursion).
-compile([export_all]).

factorial(0) -> 1;
factorial(1) -> 1;
factorial(N) -> N * factorial(N - 1).

tail_factorial(X) -> tail_factorial(X, 1).
tail_factorial(0, Accumulator) -> Accumulator;
tail_factorial(X, Accumulator) when X > 0 -> tail_factorial(X - 1, X * Accumulator).

llength([]) -> 0;
llength([_ | T]) -> 1 + llength(T).

tail_length(L) -> tail_length(L, 0).
tail_length([], Accumulator) -> Accumulator;
tail_length([_ | T], Accumulator) -> tail_length(T, Accumulator + 1).

duplicate(0, _) -> [];
duplicate(N, X) when is_integer(N), N > 0 -> [X | duplicate(N - 1, X)].

tail_duplicate(N, X) when is_integer(N) -> tail_duplicate(N, X, []).
tail_duplicate(0, _, Accumulator) -> Accumulator;
tail_duplicate(N, X, Accumulator) -> tail_duplicate(N - 1, X, [X | Accumulator]).

reverse([]) -> [];
reverse([H | T]) -> reverse(T) ++ [H].

tail_reverse(L) -> tail_reverse(L, []).
tail_reverse([], Accumulator) -> Accumulator;
tail_reverse([H | T], Accumulator) -> tail_reverse(T, [H | Accumulator]).

sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H | T], N) -> [H | sublist(T, N - 1)].

sublist_tail(L, N) -> sublist_tail(L, N, []).
sublist_tail(_, 0, Accumulator) -> Accumulator;
sublist_tail([], _, Accumulator) -> Accumulator;
sublist_tail([H | T], N, Accumulator) when N > 0 ->
  sublist_tail(T, N - 1, Accumulator ++ [H]).

zip([], _) -> [];
zip(_, []) -> [];
zip([H1 | T1], [H2 | T2]) -> [{H1, H2} | zip(T1, T2)].

tail_zip(L1, L2) -> tail_zip(L1, L2, []).
tail_zip([], _, Accumulator) -> Accumulator;
tail_zip(_, [], Accumulator) -> Accumulator;
tail_zip([H1 | T1], [H2 | T2], Accumulator) ->
  tail_zip(T1, T2, Accumulator ++ [{H1, H2}]).

partition(_, []) -> [];
partition(P, L) ->
  Smaller = [N || N <- L, N =< P],
  Bigger = [N || N <- L, N > P],
  {Smaller, Bigger}.
