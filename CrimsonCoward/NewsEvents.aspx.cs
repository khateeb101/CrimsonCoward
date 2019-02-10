using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward
{
    public partial class NewsEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            List<DAL.News> lstNews = db.News.ToList();
            rptNews.DataSource = lstNews;
            rptNews.DataBind();
        }
        protected void rptNews_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dtNews.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            rptNews.DataBind();
        }
    }
}