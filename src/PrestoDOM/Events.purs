module PrestoDOM.Events where


import Data.Tuple (Tuple(..))
import Data.Maybe (Maybe(..))
import DOM.Event.Types (EventType(..), Event) as DOM
import PrestoDOM.Core (Prop(..))

-- domName :: AttrValue -> Prop
-- domName st = Tuple "domName" st

onClick :: forall i. String -> Prop i
onClick some = Handler (DOM.EventType "onClick") (\_ -> Nothing)
