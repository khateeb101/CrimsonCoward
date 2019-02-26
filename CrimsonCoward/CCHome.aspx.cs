using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward
{
    public partial class CCHome : System.Web.UI.Page
    {

        public void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["LatestNb"] == null)
            ViewState["LatestNb"] = 3;

            List<DAL.Image> lstImages = new List<DAL.Image>();
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            var sliders = db.Sliders.Where(x => x.Active).ToList();
            lstImages = (from s in db.Sliders join i in db.Images on s.ImageId equals i.Id select i).ToList();
            
            if (lstImages.Count > 0)
            {
                rptBanner.DataSource = lstImages;
                rptBanner.DataBind();
            }
              
        }
        bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }


        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSubscribe.Text))
            {
                if(IsValidEmail(txtSubscribe.Text))
                {
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    Subscriber subsc = new Subscriber();
                    if (db.Subscribers.Where(x => x.email.ToLower() == txtSubscribe.Text.ToLower()).Count() > 0)
                    {
                        Response.Write("<script type='text/javascript'>");
                        Response.Write("alert('Dear " + txtSubscribe.Text + ". your Email already exists');");
                        Response.Write("document.location.href='cchome.aspx';");
                        Response.Write("</script>");
                        return;
                    }
                    db.Subscribers.Add(new Subscriber() {email = txtSubscribe.Text });
                    db.SaveChanges();
                    Response.Write("<script type='text/javascript'>");
                    Response.Write("alert('Dear " + txtSubscribe.Text + ". Kindly note that your Email has been successfully added!');");
                    Response.Write("document.location.href='cchome.aspx';");
                    Response.Write("</script>");
                }
                else
                {
                    Response.Write("<script type='text/javascript'>");
                    Response.Write("alert('Please enter a valid email address');");
                    Response.Write("document.location.href='cchome.aspx';");
                    Response.Write("</script>");
                }
             
            }

        }
    }
}