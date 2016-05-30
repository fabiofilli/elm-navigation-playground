module Nav exposing (..)

import Html exposing (Html, a, text, div)
import Html.Attributes exposing (..)
import Navigation
import UrlParser exposing (Parser, format, oneOf, s)
import String
import Dict

import Component.Footer
import Page.Welcome.View
import Page.About.View
import Page.Contact.View


type Page
  = WelcomePage
  | AboutPage
  | ContactPage


pageParser : Parser (Page -> a) a
pageParser =
  oneOf
    [ format WelcomePage (s "welcome")
    , format AboutPage (s "about")
    , format ContactPage (s "contact")
    ]


toHash : Page -> String
toHash page =
  case page of
    WelcomePage -> "#welcome" -- TODO change to /

    AboutPage -> "#about"

    ContactPage -> "#contact"


hashParser : Navigation.Location -> Result String Page
hashParser location =
  UrlParser.parse identity pageParser (String.dropLeft 1 location.hash)


-- MODEL


type alias Model =
  { page : Page
  }


init : Result String Page -> (Model, Cmd Msg)
init result =
  urlUpdate result ( Model WelcomePage )


-- UPDATE


type Msg
  = NoOp


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      model ! []


urlUpdate : Result String Page -> Model -> (Model, Cmd Msg)
urlUpdate result model =
  case result of
    Ok page ->
      { model | page = page } ! []

    Err _ ->
      ( model, Navigation.modifyUrl (toHash model.page) )


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- VIEW


view : Model -> Html Msg
view model =
  div []
      [ div [ id "header" ] ( [ link WelcomePage "Welcome"
                              , link AboutPage "About"
                              , link ContactPage "Contact"
                              ]
                            )
      , div [] ( pageContent model )
      , div [] ( [Component.Footer.footer] )
      ]


pageContent : Model -> List (Html msg)
pageContent model =
  case model.page of
    WelcomePage ->
      Page.Welcome.View.content

    AboutPage ->
      Page.About.View.content

    ContactPage ->
      Page.Contact.View.content


link : Page -> String -> Html msg
link page navLinkName =
  a [ id "link", href (toHash page) ]
    [ text navLinkName ]
