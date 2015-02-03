-module(comb).
-export([crossProduct/2, perm/1, printFormat/2]).

% herp
%% combine(Element, [H|T], Accumulator) ->
%%     combine(Element, T, [{Element, H}|Accumulator]);
%% combine(_, [], Accumulator) ->
%%     Accumulator. 
%% 
%% crossProduct(L1, L2) ->
%%     crossProduct(L1, L2, []).
%% crossProduct([H|T], L2, Accumulator) ->
%%     crossProduct(T, L2, combine(H, L2, Accumulator));
%% crossProduct([], _, Accumulator) ->
%%     Accumulator.

crossProduct(L1, L2) ->
    [{A, B} || A <- L1, B <- L2].

printFormat(_, []) ->
    io:format("");
printFormat(Cols, DataList) ->
    try
        {H, T} = lists:split(Cols, DataList),
        io:format("~p\n", [H]),
        printFormat(Cols, T)
    catch
        _:_ ->
            io:format("~p\n", [DataList])
    end.

perm([]) ->
    [[]];
perm(Options) ->
    [[H|T] || H <- Options, T <- perm(Options--[H])].

