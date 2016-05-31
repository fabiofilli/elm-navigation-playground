module Page.Welcome.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


content =
  [ sectionA
  , sectionB
  , sectionC
  ]


-- Section A


sectionA : Html msg
sectionA =
  div [ id "content1" ] [ text "Welcome Content1"]


-- Section B


sectionB : Html msg
sectionB =
  div [ id "content2" ] [ text "Welcome Content2"]


-- Section C


sectionC : Html msg
sectionC =
  div [ id "content3" ] [ text "Welcome Content3"]
