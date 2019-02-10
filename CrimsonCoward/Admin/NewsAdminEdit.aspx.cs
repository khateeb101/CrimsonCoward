using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;
using System.IO;

namespace CrimsonCoward.Admin
{
    public partial class NewsAdminEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Params["id"] != null)
                {
                    loadData(Request.Params["id"]);
                }
                else
                {
                    cldDate.SelectedDate = System.DateTime.Now;
                }
            }
        }

        private void loadData(string p)
        {
            Guid _id;
            if (Guid.TryParse(p, out _id))
            {
                CrimsonCowardEntities db = new CrimsonCowardEntities();
                var data = db.News.Where(x => x.Id == _id).FirstOrDefault();
                if (data != null)
                {
                    lblID.Text = data.Id.ToString();
                    txtTitle.Text = data.title;
                    Editor1.Text = data.description;
                    txtSubtitle.Text = data.Subtitle;
                    chkInternational.Checked = data.isInternational.Value;
                    cldDate.SelectedDate = data.date.Value;
                    txtLink.Text = data.link;
                  
                    
                }
            }
        }

        private News fillNews()
        {
            News data = new News();

            
            data.Id = Guid.NewGuid() ;
            data.title = txtTitle.Text;
            data.description = Editor1.Text;
            data.Subtitle = txtSubtitle.Text;
            data.isInternational = chkInternational.Checked;           
            data.date = cldDate.SelectedDate;
            data.link = txtLink.Text;
            
            return data;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            News data = fillNews();
            db.News.Add(data);
            db.SaveChanges();
            Response.Redirect("~/Admin/NewsAdmin.aspx");
        }
    }
}