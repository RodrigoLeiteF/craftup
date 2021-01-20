module Route exposing (Route(..), fromUrl, href, parser, replaceUrl, routeToCmd)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)



-- ROUTING


type Route
    = Home
    | CraftingList String
    | CraftingLists
    | Login
    | Register


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map CraftingLists (s "lists")
        , Parser.map CraftingList (s "list" </> string)
        , Parser.map Login (s "login")
        , Parser.map Register (s "register")
        ]



-- PUBLIC HELPERS


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)


replaceUrl : Nav.Key -> Route -> Cmd msg
replaceUrl key route =
    Nav.replaceUrl key (routeToString route)


fromUrl : Url -> Maybe Route
fromUrl url =
    -- The RealWorld spec treats the fragment like a path.
    -- This makes it *literally* the path, so we can proceed
    -- with parsing as if it had been a normal path all along.
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Parser.parse parser


routeToCmd : Route -> Cmd msg
routeToCmd page =
    case page of
        CraftingLists ->
            Cmd.none

        _ ->
            Cmd.none



-- INTERNAL


routeToString : Route -> String
routeToString page =
    String.join "/" (routeToPieces page)


routeToPieces : Route -> List String
routeToPieces page =
    case page of
        Home ->
            [ "/" ]

        CraftingList id ->
            [ "/list", id ]

        CraftingLists ->
            [ "/lists" ]

        Login ->
            [ "/login" ]

        Register ->
            [ "/register" ]
