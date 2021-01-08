-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Api.Object.User exposing (..)

import Api.InputObject
import Api.Interface
import Api.Object
import Api.Scalar
import Api.ScalarCodecs
import Api.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


email : SelectionSet (Maybe String) Api.Object.User
email =
    Object.selectionForField "(Maybe String)" "email" [] (Decode.string |> Decode.nullable)


id : SelectionSet (Maybe Api.ScalarCodecs.Id) Api.Object.User
id =
    Object.selectionForField "(Maybe ScalarCodecs.Id)" "id" [] (Api.ScalarCodecs.codecs |> Api.Scalar.unwrapCodecs |> .codecId |> .decoder |> Decode.nullable)


lists :
    SelectionSet decodesTo Api.Object.List
    -> SelectionSet (List (Maybe decodesTo)) Api.Object.User
lists object_ =
    Object.selectionForCompositeField "lists" [] object_ (identity >> Decode.nullable >> Decode.list)