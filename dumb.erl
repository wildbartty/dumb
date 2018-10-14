-module(dumb).

-export([dumb/0]).

dumb() ->
    Dim = fun () -> dumb(0) end,
    timer:tc(Dim).

dumb(4294967296) ->
    ok;
dumb(X) ->
    if X rem 1000000 =:= 0 ->
	    io:format("~p~n", [X]);
       true ->
	    ok
    end,
    dumb(X+1).
