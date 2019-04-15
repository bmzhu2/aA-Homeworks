document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    const ctx = canvas.getContext('2d');
    // ctx.fillStyle = '#7d1fdb';
    // ctx.fillRect(130, 130, 322, 200);
    ctx.beginPath();
    ctx.arc(100, 75, 50, 0, 2 * Math.PI);
    ctx.strokeStyle = '#7d1fdb';
    ctx.fillStyle = '#ff5700';
    ctx.lineWidth = 10;
    ctx.fill();
    ctx.stroke();

});

