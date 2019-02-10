using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward.Admin
{
    public partial class Blogs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            BlogsGridView.DataBind();
           
        }

        protected void BlogsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/BlogAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {

                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                Guid _id = Guid.Parse(e.CommandArgument.ToString());
                var blog = db.Blogs.Where(x=>x.Id == _id).FirstOrDefault();
                db.Blogs.Remove(blog);
                BlogsGridView.DataBind();
                
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/BlogAdminEdit.aspx");
        }
    }
}