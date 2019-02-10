using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward.Admin
{
    public partial class PartnershipsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            PartnershipsGridView.DataSource = db.Partnerships.ToList();
            PartnershipsGridView.DataBind();
        }
         protected void PartnershipsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/PartnershipsAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                Guid _id = Guid.Parse(e.CommandArgument.ToString());
                var partnership = db.Partnerships.Where(x => x.Id == _id).FirstOrDefault();
                db.Partnerships.Remove(partnership);
                PartnershipsGridView.DataBind();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/PartnershipsAdminEdit.aspx");
        }
    }
}
