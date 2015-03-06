// Common Function Library to be included in website
function doHandleAll(){    
        with (document.forms[0]){
            if(elements['allCheck'].checked==false){
                doUnCheckAll();
            }else if(elements['allCheck'].checked==true){
                doCheckAll();
            }
        }
    }
    function doCheckAll(){
        with(document.forms[0]){
            for(var i=0; i< elements.length; i++){
                if(elements[i].type=='checkbox'){
                    elements[i].checked=true;
                }
            }
        }
    }
    function doUnCheckAll(){
        with(document.forms[0]){
            for(var i=0; i< elements.length; i++){
                if(elements[i].type=='checkbox'){
                    elements[i].checked=false;
                }
            }
        }
    }
    
    function doDelete(){
    
//        with(document.forms[0]){
//            for(var i=0; i< elements.length; i++){
//                    if(elements[i].type=='checkbox' && elements[i].checked==true){
                        return confirm('Are you sure you want to delete the selected');
//                    }
//            }
//        }
    }