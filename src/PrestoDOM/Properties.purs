module PrestoDOM.Properties where

import Prelude

import Data.Tuple (Tuple(..))

import PrestoDOM.Core (class IsProp, PropName(..), Prop(..), toPropValue)

import PrestoDOM.Types (Length)


prop :: forall value i. IsProp value => PropName value -> value -> Prop i
prop (PropName name) = Property name <<< toPropValue


-- prop :: String -> String -> Prop
-- prop key value = Tuple key (AttrValue value)
name :: forall i. String -> Prop i
name = prop (PropName "name")

id_ :: forall i. String -> Prop i
id_ = prop (PropName "id")

textFromHtml :: forall i. String -> Prop i
textFromHtml = prop (PropName "textFromHtml")


showDividers :: forall i. String -> Prop i
showDividers = prop (PropName "showDividers")


dividerDrawable :: forall i. String -> Prop i
dividerDrawable = prop (PropName "dividerDrawable")


tabTextColors :: forall i. String -> Prop i
tabTextColors = prop (PropName "tabTextColors")


selectedTabIndicatorHeight :: forall i. String -> Prop i
selectedTabIndicatorHeight = prop (PropName "selectedTabIndicatorHeight")


foreground :: forall i. String -> Prop i
foreground = prop (PropName "foreground")


selectedTabIndicatorColor :: forall i. String -> Prop i
selectedTabIndicatorColor = prop (PropName "selectedTabIndicatorColor")


layoutTransition :: forall i. String -> Prop i
layoutTransition = prop (PropName "layoutTransition")


focusOut :: forall i. String -> Prop i
focusOut = prop (PropName "focusOut")


focus :: forall i. String -> Prop i
focus = prop (PropName "focus")


fillViewport :: forall i. String -> Prop i
fillViewport = prop (PropName "fillViewport")


setDate :: forall i. String -> Prop i
setDate = prop (PropName "setDate")


minDate :: forall i. String -> Prop i
minDate = prop (PropName "minDate")


maxDate :: forall i. String -> Prop i
maxDate = prop (PropName "maxDate")


clipChildren :: forall i. String -> Prop i
clipChildren = prop (PropName "clipChildren")


adjustViewBounds :: forall i. String -> Prop i
adjustViewBounds = prop (PropName "adjustViewBounds")


maxLines :: forall i. String -> Prop i
maxLines = prop (PropName "maxLines")


singleLine :: forall i. String -> Prop i
singleLine = prop (PropName "singleLine")


hardware :: forall i. String -> Prop i
hardware = prop (PropName "hardware")


selected :: forall i. String -> Prop i
selected = prop (PropName "selected")


curve :: forall i. String -> Prop i
curve = prop (PropName "curve")


fontFamily :: forall i. String -> Prop i
fontFamily = prop (PropName "fontFamily")


checked :: forall i. String -> Prop i
checked = prop (PropName "checked")


backgroundDrawable :: forall i. String -> Prop i
backgroundDrawable = prop (PropName "backgroundDrawable")


buttonTint :: forall i. String -> Prop i
buttonTint = prop (PropName "buttonTint")


visibility :: forall i. String -> Prop i
visibility = prop (PropName "visibility")


scaleType :: forall i. String -> Prop i
scaleType = prop (PropName "scaleType")


progressColor :: forall i. String -> Prop i
progressColor = prop (PropName "progressColor")


alpha :: forall i. String -> Prop i
alpha = prop (PropName "alpha")


imageUrl :: forall i. String -> Prop i
imageUrl = prop (PropName "imageUrl")


url :: forall i. String -> Prop i
url = prop (PropName "url")


translationY :: forall i. String -> Prop i
translationY = prop (PropName "translationY")


translationX :: forall i. String -> Prop i
translationX = prop (PropName "translationX")


translationZ :: forall i. String -> Prop i
translationZ = prop (PropName "translationZ")


delay :: forall i. String -> Prop i
delay = prop (PropName "delay")


duration :: forall i. String -> Prop i
duration = prop (PropName "duration")


pivotX :: forall i. String -> Prop i
pivotX = prop (PropName "pivotX")


pivotY :: forall i. String -> Prop i
pivotY = prop (PropName "pivotY")


minWidth :: forall i. String -> Prop i
minWidth = prop (PropName "minWidth")


minHeight :: forall i. String -> Prop i
minHeight = prop (PropName "minHeight")


maxWidth :: forall i. String -> Prop i
maxWidth = prop (PropName "maxWidth")


letterSpacing :: forall i. String -> Prop i
letterSpacing = prop (PropName "letterSpacing")


