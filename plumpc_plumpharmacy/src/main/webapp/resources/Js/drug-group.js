window.onload = function(){ 
    var table = document.getElementById("tableDrugGroup");
    var lableNameDrugGroup = document.getElementById("nameDrugGroup");
    var lableCodeDrugGroup = document.getElementById("codeDrugGroup");
    for(var i=0;i<table.rows.length;i++){
        table.rows[i].onclick=function(){
            
            var codeDrugGroup = this.cells[0].innerHTML;
            var name =  this.cells[1].innerHTML;
            lableNameDrugGroup.innerHTML = name;
            lableCodeDrugGroup.innerHTML = codeDrugGroup;

        };
    }

   
};