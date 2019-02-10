using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;
namespace CrimsonCoward
{
    public partial class HomeTips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            List<HomeTip> lstHomeTips = db.HomeTips.ToList();
            rptHomeTips.DataSource = lstHomeTips;
            rptHomeTips.DataBind();
        }
        protected void rptHomeTips_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dtHomeTips.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            rptHomeTips.DataBind();
        }
    }
}