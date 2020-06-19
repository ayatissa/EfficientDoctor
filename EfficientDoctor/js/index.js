var hexNav = document.getElementById('hexNav');

document.getElementById('menuBtn').onclick = function() {
    var className = ' ' + hexNav.className + ' ';
    if ( ~className.indexOf(' active ') ) {
        hexNav.className = className.replace(' active ', ' ');
    } else {
        hexNav.className += ' active';
    }              
}