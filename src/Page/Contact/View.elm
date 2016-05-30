module Page.Contact.View exposing (..)

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
  div [ id "content1" ] [ text "Contact Content1"]


-- Section B


sectionB =
  div [ id "content2" ] [ text "Contact Content2"]

-- Section C


sectionC : Html msg
sectionC =
  div [ id "content3" ] [ text "Contact Content3"]
