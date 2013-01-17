/*
 *Main JS File
 */

/*
 * Administrator Script Functions
 */

function jumpToPageMessages(sign_id){
    var jump = document.getElementById("jump_studMessages").value;
    window.location.assign("?action=viewMessages&Tsign_ID=" +sign_id +"&page=" +jump);
} 

function isCheck(rowCount){
    var check = document.getElementById("check").checked;
    isCheckAll(check, rowCount)
}

function jumpToPage(){
    var jump = document.getElementById("jump").value;
    var search = document.getElementById("search").value;
    window.location.assign("?action=displayTable&filter=" + search +"&page=" + jump);
}       
        
function isCheckAll(isChecked, rowCount){
    for(var i = 0; i <= rowCount; i++){
        document.getElementById("" +i).checked = isChecked;
    }
}
        
function findCheck(rowCount){
    
    var bool = confirm("Are you sure you want to delete?");
    
    if(bool == true){
        var valueDeleted = "";
        for(var i = 0; i < rowCount; i++){
            if(document.getElementById("" +i).checked == true){
                valueDeleted += document.getElementById("" +i).value + "-";
            }
        }
        window.location.assign("?action=delete&selected=" + valueDeleted);
    }
}

function confirmDelete(selected){
    var bool = confirm("Are you sure you want delete?");
    
    if(bool == true){
        window.location = "?action=delete&selected=" + selected;
    }
}