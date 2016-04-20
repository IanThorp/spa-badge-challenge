
$("a").click(function(e){
  e.preventDefault();
  var targetUrl = this.href;
  var id_num = {id: $(this).attr("class")};
  var request = $.ajax({
    url: targetUrl,
    dataType: "json",
    data: id_num
  })

  request.done(function(data){
    console.log(data)
    $(".body").html();
  })
})

















// EventDispatcher.on("a", "click", function(e){
//   e.preventDefault();
//   AjaxWrapper.request({type: "GET", url: this.href })
//     DOM.hide(".body")
// })
