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

      
        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            //if (!string.IsNullOrEmpty(txtEmail.Text))
            //{
            //    CrimsonCowardEntities db = new CrimsonCowardEntities();
            //    Subscriber subsc = new Subscriber();
            //    db.Subscribers.Add(new Subscriber() {email = txtEmail.Text });
            //    db.SaveChanges();
            //    Response.Write("<script type='text/javascript'>");
            //    Response.Write("alert('Dear " + txtEmail.Text + ". Kindly note that your Email has been successfully added!');");
            //    Response.Write("document.location.href='home.aspx';");
            //    Response.Write("</script>");
            //}

        }
    }
}