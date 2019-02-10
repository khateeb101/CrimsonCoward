using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward
{
    public partial class UcSearch : System.Web.UI.UserControl
    {
        public string Regions { get; set; }
        public List<KeyValuePair<string, string>> lstRentValues = new List<KeyValuePair<string, string>>();
        public List<KeyValuePair<string, string>> lstBuyValues = new List<KeyValuePair<string, string>>();
        public List<KeyValuePair<string, string>> lstAreaValues = new List<KeyValuePair<string, string>>();

        protected void Page_Load(object sender, EventArgs e)
        {
            lstAreaValues.Add(new KeyValuePair<string, string>("50 sqm", "50"));
            lstAreaValues.Add(new KeyValuePair<string, string>("100 sqm", "100"));
            lstAreaValues.Add(new KeyValuePair<string, string>("150 sqm", "150"));
            lstAreaValues.Add(new KeyValuePair<string, string>("200 sqm", "200"));
            lstAreaValues.Add(new KeyValuePair<string, string>("250 sqm", "250"));
            lstAreaValues.Add(new KeyValuePair<string, string>("300 sqm", "300"));
            lstAreaValues.Add(new KeyValuePair<string, string>("350 sqm", "350"));
            lstAreaValues.Add(new KeyValuePair<string, string>("400 sqm", "400"));
            lstAreaValues.Add(new KeyValuePair<string, string>("450 sqm", "450"));
            lstAreaValues.Add(new KeyValuePair<string, string>("500 sqm", "500"));
            lstAreaValues.Add(new KeyValuePair<string, string>("550 sqm", "550"));
            lstAreaValues.Add(new KeyValuePair<string, string>("600 sqm", "600"));
            lstAreaValues.Add(new KeyValuePair<string, string>("700 sqm", "700"));
            lstAreaValues.Add(new KeyValuePair<string, string>("800 sqm", "800"));
            lstAreaValues.Add(new KeyValuePair<string, string>("900 sqm", "900"));
            lstAreaValues.Add(new KeyValuePair<string, string>("1,000 sqm", "1000"));
            lstAreaValues.Add(new KeyValuePair<string, string>("1,100 sqm", "1100"));
            lstAreaValues.Add(new KeyValuePair<string, string>("1,200 sqm", "1200"));
            lstAreaValues.Add(new KeyValuePair<string, string>("1,300 sqm", "1300"));
            lstAreaValues.Add(new KeyValuePair<string, string>("1,400 sqm", "1400"));
            lstAreaValues.Add(new KeyValuePair<string, string>("1,500 sqm", "1500"));
            lstAreaValues.Add(new KeyValuePair<string, string>("1,600 sqm", "1600"));
            lstAreaValues.Add(new KeyValuePair<string, string>("1,700 sqm", "1700"));
            lstAreaValues.Add(new KeyValuePair<string, string>("1,900 sqm", "1900"));
            lstAreaValues.Add(new KeyValuePair<string, string>("2,100 sqm", "2100"));
            lstAreaValues.Add(new KeyValuePair<string, string>("2,300 sqm", "2300"));
            lstAreaValues.Add(new KeyValuePair<string, string>("2,500 sqm", "2500"));
            lstAreaValues.Add(new KeyValuePair<string, string>("2,700 sqm", "2700"));
            lstAreaValues.Add(new KeyValuePair<string, string>("2,900 sqm", "2900"));
            lstAreaValues.Add(new KeyValuePair<string, string>("3,100 sqm", "3100"));
            lstAreaValues.Add(new KeyValuePair<string, string>("3,300 sqm", "3300"));
            lstAreaValues.Add(new KeyValuePair<string, string>("3,500 sqm", "3500"));
            lstAreaValues.Add(new KeyValuePair<string, string>("3,700 sqm", "3700"));
            lstAreaValues.Add(new KeyValuePair<string, string>("3,900 sqm", "3900"));

            lstRentValues.Add(new KeyValuePair<string, string>("500 USD/month",    "500"));
            lstRentValues.Add(new KeyValuePair<string, string>("1,000 USD/month",  "1000"));
            lstRentValues.Add(new KeyValuePair<string, string>("2,500 USD/month",  "2500"));
            lstRentValues.Add(new KeyValuePair<string, string>("5,000 USD/month",  "5000"));
            lstRentValues.Add(new KeyValuePair<string, string>("7,500 USD/month",  "7500"));
            lstRentValues.Add(new KeyValuePair<string, string>("10,000 USD/month", "10000"));
            lstRentValues.Add(new KeyValuePair<string, string>("12,500 USD/month", "12500"));
            lstRentValues.Add(new KeyValuePair<string, string>("15,000 USD/month", "15000"));
            lstRentValues.Add(new KeyValuePair<string, string>("20,000 USD/month", "20000"));
            lstRentValues.Add(new KeyValuePair<string, string>("25,000 USD/month", "25000"));
            lstRentValues.Add(new KeyValuePair<string, string>("30,000 USD/month", "30000"));
            lstRentValues.Add(new KeyValuePair<string, string>("40,000 USD/month", "40000"));
            lstRentValues.Add(new KeyValuePair<string, string>("50,000 USD/month", "50000"));

            lstBuyValues.Add(new KeyValuePair<string, string>("100,000 USD" ,  "100000" ));
            lstBuyValues.Add(new KeyValuePair<string, string>("200,000 USD" ,  "200000" ));
            lstBuyValues.Add(new KeyValuePair<string, string>("300,000 USD" ,  "300000" ));
            lstBuyValues.Add(new KeyValuePair<string, string>("400,000 USD" ,  "400000" ));
            lstBuyValues.Add(new KeyValuePair<string, string>("500,000 USD" ,  "500000" ));
            lstBuyValues.Add(new KeyValuePair<string, string>("600,000 USD" ,  "600000" ));
            lstBuyValues.Add(new KeyValuePair<string, string>("700,000 USD" ,  "700000" ));
            lstBuyValues.Add(new KeyValuePair<string, string>("800,000 USD" ,  "800000" ));
            lstBuyValues.Add(new KeyValuePair<string, string>("900,000 USD" ,  "900000" ));
            lstBuyValues.Add(new KeyValuePair<string, string>("1,000,000 USD" ,"1000000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("1,100,000 USD" ,"1100000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("1,200,000 USD" ,"1200000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("1,300,000 USD" ,"1300000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("1,400,000 USD" ,"1400000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("1,500,000 USD" ,"1500000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("1,600,000 USD" ,"1600000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("1,700,000 USD" ,"1700000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("1,800,000 USD" ,"1800000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("1,900,000 USD" ,"1900000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("2,000,000 USD" ,"2000000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("2,250,000 USD" ,"2250000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("2,500,000 USD" ,"2500000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("2,750,000 USD" ,"2750000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("3,000,000 USD" ,"3000000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("3,250,000 USD" ,"3250000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("3,500,000 USD" ,"3500000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("3,750,000 USD" ,"3750000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("4,000,000 USD" ,"4000000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("4,250,000 USD" ,"4250000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("4,500,000 USD" ,"4500000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("4,750,000 USD" ,"4750000"));
            lstBuyValues.Add(new KeyValuePair<string, string>("5,000,000 USD" ,"5000000"));

           
            if (!IsPostBack)
            {
                CrimsonCowardEntities db = new CrimsonCowardEntities();
                if (Page.RouteData.Values["For"] != null)
                {
                    if (Page.RouteData.Values["For"].ToString().ToLower() == "sale")
                    {
                        ddlFor.SelectedValue = "Sale";
                    }
                    if (Page.RouteData.Values["For"].ToString().ToLower() == "rent")
                    {
                        ddlFor.SelectedValue = "Rent";
                    }
                }
                ddlType.Items.Clear();
                ddlType.Items.Add(new ListItem("PROPERTY TYPE", ""));
                foreach (string item in db.RealEstateProperties.Select(x=>x.PropertyType).Distinct())
                {
                    ddlType.Items.Add(item);
                }

                drpMinArea.DataSource = drpMaxArea.DataSource = lstAreaValues.ToList();
                drpMinArea.DataTextField = drpMaxArea.DataTextField = "Key";
                drpMinArea.DataValueField = drpMaxArea.DataValueField = "Value";
                drpMinArea.DataBind();
                drpMaxArea.DataBind();
                drpMinArea.Items.Insert(0, new ListItem("Area MIN.", "0"));
                drpMaxArea.Items.Insert(0, new ListItem("Area MAX.", "0"));

                List<string> Locations = new List<string>();
                List<string> Countries = new List<string>();
                //foreach (string Country in RealEstateProperty.GetAllCountries())
                //{
                //    Locations.Add(Country);
                //    List<String> lstQadaaByCountry = RealEstateProperty.GetAllQadaasByCountry(Country);
                //    lstQadaaByCountry = lstQadaaByCountry.Select(r => Country+", "+r).ToList();
                //    Locations.AddRange(lstQadaaByCountry);

                //    List<string> Qadaas = new List<string>();
                foreach (string Qadaa in db.RealEstateProperties.Where(x=>x.Country.ToLower() == "lebanon").Select(x=>x.Qadaa).Distinct())
                {
                    Locations.Add(Qadaa);

                    List<string> Districts = new List<string>();
                    foreach (string District in db.RealEstateProperties.Where(x=>x.Qadaa.ToLower() == Qadaa.ToLower() && x.Country.ToLower()=="lebanon").Select(x=>x.District))
                    {
                        Locations.Add(Qadaa + ", " + District);
                        foreach (string Neighborhood in db.RealEstateProperties.Where(x=>x.Qadaa.ToLower() == Qadaa.ToLower() && x.District.ToLower() == District.ToLower() && x.Country.ToLower() == "lebanon").Select(x=>x.Neighborhood))
                        {
                            Locations.Add(Qadaa + ", " + District + ", " + Neighborhood);
                        }
                    }
                }
                //}

                foreach (string item in Locations.Where(r => r != "").Distinct())
                {
                    Regions = Regions + "'" + item + "',";
                }
                if (Regions != null && Regions.Contains(','))
                    Regions = Regions.TrimEnd(',');
                //ddlRegion.DataSource = Locations.Where(r => r != "").Distinct();
                //ddlRegion.DataBind();

                ddlFor_SelectedIndexChanged(null, null);
            }
        }

        protected void lnkReloadDataForThisRegion_Click(object sender, EventArgs e)
        {
               
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session.Clear();

            string SearchQuery = "";

           //if (!string.IsNullOrEmpty(txtRef.Text) && (txtRef.Text != "Ref# / Keywords"))
           //{
           //    SearchQuery = txtRef.Text;
           //    Response.Redirect("/OurProperties-Prl/" + SearchQuery);
           //}
           //else
           //{
                string Region = "";
                if(!string.IsNullOrEmpty(ddlRegion.Value))
                {
                    if(ddlRegion.Value.Contains(','))
                    {
                        Region = ddlRegion.Value.Substring(ddlRegion.Value.LastIndexOf(',') + 2);
                    }
                    else
                    {
                        Regions = ddlRegion.Value;
                    }
                }


            SearchQuery = '/' + (!String.IsNullOrEmpty(ddlFor.SelectedValue) ? ddlFor.SelectedValue.ToLower() : "For") + '/';
            SearchQuery = SearchQuery + (!String.IsNullOrEmpty(ddlType.SelectedValue) ? ddlType.SelectedValue.ToLower() : "Type") + '/';
            SearchQuery = SearchQuery + (!String.IsNullOrEmpty(drpMinPrice.SelectedValue) && drpMinPrice.SelectedValue != "0" ? drpMinPrice.SelectedValue : "Min") + '/';
            SearchQuery = SearchQuery + (!String.IsNullOrEmpty(drpMaxPrice.SelectedValue) && drpMaxPrice.SelectedValue != "0" ? drpMaxPrice.SelectedValue : "Max") + '/';
            SearchQuery = SearchQuery + (!String.IsNullOrEmpty(drpMinArea.SelectedValue) && drpMinArea.SelectedValue != "0" ? drpMinArea.SelectedValue : "MinS") + '/';
            SearchQuery = SearchQuery + (!String.IsNullOrEmpty(drpMaxArea.SelectedValue) && drpMaxArea.SelectedValue != "0" ? drpMaxArea.SelectedValue : "MaxS") + '/';
            SearchQuery = SearchQuery + (!String.IsNullOrEmpty(Region) ? Region : "Region")+'/';
            SearchQuery = SearchQuery + (!String.IsNullOrEmpty(txtRef.Text) && txtRef.Text != "Keyword" ? txtRef.Text : "Keyword");
            //Session["criteria"] = GetCriteria();
            Response.Redirect("/OurProperties/" + SearchQuery);
            }

        protected void ddlFor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFor.SelectedValue.ToLower() == "rent")
            {
                drpMinPrice.DataSource = drpMaxPrice.DataSource = lstRentValues.ToList();
                //ddlFor.Style.Remove("color");
            }
            else if (ddlFor.SelectedValue.ToLower() == "sale")
            {
                drpMinPrice.DataSource = drpMaxPrice.DataSource = lstBuyValues.ToList();
                //ddlFor.Style.Remove("color");
            }
            else
            {
                drpMinPrice.DataSource = drpMaxPrice.DataSource = lstBuyValues.ToList();
                //ddlFor.Style.Add("color", "#acacac");
            }
            drpMinPrice.DataTextField = drpMaxPrice.DataTextField = "Key";
            drpMinPrice.DataValueField = drpMaxPrice.DataValueField = "Value";
            drpMinPrice.DataBind();
            drpMaxPrice.DataBind();
            drpMinPrice.Items.Insert(0, new ListItem("PRICE MIN.", "0"));
            drpMaxPrice.Items.Insert(0, new ListItem("PRICE MAX.", "0"));
        }
        }
    //}
}