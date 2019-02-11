using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;


namespace CrimsonCoward
{
    public partial class ImageStreamer : System.Web.UI.Page
    {
        public System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxWidth, int maxHeight)
        {
            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;
            var ratio = Math.Min(ratioX, ratioY);
            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);
            var newImage = new Bitmap(newWidth, newHeight);
            Graphics.FromImage(newImage).DrawImage(image, 0, 0, newWidth, newHeight);
            return newImage;
        }
        public byte[] ImageToByteArray(System.Drawing.Image m_imageIn)
        {

            MemoryStream oMemoryStream = new MemoryStream();
            // ImageFormat could be other formats like bmp,gif,icon,png etc.
            m_imageIn.Save(oMemoryStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            return oMemoryStream.ToArray();
        }


        public System.Drawing.Image ByteArrayToImage(byte[] m_byteArrayIn)
        {

            MemoryStream oMemoryStream = new MemoryStream(m_byteArrayIn);
            System.Drawing.Image oImage = System.Drawing.Image.FromStream(oMemoryStream);
            return oImage;
        }

        private void Page_Load(object sender, System.EventArgs e)
        {
            byte[] b = new byte[] { };

            if (Request.Params["imgID"] != null)
            {
                if (Request.Params["width"] != null && Request.Params["height"] != null)
                {
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    var _id = Guid.Parse(Request.Params["imgID"].ToString());
                    PropertyImage _img = db.PropertyImages.Where(x=>x.Id == _id).FirstOrDefault();
                    if (_img != null && _img.Image.Length > 0)
                        Response.BinaryWrite(ImageToByteArray(ScaleImage(ByteArrayToImage(_img.Image), int.Parse(Request.Params["width"]), int.Parse(Request.Params["height"]))));
                    else
                        Response.BinaryWrite(File.ReadAllBytes(MapPath("~/assets/logo.png")));
                }
                else
                {
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    var _id = Guid.Parse(Request.Params["imgID"].ToString());
                    PropertyImage _img = db.PropertyImages.Where(x => x.Id == _id).FirstOrDefault();
                    if (_img != null && _img.Image.Length > 0)
                        Response.BinaryWrite(_img.Image);
                    else
                        Response.BinaryWrite(File.ReadAllBytes(MapPath("~/assets/logo.png")));
                }

            }
            if (Request.Params["PrlImg"] != null)
            {
                if (Request.Params["width"] != null && Request.Params["height"] != null)
                {
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    var _id = Guid.Parse(Request.Params["PrlImg"].ToString());
                    PropertyImage _img = db.PropertyImages.Where(x => x.Id == _id).FirstOrDefault();
                 
                    if (_img != null && _img.Image.Length > 0)
                        Response.BinaryWrite(ImageToByteArray(ScaleImage(ByteArrayToImage(_img.Image), int.Parse(Request.Params["width"]), int.Parse(Request.Params["height"]))));
                    else
                        Response.BinaryWrite(File.ReadAllBytes(MapPath("~/assets/logo.png")));
                }
                else
                {
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    var _id = Guid.Parse(Request.Params["PrlImg"].ToString());
                    PropertyImage _img = db.PropertyImages.Where(x => x.Id == _id).FirstOrDefault();
                    if (_img != null && _img.Image.Length > 0)
                        Response.BinaryWrite(_img.Image);
                    else
                        Response.BinaryWrite(File.ReadAllBytes(MapPath("~/assets/logo.png")));
                }

            }
            else if (Request.Params["PropertyImageId"] != null)
            {
                CrimsonCowardEntities db = new CrimsonCowardEntities();
                var _id = Guid.Parse(Request.Params["PropertyImageId"].ToString());
                PropertyImage _img = db.PropertyImages.Where(x => x.Id == _id).FirstOrDefault();
               
                if (_img != null && _img.Image.Length > 0)
                    Response.BinaryWrite(_img.Image);
                else
                    Response.BinaryWrite(File.ReadAllBytes(MapPath("~/assets/logo.png")));


            }

            else if (Request.Params["PrlBanner"] != null)
            {
                if (Request.Params["width"] != null && Request.Params["height"] != null)
                {
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    var _id = Guid.Parse(Request.Params["PrlBanner"].ToString());
                    PropertyImage _img = db.PropertyImages.Where(x => x.Id == _id).FirstOrDefault();
                   
                    if (_img != null && _img.Image.Length > 0)
                        Response.BinaryWrite(ImageToByteArray(ScaleImage(ByteArrayToImage(_img.Image), int.Parse(Request.Params["width"]), int.Parse(Request.Params["height"]))));
                    else
                        Response.BinaryWrite(File.ReadAllBytes(MapPath("~/assets/logo.png")));
                }
                else
                {
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    var _id = Guid.Parse(Request.Params["PrlBanner"].ToString());
                    PropertyImage _img = db.PropertyImages.Where(x => x.Id == _id).FirstOrDefault();

                    if (_img != null && _img.Image.Length > 0)
                        Response.BinaryWrite(_img.Image);
                    else
                        Response.BinaryWrite(File.ReadAllBytes(MapPath("~/assets/logo.png")));
                }

            }



            else
            {

                Response.BinaryWrite(File.ReadAllBytes(MapPath("~/assets/logo.png")));
            }
        }

        /// <summary>
        /// Required, but not used
        /// </summary>
        /// <returns>true</returns>
        /// 
        public static System.Drawing.Bitmap ResizeImage(System.Drawing.Image image, int width, int height)
        {
            //a holder for the result
            Bitmap result = new Bitmap(width, height);
            //set the resolutions the same to avoid cropping due to resolution differences
            result.SetResolution(image.HorizontalResolution, image.VerticalResolution);

            //use a graphics object to draw the resized image into the bitmap
            using (Graphics graphics = Graphics.FromImage(result))
            {
                //set the resize quality modes to high quality
                graphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                graphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                //draw the image into the target bitmap
                graphics.DrawImage(image, 0, 0, result.Width, result.Height);
            }

            //return the resulting bitmap
            return result;
        }
        public bool ThumbnailCallback()
        {
            return true;
        }
    }
}