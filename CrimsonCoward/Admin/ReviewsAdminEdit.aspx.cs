using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;
using System.IO;

namespace CrimsonCoward.Admin
{
    public partial class ReviewsAdminEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Params["id"] != null)
                {
                    loadData(Request.Params["id"]);
                }
            }
        }

        private void loadData(string pp)
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            Guid _id = new Guid(pp);
            Reviews reviews = db.Reviews.Where(x => x.Id == _id).FirstOrDefault();
          

            if (reviews != null)
            {
             
                var data = db.Images.Where(x => x.Id == reviews.ImageID).FirstOrDefault();
                if (data != null)
                {
                    lblID.Text = data.Id.ToString();
                    
                    if (data.File != null)
                    {
                        imgview.ImageUrl = ResolveUrl("~/") + "Thumbnail.aspx?ReviewsId=" + _id + "&secImg=HomeTips";
                        imgview.Visible = true;
                    }
                }
            }
        }

        private DAL.Image fillReviews()
        {
            DAL.Image data = new DAL.Image();
            if (uplImage.HasFile)
            {
                try
                {
                    if (uplImage.FileName.Split('.')[1].ToLower() == "jpeg" || uplImage.FileName.Split('.')[1].ToLower() == "jpg" || uplImage.FileName.Split('.')[1].ToLower() == "png" || uplImage.FileName.Split('.')[1].ToLower() == "gif")
                    {
                            Session["image"] = Path.GetFileName(uplImage.FileName);
                            data.Name = uplImage.FileName.Split('.')[0].ToLower();
                            data.Ext = uplImage.FileName.Split('.')[1].ToLower();
                            data.Desc = "Reviews";
                            data.File = uplImage.FileBytes;                                                       
                    }
                    else
                    {
                        lblImage.Text = "Upload status: Only JPEG/JPG/PNG/GIF files are accepted!";
                        return data;
                    }
                }
                catch (Exception ex)
                {
                    lblImage.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            return data;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            if (Request.Params["id"] != null)
            {
                var id = new Guid(Request.Params["id"]);
                var reviews = db.Reviews.Where(x => x.Id == id).FirstOrDefault();
                var image = db.Images.Where(x => x.Id == reviews.ImageID).FirstOrDefault();
                db.Images.Remove(image);
                db.Reviews.Remove(reviews);
            }
            DAL.Image data = fillReviews();
            db.Images.Add(data);
            db.SaveChanges();
            db.Reviews.Add(new Reviews { ImageID = data.Id, IsActive = chkActive.Checked });
            db.SaveChanges();
            Response.Redirect("~/Admin/ReviewsAdmin.aspx");
        }
    }
}