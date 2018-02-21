module PrestoDOM.Elements.Keyed
	( KeyedNode
    , linearLayout
    , relativeLayout
    , horizontalScrollView
    , scrollView
	) where

import Data.Tuple (Tuple)

import Halogen.VDom (ElemName(ElemName), VDom)

import PrestoDOM.Core

import PrestoDOM.Elements (keyed)

type KeyedNode i p
   = Array i
  -> Array (Tuple String (VDom (Array i) p))
  -> VDom (Array i) p


keyedNode :: forall i p. String -> KeyedNode (Prop i) p
keyedNode elem = keyed (ElemName elem)


linearLayout :: forall i p. KeyedNode (Prop i) p
linearLayout = keyedNode "linearLayout"

relativeLayout :: forall i p. KeyedNode (Prop i) p
relativeLayout = keyedNode "relativeLayout"

horizontalScrollView :: forall i p. KeyedNode (Prop i) p
horizontalScrollView = keyedNode "horizontalScrollView"

scrollView :: forall i p. KeyedNode (Prop i) p
scrollView = keyedNode "scrollView"


