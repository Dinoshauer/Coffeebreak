<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Collapse_test.aspx.cs" Inherits="Collapse_test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="#demo" data-collapse>
            <h2>Header</h2>
            <ul>
                <li>Item1</li>
                <li>Item2</li>
                <li>Item3</li>
            </ul>
        </div>
        <hr />
        <ul class="nav">
            <li class="collapsible">Header1</li>
            <ul>
                <li>Item1</li>
                <li>Item2</li>
                <li>Item3</li>
            </ul>
            <li>Item1</li>
            <li>Item2</li>
            <li class="collapsible">Header2</li>
            <ul>
                <li>Item1</li>
                <li>Item2</li>
                <li>Item3</li>
            </ul>
        </ul>
    </div>
    </form>
</body>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> <!--jQuery Core-->
    <script src="script/jquery.collapse.js" type="text/javascript"></script>
    <script src="script/jquery.collapse_storage.js" type="text/javascript"></script>
    <script src="script/jquery.collapse_cookie_storage.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Initializing collapse plugin
            // with custom show/hide methods,
            // persistence plugin and accordion behaviour
            $(".nav").collapse();
            new jQueryCollapse($(".nav"), {
                query: '.collapsible ul'
            });


            /*{
                show: function () {
                    // The context of 'this' is applied to
                    // the collapsed details in a jQuery wrapper 
                    this.slideDown(100);
                },
                hide: function () {
                    this.slideUp(100);
                },
                accordion: false,
                persist: false,
                query: '.nav .collapsible'
            }*/
        });
    </script>
</html>
