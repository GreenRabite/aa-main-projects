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
