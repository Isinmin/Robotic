function displayWindow(x) {
    var windowName =x.id+"Window";
    var currentWindow = document.getElementById(windowName);
    var allWindows =document.getElementsByClassName("displayWin");
    for(var i=0; i<allWindows.length; i++){
        allWindows[i].style.display="none";
    }
    currentWindow.style.display="block";
}
function checkTab(x) {
    var allTabs=  document.getElementsByClassName("tabChecked");
    for(var i=0; i<allTabs.length; i++){
        allTabs[i].className="tabNotChecked";
    }
    x.className="tabChecked";

}

function  defaultClick() {
    document.getElementById("description").onclick();
}