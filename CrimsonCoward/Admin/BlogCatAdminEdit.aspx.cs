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
    public partial class BlogCatAdminEdit : System.Web.UI.Page
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

        private void loadData(string p)
        {
            Guid _id;
            if (Guid.TryParse(p, out _id))
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                BlogCat data = db.BlogCats.Where(x => x.Id == _id).FirstOrDefault();
                if (data != null)
                {
                    lblID.Text = data.Id.ToString();
                    txtTitle.Text = data.title;
                    if(data.image !=null)
                    {
                        imgview.ImageUrl = ResolveUrl("~/") + "Thumbnail.aspx?BlogCatid=" + data.Id.ToString() + "&secImg=HomeNewsThumb";
                        imgview.Visible = true;
                    }
                    
                }
            }
        }

        private BlogCat fillBlogCat()
        {
            BlogCat data = new BlogCat();

            Guid _id;
            Guid.TryParse(lblID.Text, out _id);
            data.Id = _id;
            data.title = txtTitle.Text;
            if (uplImage.HasFile)
            {
                try
                {
                    if (uplImage.FileName.Split('.')[1].ToLower() == "jpeg" || uplImage.FileName.Split('.')[1].ToLower() == "jpg" || uplImage.FileName.Split('.')[1].ToLower() == "png" || uplImage.FileName.Split('.')[1].ToLower() == "gif")
                    {
                            Session["image"] = Path.GetFileName(uplImage.FileName);
                            data.image = uplImage.FileBytes;                                                       
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
            BlogCat data = fillBlogCat();
            db.BlogCats.Add(data);
            db.SaveChanges();
            Response.Redirect("~/Admin/BlogsCatAdmin.aspx");
        }
    }
}