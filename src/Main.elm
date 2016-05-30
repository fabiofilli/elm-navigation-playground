module Main exposing (..)

import Navigation
import Nav


main : Program Never
main =
    Navigation.program (Navigation.makeParser Nav.hashParser)
        { init = Nav.init
        , update = Nav.update
        , urlUpdate = Nav.urlUpdate
        , view = Nav.view
        , subscriptions = Nav.subscriptions
        }
