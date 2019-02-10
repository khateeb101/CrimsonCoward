using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward
{
    public partial class Properties : System.Web.UI.Page
    {
        public class DisplayedPrlsType
        {
            public string PropType { get; set; }
            public int PropCount { get; set; }
        }
        int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                List<string> queries = new List<string>();

                if (Page.RouteData.Values.Count == 1)
                {
                    if (Page.RouteData.Values["Prl"].ToString() != null && Page.RouteData.Values["Prl"].ToString().ToLower() != "Prl")
                    {
                        queries.Add(string.Format("(Prl = '" + Page.RouteData.Values["Prl"] + "')"));

                    }
                    //List<RealEstateProperty> prop = RealEstateProperty.AdvancedFind2("where Prl='" + Page.RouteData.Values["Prl"].ToString() + "'");
                    //if (prop != null)
                    //{
                    //    Session["props"] = prop;
                    //}
                }
                else if (Page.RouteData.Values.Count != 0)
                {
                    if (Page.RouteData.Values["For"].ToString() != null && Page.RouteData.Values["For"].ToString().ToLower() != "for")
                    {
                        queries.Add(string.Format("(PropertyFor like '%" + Page.RouteData.Values["For"] + "%')"));
                    }
                    if (Page.RouteData.Values["Type"] != null && Page.RouteData.Values["Type"].ToString().ToLower() != "type")
                    {

                        queries.Add(string.Format("(PropertyType ='{0}')", Page.RouteData.Values["Type"]));
                    }

                   
                    if (Page.RouteData.Values["Region"] != null && Page.RouteData.Values["Region"].ToString().ToLower() != "region")
                    {
                        queries.Add(string.Format("((Neighborhood ='{0}') or (District ='{0}'))", Page.RouteData.Values["Region"]));
                    }
                    if (Page.RouteData.Values["Keyword"] != null && Page.RouteData.Values["Keyword"].ToString().ToLower() != "keyword")
                    {
                        queries.Add(string.Format("((Prl like '%{0}%') or (Features Like '%{0}%') or (Web_GuideDescription Like '%{0}%') or (AdditionalInformation Like '%{0}%') or (Qadaa Like '%{0}%') or (District Like '%{0}%') or (Neighborhood Like '%{0}%'))", Page.RouteData.Values["Keyword"]));
                    }

                    if ((Page.RouteData.Values["MinPrice"] != null && Page.RouteData.Values["MinPrice"].ToString().ToLower() != "min") && (Page.RouteData.Values["MaxPrice"] != null && Page.RouteData.Values["MaxPrice"].ToString().ToLower() != "max"))
                        queries.Add(string.Format("((SalePrice between {0} and {1} and PropertyFor like '%sale%') or (RentPrice between {0} and {1} and PropertyFor like '%rent%'))", Page.RouteData.Values["MinPrice"], Page.RouteData.Values["MaxPrice"]));
                    else if (Page.RouteData.Values["MinPrice"] != null && Page.RouteData.Values["MinPrice"].ToString().ToLower() != "min")
                        queries.Add(string.Format("((SalePrice >= {0} and PropertyFor like '%sale%') or (RentPrice >= {0} and PropertyFor like '%rent%'))", Page.RouteData.Values["MinPrice"].ToString()));
                    else if (Page.RouteData.Values["MaxPrice"] != null && Page.RouteData.Values["MaxPrice"].ToString().ToLower() != "max")
                        queries.Add(string.Format("((SalePrice <= {0} and PropertyFor like '%sale%') or (RentPrice <= {0} and PropertyFor like '%rent%'))", (Page.RouteData.Values["MaxPrice"].ToString())));

                    if ((Page.RouteData.Values["MinSize"] != null && Page.RouteData.Values["MinSize"].ToString().ToLower() != "mins") && (Page.RouteData.Values["MaxSize"] != null && Page.RouteData.Values["MaxSize"].ToString().ToLower() != "maxs"))
                        queries.Add(string.Format("(Size between {0} and {1} )", Page.RouteData.Values["MinSize"], Page.RouteData.Values["MaxSize"]));
                    else if (Page.RouteData.Values["MinSize"] != null && Page.RouteData.Values["MinSize"].ToString().ToLower() != "mins")
                        queries.Add(string.Format("(Size >= {0} )", Page.RouteData.Values["MinSize"].ToString()));
                    else if (Page.RouteData.Values["MaxSize"] != null && Page.RouteData.Values["MaxSize"].ToString().ToLower() != "maxs")
                        queries.Add(string.Format("(Size <= {0} )", (Page.RouteData.Values["MaxSize"].ToString())));

                    string allQuery = string.Empty;
                    foreach (string item in queries)
                    {
                        if (string.IsNullOrEmpty(allQuery))
                            allQuery = " where " + item;
                        else
                            allQuery = allQuery + " and " + item;
                    }

                    allQuery = allQuery + " order by StartDate desc, PRL Desc";

                    //List<RealEstateProperty> prop = RealEstateProperty.AdvancedFind2(allQuery);
                    //if (prop != null)
                    //{
                    //    Session["props"] = prop;
                    //}

                }

                else
                {
                    List<RealEstateProperty> prop = new List<RealEstateProperty>();
                    //prop = RealEstateProperty.AdvancedFind2("").OrderByDescending(x => x.StartDate).OrderByDescending(x => x.PRL).ToList();
                    //Session["props"] = prop;

                }
                rptProjects.DataSource = Session["props"];
                rptProjects.DataBind();

                //RebindTypes();
            }
            

        }
       //protected void RebindTypes()
       //{
       //    List<DisplayedPrlsType> lstDisplayedPrlsType = new List<DisplayedPrlsType>();
       //
       //    foreach (ListViewDataItem li in rptProjects.Items)
       //    {
       //        HiddenField MyLnk = (HiddenField)li.FindControl("hdnType");
       //        if (lstDisplayedPrlsType.Where(x => x.PropType == MyLnk.Value).Count() > 0)
       //        {
       //            lstDisplayedPrlsType.Where(x => x.PropType == MyLnk.Value).First().PropCount += 1;
       //        }
       //        else
       //        {
       //            DisplayedPrlsType item = new DisplayedPrlsType();
       //            item.PropType = MyLnk.Value;
       //            item.PropCount = 1;
       //
       //            lstDisplayedPrlsType.Add(item);
       //        }
       //
       //
       //    }
       //
       //    //rptPropTypes.DataSource = lstDisplayedPrlsType;
       //    //rptPropTypes.DataBind();
       //}
        protected void rptProjects_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dtProps.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            i = 0;
            BindRepeater();
            //RebindTypes();
        }
        void BindRepeater()
        {
            if (Session["props"] != null)
            {
                List<RealEstateProperty> prop = Session["props"] as List<RealEstateProperty>;
                if (prop != null)
                {
                    rptProjects.DataSource = prop;
                    rptProjects.DataBind();
                }
            }
            else
            {
                //List<RealEstateProperty> prop = RealEstateProperty.AdvancedFind2("");
                //if (prop != null)
                //{
                //    rptProjects.DataSource = prop;
                //    rptProjects.DataBind();
                //}
            }
        }

        protected void AppartmentFilter_Click(object sender, EventArgs e)
        {
            List<RealEstateProperty> prop = Session["props"] as List<RealEstateProperty>;
            List<RealEstateProperty> NewProp = new List<RealEstateProperty>();
            foreach (var item in prop)
            {
                if (item.PropertyType.ToLower() == "apartment")
                {
                    NewProp.Add(item);
                }

            }
            rptProjects.DataSource = NewProp;

            rptProjects.DataBind();
        }


    }
}