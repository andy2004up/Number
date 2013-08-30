<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Code.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">

        /* 5/10 建立 Alphea  */

        //自動重新整理
        jQuery(document).ready(init);
        function init() {
            jQuery("img[name='imgCode']").attr("src", "ValidateNumber.ashx?" + Math.random());
            //驗證碼逾時
            if (nowValidateNumber == "" || nowValidateNumber == null) {
                alert("Time Out!!");
                return false;
            }

        }
        /* AJAX 失敗.....  */
        function isPassValidateCode() {
            var nowValidateNumber = jQuery.ajax({
                url: "readSessionValidateNumber.ashx",
                type: "post",
                async: false,
                data: {},
                success: function (htmlVal) { }
            }).responseText;

            var userInput = jQuery("#<%= txt_input.ClientID%>").val();

          var validateResult = ((nowValidateNumber == userInput) ? true : false);


          if (validateResult == false) {
              jQuery("#span_result").html("驗證碼輸入不正確");
          } else {
              jQuery("#span_result").html("pass");
          }

          return validateResult;
      }
    </script>
    <style type="text/css">
    #span_result
    {
     color:Red;
     font-size:12px;     
     }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      
     <img src="ValidateNumber.ashx" alt="驗證碼" name="imgCode" />
     <input type="button" onclick="form1.imgCode.src = 'ValidateNumber.ashx?' + Math.random();" value="重新整理" />
     <hr />
 
     <asp:TextBox ID="txt_input" runat="server" /><span id="span_result"></span>
     <br />
     <asp:Button Text="送出" ID="btn_submit" runat="server"
        onclick="btn_submit_Click" OnClientClick="" />
     <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
</body>
</html>

