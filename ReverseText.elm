import Html exposing (Html, Attribute, button, div, input, text)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import String

main =
  App.beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model =
  { content : String
  , reversed : Bool
  }

model : Model
model =
  { content = ""
  ,  reversed = False
  }

showText : Model -> String
showText model =
  if model.reversed then
     String.reverse model.content
  else
    model.content

-- UPDATE

type Msg
  = Change String
  | ToggleReverse

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }
    ToggleReverse ->
      if model.reversed then
        { model | reversed = False }
      else
        { model | reversed = True }


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ onInput Change, placeholder "Type To Reverse" ] []
      , div [] [ text (showText model) ]
      , button [ onClick ToggleReverse ][ text "Reverse" ]
    ]


