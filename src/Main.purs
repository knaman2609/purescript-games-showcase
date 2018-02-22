module Main where

import Data.Array
import Data.Maybe
import Data.Maybe
import Data.Tuple
import Partial.Unsafe
import Prelude
import PrestoDOM.Core
import PrestoDOM.Elements
import PrestoDOM.Events
import PrestoDOM.Properties
import PrestoDOM.Types

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log, logShow)
import Control.Plus ((<|>))
import PrestoDOM.Util as U

foreign import logAny :: forall eff  a. a -> Eff eff Unit
foreign import openUrl :: forall eff  a. a -> Eff eff Unit

urlMap = [
  Tuple "dist/flappy.gif" "https://github.com/kiranpuppala-juspay/flappy",
  Tuple "dist/piano.gif" "https://github.com/sainiaditi/onlinePiano-halogen" ,
  Tuple "dist/breakout.gif" "https://github.com/sriharshachilakapati/prestodom-breakout-demo" ,
  Tuple "dist/balloon_shooter.gif" "https://github.com/Georgepadannamackal/Baloon_Shooter",
  Tuple "dist/tic.gif" "https://github.com/babivinay/TicTacToe",
  Tuple "dist/chopper.gif" "https://github.com/prasannals/Chopper/",
  Tuple "dist/whack_a_mole.gif" "https://github.com/amankasliwal/whack-a-mole"
  ]

row1 = [
  "dist/whack_a_mole.gif",
  "dist/flappy.gif",
  "dist/piano.gif"
  ]

row2 = [
  "dist/balloon_shooter.gif",
  "dist/tic.gif",
  "dist/chopper.gif"
  ]

row3 = [
  "dist/breakout.gif"
  ]

previewBox _imageUrl = imageView [
  height (V 200),
  width  (V 350),
  margin "0,0,10,10",
  background "#c6dee8",
  imageUrl _imageUrl,
  cornerRadius "10",
  stroke "10,#c6dee8",
  name "previewClicked",
  onClick "do"
  ]

widget state = linearLayout
              [ height Match_Parent
              , width Match_Parent
              , background "#f1fbff"
              , gravity "center"
              ]
              [
                scrollView
                [
                  width (V 1080)
                , height (V 500)
                ]
                  [
                    linearLayout
                    [width Match_Parent
                    ,height (V 630)
                    ,orientation "vertical"]
                  [
                    linearLayout [width (V 1080), height (V 210)] (map (\x -> previewBox x) row1)
                    ,linearLayout [width (V 1080), height (V 210)] (map (\x -> previewBox x) row2)
                    ,linearLayout [width (V 1080), height (V 210)] (map (\x -> previewBox x) row3)
                  ]
                ]
              ]


main = do
  state <- U.getState
  U.render (widget state) listen

  pure unit

findUrl :: String -> Array (Tuple String String)
findUrl key =
  filter (\(Tuple x y) -> x == key) (urlMap)

eval :: forall a b t e. Maybe (EventResp a b) -> Eff (console :: CONSOLE | e) (Rec t)
eval (Just x) = unsafePartial $ do
  case x.props of
    Props props -> let (Just (Tuple key value)) = head $ findUrl props.imageUrl in
      openUrl value
    _ -> logAny "null"

  U.getState

eval _ = U.getState

listen = do
  sig1 <- U.signal "previewClicked" "onClick" Nothing

  let behavior = eval <$> sig1.behavior
  let events = (sig1.event)

  U.patch widget behavior events
