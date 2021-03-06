//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CorporateCalendar.Data.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class Sector
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Sector()
        {
            this.ActivitySectors = new HashSet<ActivitySector>();
        }
    
        public System.Guid Id { get; set; }
        public string DisplayName { get; set; }
        public bool IsActive { get; set; }
        public int SortOrder { get; set; }
        public System.DateTime Timestamp { get; set; }
        public string Key { get; set; }
        public string MiscHtml { get; set; }
        public string MiscRightHtml { get; set; }
        public string TwitterUsername { get; set; }
        public string FlickrUrl { get; set; }
        public string YoutubeUrl { get; set; }
        public string AudioUrl { get; set; }
        public string FacebookEmbedHtml { get; set; }
        public string YoutubeEmbedHtml { get; set; }
        public string AudioEmbedHtml { get; set; }
        public Nullable<System.Guid> TopReleaseId { get; set; }
        public Nullable<System.Guid> FeatureReleaseId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ActivitySector> ActivitySectors { get; set; }
    }
}
