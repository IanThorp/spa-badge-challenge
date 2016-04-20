var SweetSelector = (function(){
  function publicSelect(selectTerm){
      var term = selectTerm.substr(1);
    if (selectTerm.charAt(0) === "#"){
      return document.getElementById(term);
    }
    else if (selectTerm.charAt(0) === ".") {
      return document.getElementsByClassName(term)[0];
    }
    else {
      return document.getElementsByTagName(selectTerm)[0];
    }
  }

    return {
      select: publicSelect
    };
})();

var DOM = (function(){
  function hide(hideTerm){
    var item = SweetSelector.select(hideTerm);
    item.style.display = "none";
  }

  function show(showTerm){
    var item = SweetSelector.select(showTerm);
    item.style.display = "block";
  }

  function addClass(currentClass, additionalClass){
    var item = SweetSelector.select(currentClass);
    item.className += " " + additionalClass;
  }

  function removeClass(currentClass, removeableClass){
    var item = SweetSelector.select(currentClass)
    item.className = item.className.replace(removeableClass, "").trim()
  }
  return {
    hide: hide,
    show: show,
    addClass: addClass,
    removeClass: removeClass
  }
})();

var EventDispatcher = (function(){
  function on(selectTerm, type, action){
  elem = SweetSelector.select(selectTerm);
  elem.addEventListener(type, action, false);
  }

  function trigger(selectTerm, type){
    var event = new Event(type);
    elem = SweetSelector.select(selectTerm);
    elem.dispatchEvent(event);
  }
  return {
    on: on,
    trigger: trigger
  }
})();

var AjaxWrapper = (function(){

  return {
    request: function(req){
      var promise = new Promise(function(resolve, reject){
        var oReq = new XMLHttpRequest();
        oReq.open(req.type, req.url);
        oReq.send();
                oReq.onload = function(){
          if (this.status >= 200 && this.status < 300){
            resolve(this.response);
          } else {
            reject(this.statusText);
          }
        };
        oReq.onerror = function(){
          reject(this.statusText);
        }
      });
      return promise;


    }
  }
})();
