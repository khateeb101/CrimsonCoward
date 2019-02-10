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
    public partial class HomeTipsEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                CrimsonCowardEntities db = new CrimsonCowardEntities();
                var data = db.HomeTips.Where(x => x.Id == _id).FirstOrDefault();
              
                if (data != null)
                {
                    lblID.Text = data.Id.ToString();
                    txtTitle.Text = data.title;
                    txtLink.Text = data.link;
                    Editor1.Text = data.text1;
                    Editor2.Text = data.text2;
                    cldDate.SelectedDate = data.dateCreated.Value;
                    if (data.image != null)
                    {
                        imgview.ImageUrl = ResolveUrl("~/") + "Thumbnail.aspx?HomeTipid=" + data.Id.ToString() + "&secImg=HomeNewsThumb";
                        imgview.Visible = true;
                    }
                }
            }
        }

        private HomeTip fillHomeTips()
        {
            HomeTip data = new HomeTip();

            Guid _id;
            Guid.TryParse(lblID.Text, out _id);
            data.Id = _id;
            data.title = txtTitle.Text;
            data.link = txtLink.Text;
            data.text1 = Editor1.Text;
            data.text2 = Editor2.Text;
           
            data.dateCreated = cldDate.SelectedDate;
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
            HomeTip data = fillHomeTips();
            db.HomeTips.Add(data);
            db.SaveChanges();
            Response.Redirect("~/Admin/HomeTipsAdmin.aspx");
        }
    }
}