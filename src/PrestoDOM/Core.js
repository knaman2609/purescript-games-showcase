"use strict";
const prestoDayum = require("presto-ui").doms;
const parseParams = require("presto-ui").helpers.web.parseParams;
const R = require("ramda");

window.__PRESTO_ID = 1;

function domAll(elem) {
  if (!elem.__ref) {
    elem.__ref = window.createPrestoElement();
  }

  if (elem.props.id) {
    elem.__ref.__id = elem.props.id;
  }

  const type = R.clone(elem.type);
  const props = R.clone(elem.props);
  const children = [];

  for (var i = 0; i < elem.children.length; i++) {
    children.push(domAll(elem.children[i]));
  }
  props.id = elem.__ref.__id;
  return prestoDayum(type, props, children);
}

function applyProp(element, attribute) {
  var prop = {
    id: element.__ref.__id
  }
  prop[attribute.value0] = attribute.value1;
  Android.runInUI(parseParams("linearLayout", prop, "set"));
}

window.removeChild = removeChild;
window.addChild = addChild;
window.addAttribute = addAttribute;
window.removeAttribute = removeAttribute;
window.updateAttribute = updateAttribute;
window.addAttribute = addAttribute;
window.insertDom = insertDom;
window.createPrestoElement = function () {
  return {
    __id: window.__PRESTO_ID++
  };
}
window.__screenSubs = {};

function removeChild (child, parent, index) {
  Android.removeView(child.__ref.__id);
}

function addChild (child, parent, index) {
  Android.addViewToParent(parent.__ref.__id, domAll(child), index);
}

function addAttribute (element, attribute) {
  applyProp(element, attribute);
}

function removeAttribute (element, attribute) {

}

function updateAttribute (element, attribute) {
  applyProp(element, attribute);
}

exports.click = function() {}
exports.getId = function () {
  console.log("hererer");
  return window.__PRESTO_ID++;
}

function insertDom(root) {
  return function(dom) {
    return function() {
      root.props.height = "match_parent";
      root.props.width = "match_parent";
      root.props.id = "GodFather";
      root.type = "relativeLayout";
      root.__ref = window.createPrestoElement();

      root.children.push(dom);
      dom.parentNode = root;
      window.N = root;

      Android.Render(domAll(root));
    }
  }
}