hint :: forall i. String -> Prop i
hint = prop (PropName "hint")


inputType :: forall i. String -> Prop i
inputType = prop (PropName "inputType")


inputTypeI :: forall i. String -> Prop i
inputTypeI = prop (PropName "inputTypeI")


textSize :: forall i. String -> Prop i
textSize = prop (PropName "textSize")


fontSize :: forall i. String -> Prop i
fontSize = prop (PropName "fontSize")


textIsSelectable :: forall i. String -> Prop i
textIsSelectable = prop (PropName "textIsSelectable")


fontStyle :: forall i. String -> Prop i
fontStyle = prop (PropName "fontStyle")


textAllCaps :: forall i. String -> Prop i
textAllCaps = prop (PropName "textAllCaps")


toast :: forall i. String -> Prop i
toast = prop (PropName "toast")


scaleX :: forall i. String -> Prop i
scaleX = prop (PropName "scaleX")


scaleY :: forall i. String -> Prop i
scaleY = prop (PropName "scaleY")


a_scaleX :: forall i. String -> Prop i
a_scaleX = prop (PropName "a_scaleX")


a_scaleY :: forall i. String -> Prop i
a_scaleY = prop (PropName "a_scaleY")


a_duration :: forall i. String -> Prop i
a_duration = prop (PropName "a_duration")


gravity :: forall i. String -> Prop i
gravity = prop (PropName "gravity")


orientation :: forall i. String -> Prop i
orientation = prop (PropName "orientation")


text :: forall i. String -> Prop i
text = prop (PropName "text")


width :: forall i. Length -> Prop i
width = prop (PropName "width")


weight :: forall i. String -> Prop i
weight = prop (PropName "weight")


height :: forall i. Length -> Prop i
height = prop (PropName "height")


layout_gravity :: forall i. String -> Prop i
layout_gravity = prop (PropName "layout_gravity")


margin :: forall i. String -> Prop i
margin = prop (PropName "margin")


marginStart :: forall i. String -> Prop i
marginStart = prop (PropName "marginStart")


marginEnd :: forall i. String -> Prop i
marginEnd = prop (PropName "marginEnd")


padding :: forall i. String -> Prop i
padding = prop (PropName "padding")


cornerRadius :: forall i. String -> Prop i
cornerRadius = prop (PropName "cornerRadius")


stroke :: forall i. String -> Prop i
stroke = prop (PropName "stroke")


typeface :: forall i. String -> Prop i
typeface = prop (PropName "typeface")


background :: forall i. String -> Prop i
background = prop (PropName "background")


backgroundColor :: forall i. String -> Prop i
backgroundColor = prop (PropName "backgroundColor")


color :: forall i. String -> Prop i
color = prop (PropName "color")


hintColor :: forall i. String -> Prop i
hintColor = prop (PropName "hintColor")


btnBackground :: forall i. String -> Prop i
btnBackground = prop (PropName "btnBackground")


colorFilter :: forall i. String -> Prop i
colorFilter = prop (PropName "colorFilter")


btnColor :: forall i. String -> Prop i
btnColor = prop (PropName "btnColor")


shadowLayer :: forall i. String -> Prop i
shadowLayer = prop (PropName "shadowLayer")


elevation :: forall i. String -> Prop i
elevation = prop (PropName "elevation")


rotationX :: forall i. String -> Prop i
rotationX = prop (PropName "rotationX")


rotationY :: forall i. String -> Prop i
rotationY = prop (PropName "rotationY")


rotation :: forall i. String -> Prop i
rotation = prop (PropName "rotation")


backgroundTint :: forall i. String -> Prop i
backgroundTint = prop (PropName "backgroundTint")


scrollBarX :: forall i. String -> Prop i
scrollBarX = prop (PropName "scrollBarX")


scrollBarY :: forall i. String -> Prop i
scrollBarY = prop (PropName "scrollBarY")


clickable :: forall i. String -> Prop i
clickable = prop (PropName "clickable")


focusable :: forall i. String -> Prop i
focusable = prop (PropName "focusable")


selectable :: forall i. String -> Prop i
selectable = prop (PropName "selectable")


selectableItem :: forall i. String -> Prop i
selectableItem = prop (PropName "selectableItem")


values :: forall i. String -> Prop i
values = prop (PropName "values")


maxSeek :: forall i. String -> Prop i
maxSeek = prop (PropName "maxSeek")


accessibilityHint :: forall i. String -> Prop i
accessibilityHint = prop (PropName "accessibilityHint")