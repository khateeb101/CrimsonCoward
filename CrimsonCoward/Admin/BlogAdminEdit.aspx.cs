using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using CrimsonCoward.DAL;
using System.Web.UI.WebControls;
 
using System.IO;

namespace CrimsonCoward.Admin
{
    public partial class BlogAdminEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                drpBlogCats.Items.Clear();
                drpBlogCats.DataSource = db.BlogCats;
                drpBlogCats.DataTextField = "Title";
                drpBlogCats.DataValueField = "Id";
                drpBlogCats.DataBind();
                if (Request.Params["id"] != null)
                {
                    loadData(Request.Params["id"]);
                }
                else
                {
                    cldDate.SelectedDate = System.DateTime.Now;
                }
            }
        }

        private void loadData(string p)
        {
            Guid _id;
            if (Guid.TryParse(p, out _id))
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                DAL.Blog  blog= db.Blogs.Where(x=>x.Id == _id).FirstOrDefault();
                if (blog != null)
                {
                    lblID.Text = blog.Id.ToString();
                    txtTitle.Text = blog.title;
                    Editor1.Text = blog.description;
                    txtSubtitle.Text = blog.Subtitle;
                    drpBlogCats.SelectedValue = blog.BlogCatId.ToString();
                    cldDate.SelectedDate = blog.date.Value;
                    txtLink.Text = blog.link;
                    if(blog.image !=null)
                    {
                        imgview.ImageUrl = ResolveUrl("~/") + "Thumbnail.aspx?Blogid=" + blog.Id.ToString() + "&secImg=HomeNewsThumb";
                        imgview.Visible = true;
                    }
                    
                }
            }
        }

        private DAL.Blog fillBlogs()
        {
            DAL.Blog data = new DAL.Blog();

            Guid _id;
            Guid.TryParse(lblID.Text, out _id);
            data.Id = _id;
            data.title = txtTitle.Text;
            data.description = Editor1.Text;
            data.Subtitle = txtSubtitle.Text;
            data.BlogCatId = Guid.Parse(drpBlogCats.SelectedValue);           
            data.date = cldDate.SelectedDate;
            data.link = txtLink.Text;
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

            DAL.Blog data = fillBlogs();
             db.SaveChanges();
            Response.Redirect("~/Admin/BlogsAdmin.aspx");
        }
    }
}