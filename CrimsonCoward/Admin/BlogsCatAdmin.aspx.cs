using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward.Admin
{
    public partial class BlogsCatAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BlogsCatGridView.DataBind();
        }

        protected void BlogsCatGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/BlogCatAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                CrimsonCowardEntities db = new CrimsonCowardEntities();
                Guid _id = Guid.Parse(e.CommandArgument.ToString());

                var blogs = db.Blogs.Where(x=>x.BlogCatId == _id).ToList();
                db.Blogs.RemoveRange(blogs);
                var blogCat = db.BlogCats.Where(x => x.Id == _id).FirstOrDefault();
                db.BlogCats.Remove(blogCat);
                BlogsCatGridView.DataBind();

            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/BlogCatAdminEdit.aspx");
        }
    }
}