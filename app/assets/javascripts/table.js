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
