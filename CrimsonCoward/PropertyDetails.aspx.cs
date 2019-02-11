using CrimsonCoward.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrimsonCoward
{
    public partial class PropertyDetails : System.Web.UI.Page
    {
        public int PropertyroomsCount
        {
            get
            {
                string prl = Request["Prl"] != null ? Request["Prl"] : Page.RouteData.Values["prl"].ToString();
                if (!string.IsNullOrEmpty(prl))
                {
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    RealEstateProperty _prop = db.RealEstateProperties.Where(x=>x.PRL == prl).FirstOrDefault();
                    return 0;
                }
                else
                {
                    return 0;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string prl = Request["Prl"] != null ? Request["Prl"] : Page.RouteData.Values["prl"].ToString();
                if (!string.IsNullOrEmpty(prl))
                {

                    BindData(prl);
                    IntrestedUrl.NavigateUrl = IntrestedUrl1.NavigateUrl = ResolveUrl("~/") + "contactUs/" + prl;
                }
            }
        }

        private void BindData(string prl)
        {
            string _prl = prl;
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            RealEstateProperty _prop = db.RealEstateProperties.Where(x=>x.PRL == _prl).FirstOrDefault();
            if (_prop != null)
            {
                Page.Title = _prop.PropertyType + " for " + _prop.PropertyFor + " in " + _prop.Neighborhood + " | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon";
                List<PropertyImage> thumbsList = db.PropertyImages.Where(x=>x.PRL== _prop.PRL).ToList();


                if (thumbsList != null && thumbsList.Count > 0)
                {
                    //imgsOpeningDiv.Visible = imgsEndDiv.Visible = true;//(thumbsList.Count > 5);                                 
                    rptThumbs.DataSource = thumbsList;
                    rptThumbs.DataBind();

                    imgProp.ImageUrl = "~/ImageStreamer.aspx?PropertyImageId=" + thumbsList[0].Id + "&size=430x395&featured=false";

                    foreach (PropertyImage item in thumbsList)
                    {
                        ltrPreload.Text += " preloadImage('/ImageStreamer.aspx?PropertyImageId=" + item.Id + "&size=190x190&featured=false');";
                    }
                }
                else
                {
                    prop_thumbs_container.Visible = false;
                    imgProp.ImageUrl = "~/assets/logo.png";
                }

               
                    BtnPrev.Attributes["style"] = "display:none";
                    BtnNext.Attributes["style"] = "display:none";
                    trAmenities.Visible = false;
                    //if (!string.IsNullOrEmpty(_prop.Features))
                    //{
                    //    trAmenities.Visible = true;
                    //    string[] _features = _prop.Features.Split(',');
                    //    featuresList.DataSource = _features;
                    //    featuresList.DataBind();
                    //}
                    //if (_prop.PropertyFeatures.Count>0)
                    //{
                    //    trAmenities.Visible = true;
                    //    //string[] _features = _prop.Features.Split(',');
                    //    featuresList.DataSource = _prop.PropertyFeatures;
                    //    featuresList.DataBind();
                    //}
                    //if (_prop.PropertyRooms.Count > 0)
                    //{
                    //    trRooms.Visible = true;
                    //    //string[] _features = _prop.Features.Split(',');
                    //    List<PropertyRoom> list = new List<PropertyRoom>();
                    //    List<PropertyRoom> list1 = new List<PropertyRoom>();
                    //    List<PropertyRoom> list2 = new List<PropertyRoom>(); 
                    //    List<PropertyRoom> list3 = new List<PropertyRoom>();
                    //    int i =1;
                    //    if (!_prop.PropertyFor.ToLower().Contains("sale") && _prop.SalePrice <= 0)
                    //    {

                    //        trRooms3.Visible = true;
                    //        foreach (var item in _prop.PropertyRooms)
                    //        {
                    //            if (i <= 3)
                    //            {
                    //                list.Add(item);
                    //            }
                    //            if (i <= 6 && i > 3)
                    //            {
                    //                list1.Add(item);
                    //            }
                    //            if (i <= 9 && i > 6)
                    //            {
                    //                list2.Add(item);
                    //            }
                    //            if (i > 9)
                    //            {
                    //                list3.Add(item);
                    //            }
                    //            i++;
                    //        }
                    //    }
                    //    else
                    //    {
                    //        foreach (var item in _prop.PropertyRooms)
                    //        {
                    //            if (i <= 4)
                    //            {
                    //                list.Add(item);
                    //            }
                    //            if (i <= 8 && i > 4)
                    //            {
                    //                list1.Add(item);
                    //            }
                    //            if (i > 8)
                    //            {
                    //                list2.Add(item);
                    //            }
                    //            i++;
                    //        }
                    //    }

                        //rptRooms.DataSource = list;
                        //rptRooms.DataBind();
                        //rptRooms1.DataSource = list1;
                        //rptRooms1.DataBind();
                        //rptRooms2.DataSource = list2;
                        //rptRooms2.DataBind();
                        //rptRooms3.DataSource = list3;
                        //rptRooms3.DataBind();
                    }
                ltrPropLocation.Text = _prop.PropertyType + " for " + _prop.PropertyFor + "<br><span style=\"font-weight:normal; color:black\">In" + (_prop.District.ToLower()=="achrafieh"?" Achrafieh ":" ") + _prop.Neighborhood + "</span>";
                    
                ltrPrice.Text = string.Format("{0:###,###,##0} USD", (_prop.PropertyFor).ToString().ToLower().Contains("rent") ? _prop.RentPrice : _prop.SalePrice) + (_prop.PropertyFor.ToString().ToLower().Contains("rent") ? " / year" : "");
                ltrprice1.Text = string.Format("{0:###,###,##0} USD", (_prop.PropertyFor).ToString().ToLower().Contains("sale") ? _prop.SalePrice:0);
                if ((_prop.PropertyFor).ToString().ToLower().Contains("sale") && (_prop.PropertyFor).ToString().ToLower().Contains("rent"))
                {
                    ltrprice1.Visible = true;
                }
                ltrSize.Text = _prop.Size.ToString() + "m²";
                ltrPrl.Text = _prop.PRL;
                ltrType.Text = _prop.PropertyType;
                //ltrBedrooms.Text = (_prop.TotalBedrooms +_prop.MasterBedRooms).ToString();
                //ltrBathrooms.Text = _prop.Bathrooms.ToString();
                //ltrParkings.Text = _prop.Parkings.ToString();
                ltrPropDescription.Text = _prop.Web_GuideDescription;
                ltrZone.Text = _prop.ZoningDescription;
                //ltrFamilyRoom.Text = _prop.FamilyRoom.ToString();
                if(_prop.Size >0 && _prop.SalePrice >0)
                {
                ltrPricePer.Text = (_prop.SalePrice/_prop.Size).ToString()+ " USD";
                }
                else
                {
                    ltrPricePer.Text = "0";
                }
                //ltrAddInfo.Text = _prop.AdditionalInformation;

                if (_prop.Size <= 0)
                { trSize.Visible = false; }
                if (_prop.TotalBedrooms + _prop.MasterBedRooms <= 0)
                //{ trBedroom.Visible = false; }
                //if (_prop.Bathrooms <= 0)
                //{ trBath.Visible = false; }
                //if (_prop.Parkings <= 0)
                //{ trParking.Visible = false; }
                //if (_prop.FamilyRoom <= 0)
                //{ trFamilyRoom.Visible = false; }
                    if (!string.IsNullOrEmpty(ltrPropDescription.Text))
                { trPropDescription.Visible = true; }
                if (string.IsNullOrEmpty(_prop.ZoningDescription))
                { trZoning.Visible = false; }
                if (!_prop.PropertyFor.ToLower().Contains("sale") && _prop.SalePrice <=0)
                { trPricePer.Visible = false; }


                //rptNearBy.DataSource = new List<string> { "", "","" };
                //rptNearBy.DataBind();
                string similarProjectsCriteria = " where PropertyType = '" + _prop.PropertyType + "' and Prl != '"+_prop.PRL+"'";
                if (!string.IsNullOrEmpty(_prop.Neighborhood))
                {
                    similarProjectsCriteria += " And Neighborhood = '" + _prop.Neighborhood + "'";
                }
                else if (!string.IsNullOrEmpty(_prop.District))
                {
                    similarProjectsCriteria += " And District = '" + _prop.District + "'";
                }
                else
                {
                    similarProjectsCriteria += " And Qadaa = '" + _prop.Qadaa + "'";
                }
                //List<RealEstateProperty> similarProjects = RealEstateProperty.AdvancedFind(similarProjectsCriteria);
                //if (similarProjects != null && similarProjects.Count > 0)
                //{
                //    rptSimilarProjects.DataSource = similarProjects.Take(3).ToList();
                //    rptSimilarProjects.DataBind();
                //}
                //else
                //{
                //    pnlSimilarProjects.Visible = false;
                //}
            }
        }
        //protected void rptSimilarProjects_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        //{
        //    dtProps.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        //    rptSimilarProjects.DataBind();
        //}
    //}
}