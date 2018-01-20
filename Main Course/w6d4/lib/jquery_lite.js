/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DomNodeCollection = __webpack_require__(1);



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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DomNodeCollection {

  constructor(htmlArr) {
    this.nodes = htmlArr;
  }

  html(str=undefined){
    if (str === undefined) {
      return this.nodes[0].innerHTML;
    }else {
      for (let i = 0; i < this.nodes.length; i++) {
        this.nodes[i].innerHTML = str;
      }
      return this;//.innerHTML;
    }
  }

  empty(){
    this.html("");
    return this;
  }

  append(outerHTML){
    for (let i = 0; i < this.nodes.length; i++) {
      this.nodes[i].innerHTML += outerHTML;
    }
    return this;
  }

  attr(key, value=undefined){
    if( value === undefined) {
      return this.nodes[0].getAttribute(key);
    }else {
      for (let i = 0; i < this.nodes.length; i++) {
        this.nodes[i].setAttribute(key,value);
      }
      return this;
    }
  }

  addClass(newClassName){
    for (let i = 0; i < this.nodes.length; i++) {
      let nodeClass = this.nodes[i].getAttribute("class");
      if (nodeClass === null) {
        this.nodes[i].setAttribute("class",newClassName);
      }else {
        nodeClass += ` ${newClassName}`;
        this.nodes[i].setAttribute("class",nodeClass);
      }
    }
    return this;
  }

  removeClass(className){
    for (let i = 0; i < this.nodes.length; i++) {
      this.nodes[i].classList.remove(className);
    }
  }

  children(){
    let arr = [];
    for (let i = 0; i < this.nodes.length; i++) {
      arr.push(this.nodes[i].childNodes);
    }
    return arr;
  }

  parent(){
    let arr = [];
    let seen = [];
    for (let i = 0; i < this.nodes.length; i++) {
      if (seen.includes(this.nodes[i].parentNode) === false) {
        arr.push(this.nodes[i].parentNode);
        seen.push(this.nodes[i].parentNode);
      }
    }
    return arr;
  }
}


module.exports = DomNodeCollection;


/***/ })
/******/ ]);