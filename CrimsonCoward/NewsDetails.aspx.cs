using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward
{
    public partial class NewsDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request["Id"] != null)
            {
                CrimsonCowardEntities db = new CrimsonCowardEntities();
                var _id = Guid.Parse(Request["Id"]);
                DAL.News news = db.News.Where(x=>x.Id == _id).FirstOrDefault();
                img.ImageUrl = ResolveUrl("~/") + "Thumbnail.aspx?Newsid=" + news.Id + "&secImg=HomeTips";
                img.AlternateText = news.title;
                ltrTitle.Text = news.title;
                ltrSubtitle.Text = news.Subtitle;
                ltrDesc.Text = "<span class=\"twoColumns\">"+ news.description+"</span>";
            }
            
        }
    }
}