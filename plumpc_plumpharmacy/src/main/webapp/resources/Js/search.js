if (document.getElementById('main').value == 0)
        document.getElementById('rate1').value = '165'; // set the value if no option is selected, this is the default value. 

    document.getElementById('main').addEventListener('change', function () {
        var style = this.value == 1 ? 'inline' : 'none';{
            document.getElementById('medicine').style.display = style;
            document.getElementById('medicine1').style.display = style;
        }
        
        var style = this.value == 2 ? 'inline' : 'none';{
            document.getElementById('prescription').style.display = style;
            document.getElementById('prescription1').style.display = style;
        }
        

        var style = this.value == 3 ? 'inline' : 'none';{
            document.getElementById('employee').style.display = style;
            document.getElementById('employee1').style.display = style;
        }
        

        var style = this.value == 4 ? 'inline' : 'none';{
            document.getElementById('receipt').style.display = style;
            document.getElementById('receipt1').style.display = style;
        }
        

        var style = this.value == 5 ? 'inline' : 'none';{
            document.getElementById('supplier').style.display = style;
            document.getElementById('supplier1').style.display = style;
        }

        var style = this.value == 6 ? 'inline' : 'none';{
            document.getElementById('customer').style.display = style;
            document.getElementById('customer1').style.display = style;
        }
        
    });
    
    
    
    
    
    