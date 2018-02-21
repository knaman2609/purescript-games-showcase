window.SUBS = {};

var $Types = require("../PrestoDOM.Types")
var $Maybe = require("../Data.Maybe")

function attachAttributeList(element, attrList) {
  var key, value;

  for (var i = 0; i < attrList.length; i++) {
    key = attrList[i].value0;
    value = attrList[i].value1;

    if (typeof value == "function") {
      attachListener(element, key);
    } else {
      element.props[key] = value;
    }
  }

  return null;
}

function attachListener(element, eventType) {
  if (!element.props.name) {
    throw Error("Define name on a node with an event");
  }
  window.SUBS[element.props.name] = {};

  element.props[eventType] = function(value) {
    window.SUBS[element.props.name][eventType](value, element.props);
  }
}

exports.applyAttributes = function(element) {
  return function(attrList) {
    return function() {
      attachAttributeList(element, attrList);
      return attrList;
    }
  }
}

exports.patchAttributes = function(element) {
  return function(oldAttrList) {
    return function(newAttrList) {
      return function() {
        var attrFound = 0;

        for (var i=0; i<oldAttrList.length; i++) {
          attrFound = 0;
          for (var j=0; j<newAttrList.length; j++) {
            if (oldAttrList[i].value0 == newAttrList[j].value0) {
              attrFound = 1;

              if (oldAttrList[i].value1 !== newAttrList[j].value1) {
                oldAttrList[i].value1 = newAttrList[j].value1;
                updateAttribute(element, newAttrList[j]);
              }
            }
          }

          if (!attrFound) {
            oldAttrList[i].splice(i, 0);
            removeAttribute(element, oldAttrList[i]);
          }
        }

        for (var i=0; i<newAttrList.length; i++) {
          attrFound = 0;
          for (var j=0; j<oldAttrList.length; j++) {

            if (oldAttrList[j].value0 == newAttrList[i].value0) {
              attrFound = 1;
            }
          }

          if (!attrFound) {
            oldAttrList.push(newAttrList[i]);
            addAttribute(element, newAttrList[i]);
          }
        }

        return oldAttrList;
      }
    }
  }
}

exports.cleanupAttributes = function(element) {
  return function(attrList) {
    return function() {
      // console.log(element);
      // console.log(attrList);
    }
  }
}

exports.done = function() {
  console.log("done");
  return;
}

exports.logNode = function(node) {
  return function() {
    window.N = node;
    console.log(node);
  }
}

exports.storeMachine = function(machine) {
  return function() {
    window.MACHINE = machine;
  }
}

exports.getLatestMachine = function() {
  return window.MACHINE;
}

exports.getRootNode = function() {
  return {type: "linearLayout", props: {root: "true"}, children: []};
}


exports.insertDom = window.insertDom;

exports.attachSignalEvents = function(name) {
  return function (eventType) {
    return function (sub) {
      window.SUBS[name][eventType] = function (value, props) {
        var result = {
          value: new $Types.ValueS(value),
          props: new $Types.Props(props)
        };
        sub(new $Maybe.Just(result))();
      }
      return null;
    }
  }
}


exports.initializeState = function() {
  window.APP_STATE = {};
  return null;
}

exports.updateState = function(key) {
  return function(value) {
    return function() {
      window.APP_STATE[key] = value;

      return window.APP_STATE;
    }
  }
}

exports.getState = function() {
  return window.APP_STATE;
}
