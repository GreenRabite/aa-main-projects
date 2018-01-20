const DomNodeCollection = require('./dom_node_collection.js');



window.$l = function(arg) {
  if (typeof arg === "string") {
    let list =  document.querySelectorAll(arg);
    let arr = Array.from(list);
    return new DomNodeCollection(arr);
  }else if (arg instanceof HTMLElement) {
    let arr = [arg];
    return new DomNodeCollection(arr);
  }
};
