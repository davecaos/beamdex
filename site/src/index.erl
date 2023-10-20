-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-import(pokemon, [draw_card/3,draw_pokemon_details/1]).
-import(db, [get_pokemons/0]).

main() -> #template { file="./priv/templates/bare.html" }.

title() -> "Beamdex".

body()  -> 
    #panel{
        style="width:800px; margin:0 auto;text-align: center;",
        body=[
            draw_image_title(),
            #panel{id=pokemon_body, 
                body=draw_pokemon_main_grid()
            }
        ]
    }.

draw_image_title() ->
    #image{ class=image__title, image="/images/beamdex.png"}.

split([], _) -> [];
split(L, N) when length(L) < N -> [L];
split(L, N) ->
    {A, B} = lists:split(N, L),
    [A | split(B, N)].

draw_pokemon_main_grid() ->
    PokemonsFromDB = db:get_pokemons(),
    ListPokemonsOnChunksOfThree = split(PokemonsFromDB, 3),
    #panel{style="text-align: center;",
        body=#table{ 
            rows=[ #tablerow{cells=[ #tablecell{body=pokemon:draw_card(Pokemon)} || Pokemon <- List]} || List <- ListPokemonsOnChunksOfThree]
        }
    }.

event({show_details, Pokemon}) ->
    PokemonsDetails = pokemon:draw_pokemon_details(Pokemon),
    wf:update(pokemon_body, PokemonsDetails);

event(close_details) ->
    wf:update(pokemon_body, draw_pokemon_main_grid() ).
