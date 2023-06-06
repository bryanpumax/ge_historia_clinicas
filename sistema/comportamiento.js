$(document).ready(function () {
    menu()
});
function menu() {
  
    var  dominio=localStorage.getItem("dominio")
    $.ajax({
        type: "POST",
        url: dominio+"sistema/componente/consultas/menu_li.php",
        data: "",
        success: function (response) {
            $(".menu").html(response);
        }
    });
    //   <li class="nav-item">
            // <a class="nav-link" href="#">Link</a>
        //   </li>
  }
  function menu_li(titulo,archivo) { 
$(".titulo").html(titulo);
$(".btn-close").click()
var  dominio=localStorage.getItem("dominio")
$.ajax({
    type: "POST",
    url: dominio+"sistema/"+archivo,
    data: "",
    success: function (response) {
        $(".contenido").html(response)
    }
});
    }
    function inicioa() {
        $(".titulo").html(titulo);
$(".btn-close").click()
var  dominio=localStorage.getItem("dominio")

$.ajax({
    type: "POST",
    url: dominio+"sistema/"+archivo,
    data: "",
    success: function (response) {
        $(".contenido").html(response)
    }
});


    }