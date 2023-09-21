-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-import(pokemon, [draw_card/3,draw_pokemon_details/1]).
-import(db, [get_pokemos/0]).

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


% draw_pokemon_main_grid2() ->
%     #panel{style="text-align: center;",
%         body=#table{ 
%             rows=[ 
%                 #tablerow{cells=[
%                     #tablecell{body=[pokemon:draw_card("Erlang", "1", "erlang.png")]},
%                     #tablecell{body=[pokemon:draw_card("Elixir", "2", "elixir.png")]},
%                     #tablecell{body=[pokemon:draw_card("LFF", "3", "lfe.png")]}
%                 ]},
%                 #tablerow{cells=[
%                     #tablecell{body=[pokemon:draw_card("Gleam", "4", "gleam.png")]},
%                     #tablecell{body=[pokemon:draw_card("Efene", "5", "fn.png")]},
%                     #tablecell{body=[pokemon:draw_card("Clojerl", "6", "clojerl.png")]}
%                 ]}

%             ]}
%     }.
draw_pokemon_main_grid() ->
    ListPokemons = split(db:get_pokemons(), 3),
    #panel{style="text-align: center;",
        body=#table{ 
            rows=[ #tablerow{cells=[  #tablecell{body=pokemon:draw_card(Pokemon)} || Pokemon <- List]} || List <- ListPokemons]
        }
    }.
% pokemon_details({show_details, Number}) ->
%     #panel{
%         class=pokemon_details_container,
%         style="width:800px; height:800px; margin:0 auto;",
%         body=[
%             #panel{class='card-title',style="background: linear-gradient(#a8ff98,#d6a2e4);",body="Erlang"},
%             #panel{
%                 class=box,
%                 style="background: linear-gradient(#a8ff98,#d6a2e4);",
%                 body=[
%                     #panel{body=#image{style="max-width: 300px;", image=["/images/avatar/", "00",Number,".jpeg"]}},
%                     #panel{
%                         style="text-align: left; font-size: 20px;",
%                         body=["Creator(s): Joe Armstrong",#br{}, #br{},"First appeared: 1986"
%                     ]}     
%                 ]
%             },
%             #panel{style="text-align: right;",
%                 body=#button{style="text-align: center;", body="Close", postback=close_details}
%             }
            
%         ]
%     }.

event({show_details, Number}) ->
    PokemonsDetails = pokemon:draw_pokemon_details({show_details, Number}),
    wf:update(pokemon_body, PokemonsDetails);

event(close_details) ->
    wf:update(pokemon_body, draw_pokemon_main_grid() ).
