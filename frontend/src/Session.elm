module Session exposing (..)

import App
import Html exposing (Html, div, node)


type alias Session =
    { user : DataTypes.User }
