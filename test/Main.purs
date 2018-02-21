module Test.Main where

import Prelude

import DOM (DOM) as DOM
import FRP (FRP) as FRP

import PrestoDOM.Types
import PrestoDOM.Elements
import PrestoDOM.Events
import PrestoDOM.Properties

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log, logShow)
import Control.Plus ((<|>))
import PrestoDOM.Core
import PrestoDOM.Util as U

widget :: forall r p i. { color :: String | r } -> VDom (Array (Prop i)) p
widget state =
    linearLayout
        [ id_ "1"
        , height "match_parent"
        , width "match_parent"
        , background (state.color)
        ]
        [ linearLayout
            [ id_ "2"
            , height "300"
            , width "300"
            , background "#987654"
            ]
            [ linearLayout
                [ id_ "3"
                , width "150"
                , height "match_parent"
                , background "#121231"
                , onClick "do"
                ]
                []
            , linearLayout
                [ id_ "4"
                , height "match_parent"
                , width "150"
                , background "#000000"
                , onClick "do"
                ]
                []
            ]
        ]

main :: forall t. Eff ( dom :: DOM.DOM , console :: CONSOLE , frp :: FRP.FRP | t ) Unit
main = do
  --- Init State {} empty record--
  U.initializeState

  --- Update State ----
  state <- U.updateState "color" "yellow"

  ---- Render Widget ---
  U.render (widget state) listen

  pure unit

eval :: forall t r. Boolean -> Boolean -> Eff ( console :: CONSOLE | t ) { | r }
eval x y = do
     let s = x && y

     logShow x
     logShow y

     if s
        then
         U.updateState "color" "green"
       else
         U.updateState "color" "red"

listen :: forall t. Eff ( frp :: FRP.FRP , console :: CONSOLE | t ) (Eff ( frp :: FRP.FRP , console :: CONSOLE | t ) Unit )
listen = do
  sig1 <- U.signal "3" false
  sig2 <- U.signal "4" false

  let behavior = eval <$> sig1.behavior <*> sig2.behavior
  let events = (sig1.event <|> sig2.event)

  U.patch widget behavior events
