
//Set current date
$(document).ready( function(){
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    $('.form-control[type="date"]').val(today);
});

//Comapare to data input
function timecompare()
{
    var startDt = document.getElementById("datepicker1").value;
    var endDt = document.getElementById("datepicker2").value;
    var startT = document.getElementById("timepicker1").value;
    var time = startT.split(":");
    var hour = time[0];
    if(hour == '00') {hour = 24}
    var min = time[1];
    var inputTime = hour+"."+min;

    var endT = document.getElementById("timepicker2").value;
    var time1 = endT.split(":");
    var hour1 = time1[0];
    if(hour1 == '00') {hour1 = 24}
    var min1 = time1[1];
    var inputTime1 = hour1+"."+min1;
    var totalTime = inputTime - inputTime1;
    var error1 = document.getElementById("error2");
    var error = document.getElementById("error3");

    if( (new Date(startDt).getTime() == new Date(endDt).getTime()))
    {
        if( totalTime > 0 )
        {
            error.textContent = "Giờ kết thúc phải lớn hơn giờ bắt đầu!" 
            error.style.color = "red"
            document.getElementById('head').disabled = true;
        } 
        else{
            error.textContent = "" 
            document.getElementById('head').disabled = false;
        }     
    }
    else if( (new Date(startDt).getTime() >new Date(endDt).getTime()))
    {
        error1.textContent = "Ngày kết thúc phải lớn hơn hoăc bằng ngày bắt đầu!" 
        error1.style.color = "red" 
        document.getElementById('head').disabled = true;
    }
    else{ 
        error1.textContent = "" 
        document.getElementById('head').disabled = false;
    }     
}