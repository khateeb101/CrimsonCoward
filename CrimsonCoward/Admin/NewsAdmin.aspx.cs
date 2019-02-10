using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward.Admin
{
    public partial class NewsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            if (ddlNews.SelectedValue == "International")
            {
                NewsGridView.DataSource = db.News.Where(x => x.isInternational.Value).ToList();
                NewsGridView.DataBind();
            }
            else
            {
                NewsGridView.DataSource = db.News.Where(x => !x.isInternational.Value).ToList();
                NewsGridView.DataBind();
            }
        }

        protected void NewsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/NewsAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                Guid _id = Guid.Parse(e.CommandArgument.ToString());
                var New = db.News.Where(x => x.Id == _id).FirstOrDefault();
                db.News.Remove(New);
                NewsGridView.DataBind();
                
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/NewsAdminEdit.aspx");
        }
    }
}