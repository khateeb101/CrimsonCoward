using CrimsonCoward.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrimsonCoward
{
    public partial class PostProperty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string body = GetEmail(false);

            List<string> AttachmentfileNames = new List<string>();

            List<Stream> Attachements = new List<Stream>();

            if (FileUpload1.HasFiles)
            {
                foreach (var file in FileUpload1.PostedFiles)
                {
                    try
                    {
                        if (file.FileName.Split('.')[1].ToLower() == "jpeg" || file.FileName.Split('.')[1].ToLower() == "jpg" || file.FileName.Split('.')[1].ToLower() == "png" || file.FileName.Split('.')[1].ToLower() == "gif")
                        {
                            Attachements.Add(file.InputStream);
                            AttachmentfileNames.Add(file.FileName);
                        }
                        else
                        {
                            lblFileUpload.Text = "Upload status: Only JPEG/JPG/PNG/GIF files are accepted!";
                            return;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblFileUpload.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    }
                }
            }
           

            EmailHelper.SendEmailListBased(ConfigurationManager.AppSettings["EmailTo"],
                "New Contact Message", body, AttachmentfileNames, Attachements);
            Response.Write("<script type='text/javascript'>");
            Response.Write("alert('Dear " + txtFullName.Text + ". Kindly note that your Property has been Successfully received!');");
            Response.Write("document.location.href='postproperty.aspx';");
            Response.Write("</script>");
        }

        private string GetEmail(bool cust)
        {
            string emailBody = "";

            emailBody = File.ReadAllText(string.Format("{0}email\\property.htm", AppDomain.CurrentDomain.BaseDirectory));

            emailBody = emailBody.Replace("[FULL NAME]", txtFullName.Text);
            emailBody = emailBody.Replace("[PERSONNAL ADDRESS]", txtPersonnalAddress.Text);
            emailBody = emailBody.Replace("[PHONE]", txtPhone.Text);
            emailBody = emailBody.Replace("[EMAIL]", txtEmail.Text);
            emailBody = emailBody.Replace("[CITY]", txtCity.Text);
            emailBody = emailBody.Replace("[TYPE]", ddlType.SelectedValue);
            emailBody = emailBody.Replace("[SERVICE]", ddlService.SelectedValue);
            emailBody = emailBody.Replace("[AREA]", txtArea.Text);
            emailBody = emailBody.Replace("[SIZE]", txtSize.Text);
            emailBody = emailBody.Replace("[PRICE]", txtPrice.Text);
            emailBody = emailBody.Replace("[BEDROOMS]", drpBedrooms.Text);
            emailBody = emailBody.Replace("[BATHROOMS]", drpBathrooms.Text);
            emailBody = emailBody.Replace("[BALCONIES]", drpBalconies.Text);
            emailBody = emailBody.Replace("[LIVING]", drpLiving.Text);
            emailBody = emailBody.Replace("[STORAGE]", drpStorage.Text);
            emailBody = emailBody.Replace("[DATE]", DateTime.Now.ToShortDateString());

            return emailBody;
        }
    }
}