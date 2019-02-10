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
    public partial class PartnershipsAdminEdit : System.Web.UI.Page
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
                var data = db.Partnerships.Where(x => x.Id == _id).FirstOrDefault();
                if (data != null)
                {
                    lblID.Text = data.Id.ToString();
                    txtTitle.Text = data.title;
                    Editor1.Text = data.text;
                    cldDate.SelectedDate = data.dateAdded.Value;
                    if (data.image != null)
                    {
                        imgview.ImageUrl = ResolveUrl("~/") + "Thumbnail.aspx?partnershipId=" + data.Id.ToString() + "&secImg=PartnershipThumb";
                        imgview.Visible = true;
                    }
                    if (data.logo != null)
                    {
                        logoView.ImageUrl = ResolveUrl("~/") + "Thumbnail.aspx?partnershipId=" + data.Id.ToString() + "&logo=true&secImg=logo";
                        logoView.Visible = true;
                    }
                }
            }
        }

        private Partnership fillPartnerships()
        {
            Partnership data = new Partnership();

             
            data.Id = Guid.NewGuid();
            data.title = txtTitle.Text;
            data.text = Editor1.Text;
            data.dateAdded = cldDate.SelectedDate;
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
            if (uplLogo.HasFile)
            {
                try
                {
                    if (uplLogo.FileName.Split('.')[1].ToLower() == "jpeg" || uplLogo.FileName.Split('.')[1].ToLower() == "jpg" || uplLogo.FileName.Split('.')[1].ToLower() == "png" || uplLogo.FileName.Split('.')[1].ToLower() == "gif")
                    {
                        Session["logo"] = Path.GetFileName(uplLogo.FileName);
                        data.logo = uplLogo.FileBytes;
                    }
                    else
                    {
                        lblLogo.Text = "Upload status: Only JPEG/JPG/PNG/GIF files are accepted!";
                        return data;
                    }
                }
                catch (Exception ex)
                {
                    lblLogo.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }           
            return data;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            Partnership data = fillPartnerships();
            db.Partnerships.Add(data);
            db.SaveChanges();
            Response.Redirect("~/Admin/PartnershipsAdmin.aspx");
        }
    }
}