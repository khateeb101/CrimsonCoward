//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CrimsonCoward.DAL
{
    using System;
    
    public partial class Blog_GetByID_Result
    {
        public System.Guid Id { get; set; }
        public byte[] image { get; set; }
        public string link { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string Subtitle { get; set; }
        public Nullable<System.Guid> BlogCatId { get; set; }
    }
}
