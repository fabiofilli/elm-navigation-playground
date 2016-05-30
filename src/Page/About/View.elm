module Page.About.View exposing (..)

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
  div [ id "content1" ] [ text "About Content1"]


-- Section B


sectionB =
  div [ id "content2" ] [ text "About Content2"]

-- Section C


sectionC : Html msg
sectionC =
  div [ id "content3" ] [ text "About Content3"]
