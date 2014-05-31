/**
 * Created with JetBrains RubyMine.
 * User: anton
 * Date: 5/10/14
 * Time: 6:29 PM
 * To change this template use File | Settings | File Templates.
 */


function changeColor(td)
{
    if (td.className.indexOf("selectedCell") == -1){
        td.className += "selectedCell"  ;
    } else {
        td.className = ""  ;
    }
}

function submit() {

    var map ={};
    var counter = 0;

    $("td").each(function(){
        if(this.className.indexOf("selectedCell") > -1){
            counter++;
            map[this.firstElementChild.innerHTML] = "true";
        } else {
            map[this.firstElementChild.innerHTML] = "false";
        }
    }) ;

    if (counter!=6){
        alert("You need select 6 days") ;
        return ;
    }
    var string = "";
    for (var property in map) {
        if (map.hasOwnProperty(property)) {
            string+=   property + "=" + map[property] + "$";

        }
    }
    console.log(string);

    $.post('/ajax/submit.json', {
        string: string
    }, function(data) {
        var output = data.result;
    } );
}
