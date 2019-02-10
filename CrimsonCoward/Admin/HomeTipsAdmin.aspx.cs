using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward.Admin
{
    public partial class HomeTipsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              
        }
        
        protected void HomeTipsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/HomeTipsEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                Guid _id = Guid.Parse(e.CommandArgument.ToString());
                CrimsonCowardEntities db = new CrimsonCowardEntities();
                var homeTips = db.HomeTips.Where(x => x.Id == _id).FirstOrDefault() ;
                db.HomeTips.Remove(homeTips);
                HomeTipsGridView.DataBind();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/HomeTipsEdit.aspx");
        }
    }
}
    