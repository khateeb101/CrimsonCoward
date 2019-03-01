using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward.Admin
{
    public partial class ReviewsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            ReviewsGridView.DataSource = db.Reviews.ToList();
            ReviewsGridView.DataBind();
        }
         protected void ReviewsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/ReviewsAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                int _id = int.Parse(e.CommandArgument.ToString());
                var slider = db.Sliders.Where(x => x.Id == _id).FirstOrDefault();
                var image = db.Images.Where(x => x.Id == slider.ImageId).FirstOrDefault();
                db.Images.Remove(image);
                db.Sliders.Remove(slider);
                db.SaveChanges();
                ReviewsGridView.DataSource = db.Reviews.ToList();
                ReviewsGridView.DataBind();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reviews/ReviewsAdminEdit.aspx");
        }
    }
}
