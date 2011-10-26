-module(higher_order_functions).
-compile([export_all]).

map(F, L) -> map(F, L, []).

map(_, [], Accumulator) -> Accumulator;
map(F, [H | T], Accumulator) -> map(F, T, Accumulator ++ [F(H)]).

filter(F, L) -> filter(F, L, []).

filter(_, [], Accumulator) -> Accumulator;
filter(F, [H | T], Accumulator) ->
  case F(H) of
    true -> filter(F, T, Accumulator ++ [H]);
    false -> filter(F, T, Accumulator)
  end.

fold(_, Start, []) -> Start;
fold(F, Start, [H | T]) -> fold(F, F(H, Start), T).
