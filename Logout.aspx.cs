using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Write("<script>alert('成功退出！')</script>");
        Response.Write("<script language=javascript>top.location.href='Login.aspx'</script>");
    }
}