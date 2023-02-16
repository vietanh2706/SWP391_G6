
document.getElementById("hide").style.display = 'none';
document.getElementById("submit").style.display='none';

function showDiv1() {
    document.getElementById('blood').readOnly = false;
    document.getElementById('respiratory').readOnly = false;
    document.getElementById('gi').readOnly = false;
    document.getElementById('kidneys').readOnly = false;
    document.getElementById('musculo').readOnly = false;
    document.getElementById('logical').readOnly = false;
    document.getElementById('psychiaric').readOnly = false;
    document.getElementById('submit').style.display = "inline-block";
    document.getElementById('hide').style.display = "inline-block";
    document.getElementById('show').style.display = "none";
}
function hideDiv1() {
    document.getElementById('blood').readOnly = true;
    document.getElementById('respiratory').readOnly = true;
    document.getElementById('gi').readOnly = true;
    document.getElementById('kidneys').readOnly = true;
    document.getElementById('musculo').readOnly = true;
    document.getElementById('logical').readOnly = true;
    document.getElementById('psychiaric').readOnly = true;
    document.getElementById('submit').style.display = "none";
    document.getElementById('show').style.display = "inline-block";
    document.getElementById('hide').style.display = "none";
}
function showDiv2() {
    document.getElementById('vision').readOnly = false;
    document.getElementById('eye1').readOnly = false;
    document.getElementById('eye2').readOnly = false;
    document.getElementById('submit').style.display = "inline-block";
    document.getElementById('hide').style.display = "inline-block";
    document.getElementById('show').style.display = "none";
}
function hideDiv2() {
    document.getElementById('vision').readOnly = true;
    document.getElementById('eye1').readOnly = true;
    document.getElementById('eye2').readOnly = true;
    document.getElementById('submit').style.display = "none";
    document.getElementById('show').style.display = "inline-block";
    document.getElementById('hide').style.display = "none";
}
function showDiv3() {
    document.getElementById('hearing').readOnly = false;
    document.getElementById('nose').readOnly = false;
    document.getElementById('submit').style.display = "inline-block";
    document.getElementById('hide').style.display = "inline-block";
    document.getElementById('show').style.display = "none";
}
function hideDiv3() {
    document.getElementById('hearing').readOnly = true;
    document.getElementById('nose').readOnly = true;
    document.getElementById('submit').style.display = "none";
    document.getElementById('show').style.display = "inline-block";
    document.getElementById('hide').style.display = "none";
}
function showDiv4() {
    document.getElementById('Height').readOnly = false;
    document.getElementById('Weight').readOnly = false;
    document.getElementById('BMI').readOnly = false;
    document.getElementById('Pulse').readOnly = false;
    document.getElementById('Blood').readOnly = false;
    document.getElementById('Physical').readOnly = false;
    document.getElementById('submit').style.display = "inline-block";
    document.getElementById('hide').style.display = "inline-block";
    document.getElementById('show').style.display = "none";
}
function hideDiv4() {
    document.getElementById('Height').readOnly = true;
    document.getElementById('Weight').readOnly = true;
    document.getElementById('BMI').readOnly = true;
    document.getElementById('Pulse').readOnly = true;
    document.getElementById('Blood').readOnly = true;
    document.getElementById('Physical').readOnly = true;
    document.getElementById('submit').style.display = "none";
    document.getElementById('show').style.display = "inline-block";
    document.getElementById('hide').style.display = "none";
}
function showDiv5() {
    document.getElementById('upper').readOnly = false;
    document.getElementById('lower').readOnly = false;
    document.getElementById('dental').readOnly = false;
    document.getElementById('submit').style.display = "inline-block";
    document.getElementById('hide').style.display = "inline-block";
    document.getElementById('show').style.display = "none";
}
function hideDiv5() {
    document.getElementById('upper').readOnly = true;
    document.getElementById('lower').readOnly = true;
    document.getElementById('dental').readOnly = true;
    document.getElementById('submit').style.display = "none";
    document.getElementById('show').style.display = "inline-block";
    document.getElementById('hide').style.display = "none";
}
function showDiv6() {
    document.getElementById('diagnostic').readOnly = false;
    document.getElementById('conclusion').readOnly = false;
    document.getElementById('submit').style.display = "inline-block";
    document.getElementById('hide').style.display = "inline-block";
    document.getElementById('show').style.display = "none";
}
function hideDiv6() {
    document.getElementById('diagnostic').readOnly = true;
    document.getElementById('conclusion').readOnly = true;
    document.getElementById('submit').style.display = "none";
    document.getElementById('show').style.display = "inline-block";
    document.getElementById('hide').style.display = "none";
}

