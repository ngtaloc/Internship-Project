function check() {
    var money = document.getElementById("money").value;
    var money1 = document.getElementById("money1").value;
    var money2 = document.getElementById("money2").value;
    var money3 = document.getElementById("money3").value;
    var money4 = document.getElementById("money4").value;
    var sum;
    if (money < 0) {
        error.textContent = "Cần nhập số lớn hơn 0!" 
        error.style.color = "red" 
        document.getElementById('completed').disabled = true;
    } else {
      error.textContent = "" 
    }

    if (money1 < 0 || money1 >100) {
        error1.textContent = "Cần nhập số lớn hơn 0 và nhỏ hơn 100!" 
        error1.style.color = "red"
        document.getElementById('completed').disabled = true;
    } else {
        error1.textContent = "" 
    }

    if (money2 < 0 || money2 > money) {
        error2.textContent = "Cần nhập số lớn hơn 0! và nhỏ hơn hoặc bằng tiền thuốc!" 
        error2.style.color = "red"
        document.getElementById('completed').disabled = true;
    } else {
        error2.textContent = "" 
    }

    if (money3 < 0 || money3 >money2) {
        error3.textContent = "Cần nhập số lớn hơn 0 và nhỏ hơn hoặc bằng tổng tiền!" 
        error3.style.color = "red"
        document.getElementById('completed').disabled = true;
    } else {
        error3.textContent = "" 
    }

    if (money4 < 0|| money4!=(money2-money3)) {
        error4.textContent = "Cần nhập số lớn hơn 0!" 
        error4.style.color = "red"
        document.getElementById('completed').disabled = true;
    } else {
        error4.textContent = "" 
    }

    if(error4.textContent == error3.textContent == error2.textContent ==error1.textContent == error.textContent == "")
        document.getElementById('completed').disabled = false;
}



