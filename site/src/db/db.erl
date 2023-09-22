-module (db).
-include_lib("nitrogen_core/include/wf.hrl").
-compile(export_all).
-include("../elements/pokemon.hrl").

get_pokemons() -> [
    #pokemon {
        name="Erlang",
        number="1",
        image="erlang.png",
        creators=["Joe, Robert & Mike"],
        creation_date="1986"
    },
    #pokemon {
        name="Elixir",
        number="2",
        image="elixir.png",
        creators=["José Valim"],
        creation_date="2011"
    },
    #pokemon {
        name="LFF",
        number="3",
        image="lfe.png",
        creators=["Robert Virding"],
        creation_date="2008"
    },
    #pokemon {
        name="Gleam",
        number="4",
        image="gleam.png",
        creators=["Louis Pilfold"],
        creation_date="2019"
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
        creators=["Juan facorro"],
        creation_date="2015"
    }
].
