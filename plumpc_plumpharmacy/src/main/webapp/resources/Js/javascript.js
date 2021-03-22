$("#closeArrow").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
    $("#sidebar").toggleClass("toggled");
    $("#closeArrow").toggleClass("toggled");
});