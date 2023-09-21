-module (db).
-include_lib("nitrogen_core/include/wf.hrl").
-compile(export_all).
-include("../elements/pokemon.hrl").

get_pokemons() -> [
    #pokemon {
        name="Erlang",
        number="1",
        image="erlang.png",
        creators=[],
        creation_date="1986"
    },
    #pokemon {
        name="Elixir",
        number="2",
        image="elixir.png",
        creators=[],
        creation_date=undefined
    },
    #pokemon {
        name="LFF",
        number="3",
        image="lfe.png",
        creators=[],
        creation_date=undefined
    },
    #pokemon {
        name="Gleam",
        number="4",
        image="gleam.png",
        creators=[],
        creation_date=undefined
    },
    #pokemon {
        name="Efene",
        number="5",
        image="fn.png",
        creators=["Mariano Guerra"],
        creation_date="2009"
    },
    #pokemon {
        name="Clojerl",
        number="6",
        image="clojerl.png",
        creators=[],
        creation_date=undefined
    }
].
