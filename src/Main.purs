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

ball state = linearLayout [
  height (V 200),
  width  (V 200),
  margin marginVal,
  background "blue",
  cornerRadius "200",
  name "previewClicked",
  onClick "do"
  ] [] where

  marginVal = (state.marginTop) <> ",0,0,0"

widget state = linearLayout
              [ height Match_Parent
              , width Match_Parent
              , background "#b7b7b7"
              ]
              [(ball state)]

main = do
  U.initializeState

  state <- U.updateState "marginTop" 100
  U.render (widget state) listen

  pure unit

eval _ = do
  state <- U.getState
  let newMargin = state.marginTop + 100
  U.updateState "marginTop" newMargin

listen = do
  sig1 <- U.signal "previewClicked" "onClick" Nothing

  let behavior = eval <$> sig1.behavior
  let events = (sig1.event)

  U.patch widget behavior events
