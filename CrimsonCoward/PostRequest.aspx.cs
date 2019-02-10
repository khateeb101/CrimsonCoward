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
    public partial class PostRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string body = GetEmail(false);

            EmailHelper.SendEmail(ConfigurationManager.AppSettings["EmailTo"],
                "New Contact Message", body);
            Response.Write("<script type='text/javascript'>");
            Response.Write("alert('Dear " + txtFullName.Text + ". Kindly note that your Request has been Successfully received!');");
            Response.Write("document.location.href='postrequest.aspx';");
            Response.Write("</script>");
            EmailHelper.SendEmail(txtEmail.Text, "[Auto-Reply] Thank You For Your Email", "Dear Mr./ Ms. " + txtFullName.Text + "<br/>Thank you for submitting your request, we will be soon in contact with you <br/><br/> Best, ");




        }

        private string GetEmail(bool cust)
        {
            string emailBody = "";

            emailBody = File.ReadAllText(string.Format("{0}email\\request.htm", AppDomain.CurrentDomain.BaseDirectory));

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
            emailBody = emailBody.Replace("[REQUIREMENTS]", txtRequirements.Text);
            emailBody = emailBody.Replace("[BEDROOMS]", drpBedrooms.Text);
            emailBody = emailBody.Replace("[BATHROOMS]", drpBathrooms.Text);
            emailBody = emailBody.Replace("[BALCONIES]", drpBalconies.Text);
            emailBody = emailBody.Replace("[LIVING]", drpLiving.Text);
            emailBody = emailBody.Replace("[STORAGE]", drpStorage.Text);
            emailBody = emailBody.Replace("[AC]", chkAc.Checked.ToString());
            emailBody = emailBody.Replace("[BOILER]", chkBoiler.Checked.ToString());
            emailBody = emailBody.Replace("[FLOOR]", txtFloor.Text);
            emailBody = emailBody.Replace("[DATE]", DateTime.Now.ToShortDateString());

            return emailBody;
        }
    }
}