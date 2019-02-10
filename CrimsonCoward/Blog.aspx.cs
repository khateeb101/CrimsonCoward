using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward
{
    public partial class Blog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            List<DAL.Blog> lstBlogCat = new List<DAL.Blog>();
            lstBlogCat = db.Blogs.ToList();
            rptBlogsCat.DataSource = lstBlogCat;
            rptBlogsCat.DataBind();
        }
        //protected void rptBlogsCat_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        //{
        //    dtBlogCat.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        //    rptBlogsCat.DataBind();
        //}
    }
}