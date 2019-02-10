using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward
{
    public partial class BlogDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["Id"] != null)
                {
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    var _id = Guid.Parse(Request["Id"]);
                    DAL.BlogCat BlogCat = db.BlogCats.Where(x => x.Id == _id).FirstOrDefault();
                    ltTitle.Text = BlogCat.title;

                    List<DAL.Blog> Blogs = new List<DAL.Blog>();
                    Blogs = db.Blogs.Where(x => x.BlogCatId == BlogCat.Id).ToList();
                    rptBlogs.DataSource = Blogs;
                    rptBlogs.DataBind();
                }
            }


        }
    }
}