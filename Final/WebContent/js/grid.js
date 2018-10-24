function displayGrid() {
    var con = document.getElementById("gridView");
    var con1 = document.getElementById("lineView");
    if (con1.style.display == 'block') {
        con.style.display = 'none';
        con1.style.display = 'none';
    } else {
        con.style.display = 'grid';
        con1.style.display = 'block';
    }
}

/* 
window.addEventListener('scroll', function () {
    var con = document.getElementById("gridView");
    var con1 = document.getElementById("lineView");

    if (window.scrollY >= 510){
        con.style.display = 'grid';
        con1.style.display = 'block';
    } 
    else{
        con.style.display = 'none';
        con1.style.display = 'none';
    }
});
 */