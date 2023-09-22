
-module (pokemon).
-include_lib("nitrogen_core/include/wf.hrl").
-compile(export_all).
-include("pokemon.hrl").

draw_card(Pokemon) ->
    #panel{
        class=[thumbnail__container, noselect],
        body=[
            #panel{class=card__header, body=[
                #panel{class=poke__number, body=["#00",Pokemon#pokemon.number]},
                #button{style="background:transparent; border: none; cursor: pointer;", 
                    postback = {show_details, Pokemon},
                    body=[
                        #panel{class=info__icon,
                            body="<svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 512 512\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z\"></path></svg>"
                        }
                    ]
                }
            ]},
            #image{
                class=image__container,
                image=["/images/", Pokemon#pokemon.image]
            },
            #panel{class='card-title',body=Pokemon#pokemon.name}
        ]
    }.

draw_pokemon_details(Pokemon) ->
    ?PRINT(Pokemon),
    #panel{
        class=pokemon_details_container,
        style="width:800px; height:800px; margin:0 auto;",
        body=[
            #panel{class='card-title',style="background: linear-gradient(#a8ff98,#d6a2e4);",body=Pokemon#pokemon.name},
            #panel{
                class=box,
                style="background: linear-gradient(#a8ff98,#d6a2e4);",
                body=[
                    #panel{body=#image{style="max-width: 300px;", image=["/images/avatar/", "00",Pokemon#pokemon.number,".jpeg"]}},
                    #panel{
                        style="text-align: left; font-size: 20px; background: white; border-radius: 5px; margin: 10px; padding:10px; width: 100%; height: 100%;",
                        body=["Creator(s): ",Pokemon#pokemon.creators,#br{}, #br{},"First appeared: ",Pokemon#pokemon.creation_date
                    ]}     
                ]
            },
            #panel{style="text-align: right;",
                body=#button{style="text-align: center;", body="Close", postback=close_details}
            }
            
        ]
    }.