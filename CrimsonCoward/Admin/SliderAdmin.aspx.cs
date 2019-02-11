﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward.Admin
{
    public partial class SliderAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            SlidersGridView.DataSource = db.Sliders.ToList();
            SlidersGridView.DataBind();
        }
         protected void SlidersGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/SliderAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                int _id = int.Parse(e.CommandArgument.ToString());
                var slider = db.Sliders.Where(x => x.Id == _id).FirstOrDefault();
                var image = db.Images.Where(x => x.Id == slider.ImageId).FirstOrDefault();
                db.Images.Remove(image);
                db.Sliders.Remove(slider);
                SlidersGridView.DataBind();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/SliderAdminEdit.aspx");
        }
    }
}
