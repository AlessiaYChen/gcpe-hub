//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Gcpe.Hub.Data.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public User()
        {
            this.NewsReleaseLogs = new HashSet<NewsReleaseLog>();
        }
    
        public System.Guid Id { get; set; }
        public string DisplayName { get; set; }
        public string EmailAddress { get; set; }
        public bool IsActive { get; set; }
    
        public virtual ICollection<NewsReleaseLog> NewsReleaseLogs { get; set; }
    }
}
