module Main where

import Data.Maybe
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
import Data.Tuple
import Data.Array
import Partial.Unsafe
import Data.Maybe

foreign import logAny :: forall eff  a. a -> Eff eff Unit
foreign import openUrl :: forall eff  a. a -> Eff eff Unit

urlMap = [
  Tuple "flappy.gif" "https://github.com/kiranpuppala-juspay/flappy",
  Tuple "piano.gif" "https://github.com/sainiaditi/onlinePiano-halogen" ,
  Tuple "breakout.gif" "https://github.com/sriharshachilakapati/prestodom-breakout-demo" ,
  Tuple "balloon_shooter.gif" "https://github.com/Georgepadannamackal/Baloon_Shooter"
  ]

row1 = [
  "breakout.gif",
  "flappy.gif",
  "piano.gif"
  ]

row2 = [
  "balloon_shooter.gif"
  ]

previewBox _imageUrl = imageView [
  height (V 200),
  width  (V 350),
  margin "0,0,10,10",
  background "blue",
  imageUrl _imageUrl,
  cornerRadius "10",
  stroke "10,#9a9696",
  name "previewClicked",
  onClick "do"
  ]

widget state = linearLayout
              [ height Match_Parent
              , width Match_Parent
              , background "#b7b7b7"
              , gravity "center"
              ]
              [
                linearLayout
                [
                  width (V 1080)
                , orientation "vertical"
                , height (V 420)
                ]
                [
                   linearLayout [width (V 1080), height (V 210)] (map (\x -> previewBox x) row1)
                  ,linearLayout [width (V 1080), height (V 210)] (map (\x -> previewBox x) row2)
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
  let (ValueS _x) = x.value

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
