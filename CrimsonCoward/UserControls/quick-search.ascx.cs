using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrimsonCoward.UserControls
{
    public partial class quick_search : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    Session.Clear();
        //    Session["criteria"] = GetCriteria();
        //    Response.Redirect("~/properties.aspx");
        //}

        //private string GetCriteria()
        //{
        //    List<string> queries = new List<string>();           

        //    //Reference
        //    if (!String.IsNullOrEmpty(txtQuickSearch.Text))
        //        queries.Add(string.Format("(PRL Like '%{0}%' )", txtQuickSearch.Text.ToLower()));          

        //    string allQuery = string.Empty;
        //    foreach (string item in queries)
        //    {
        //        if (string.IsNullOrEmpty(allQuery))
        //            allQuery = " where " + item;
        //        else
        //            allQuery = allQuery + " and " + item;
        //    }

        //    return allQuery;
        //}
    }
}