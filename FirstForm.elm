import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
  App.beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model =
  { name : String
  , password : String
  , confirmPassword : String
  }

model : Model
model =
  Model "" "" ""

-- UPDATE

type Msg
  = Name String
  | Password String
  | ConfirmPassword String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    ConfirmPassword confirmPassword ->
      { model | confirmPassword = confirmPassword }

-- VIEW

view : Model -> Html Msg
view model =
  div []
  [ input [ type' "text", placeholder "Name", onInput Name] []
  , input [ type' "text", placeholder "Password", onInput Password] []
  , input [ type' "text", placeholder "Confirm Password", onInput ConfirmPassword] []
  , viewValidation model
  ]

viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if model.password == model.confirmPassword then
        ("green", "OK")
      else
        ("red", "Passwords do not match!")
  in
     div [ style [("color", color)] ] [ text message ]
