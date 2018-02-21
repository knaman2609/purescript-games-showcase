module PrestoDOM.Types.DomAttributes where

import Prelude (show)

data Length
    = Match_Parent
    | V Int

renderLength :: Length -> String
renderLength = case _ of
    Match_Parent -> "match_parent"
    V n -> show n
