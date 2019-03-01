using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward
{
    public partial class home : System.Web.UI.Page
    {

        public void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["LatestNb"] == null)
            ViewState["LatestNb"] = 3;

            List<PropertyImage> lstBannerProp = new List<PropertyImage>();
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            lstBannerProp = db.PropertyImages.Where(x=>x.Description.ToLower().Contains("banner")).ToList();
            if (lstBannerProp.Count > 0)
            {
                rptBanner.DataSource = db.PropertyImages.Where(x => x.Description.ToLower().Contains("banner")).ToList();
                rptBanner.DataBind();
            }
              
           
            List<RealEstateProperty> lstLatestProperties = new List<RealEstateProperty>();
            lstLatestProperties = db.RealEstateProperties.OrderByDescending(x => x.StartDate).Take(int.Parse(ViewState["LatestNb"].ToString())).OrderByDescending(x => x.PRL).ToList();
            rptLatestProperties.DataSource = lstLatestProperties;
            rptLatestProperties.DataBind();

            List<News> lstnews = new List<News>();
            lstnews = db.News.OrderByDescending(x => x.date).Take(2).ToList();
            lstNews.DataSource = lstnews;
            lstNews.DataBind();

            List<HomeTip> lsttips = new List<HomeTip>();
            lsttips = db.HomeTips.OrderByDescending(x => x.dateCreated.Value).Take(2).ToList();
            lstTips.DataSource = lsttips;
            lstTips.DataBind();

            List<Partnership> lstPartnership = new List<Partnership>();
            lstPartnership = db.Partnerships.Take(2).ToList();
            rptPartnership.DataSource = lstPartnership;
            rptPartnership.DataBind();
        }

        protected void btnViewMore_Click(object sender, EventArgs e)
        {

            //ViewState["LatestNb"] = (int.Parse(ViewState["LatestNb"].ToString()) + 3);
            //List<RealEstateProperty> lstLatestProperties = new List<RealEstateProperty>();
            //lstLatestProperties = RealEstateProperty.SelectLatest(false, int.Parse(ViewState["LatestNb"].ToString())).OrderByDescending(x => x.StartDate).OrderByDescending(x => x.PRL).ToList();
            //rptLatestProperties.DataSource = lstLatestProperties;
            //rptLatestProperties.DataBind();

            //UpdatePanel1.Update();
        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtEmail.Text))
            {
                CrimsonCowardEntities db = new CrimsonCowardEntities();
                Subscriber subsc = new Subscriber();
                db.Subscribers.Add(new Subscriber() {email = txtEmail.Text });
                db.SaveChanges();
                Response.Write("<script type='text/javascript'>");
                Response.Write("alert('Dear " + txtEmail.Text + ". Kindly note that your Email has been successfully added!');");
                Response.Write("document.location.href='CCHome.aspx';");
                Response.Write("</script>");
            }

        }
    }
}