//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MediaRelationsDatabase
{
    using System;
    using System.Collections.Generic;
    
    public partial class MediaRequest
    {
        public MediaRequest()
        {
            this.FollowupMediaRequests = new HashSet<MediaRequest>();
            this.MediaRequestContacts = new HashSet<MediaRequestContact>();
            this.Ministries = new HashSet<Ministry>();
        }
    
        public System.Guid Id { get; set; }
        public System.DateTimeOffset CreatedAt { get; set; }
        public int CreatedById { get; set; }
        public System.DateTimeOffset ModifiedAt { get; set; }
        public int ModifiedById { get; set; }
        public System.Guid LeadMinistryId { get; set; }
        public int ResponsibleUserId { get; set; }
        public Nullable<System.DateTimeOffset> DeadlineAt { get; set; }
        public string RequestTopic { get; set; }
        public string RequestContent { get; set; }
        public string Response { get; set; }
        public bool IsActive { get; set; }
        public System.DateTimeOffset RequestedAt { get; set; }
        public Nullable<System.DateTimeOffset> AcknowledgedAt { get; set; }
        public Nullable<System.DateTimeOffset> RespondedAt { get; set; }
        public Nullable<System.Guid> RequestParentId { get; set; }
        public Nullable<int> EodReportWith { get; set; }
        public Nullable<System.Guid> ResolutionId { get; set; }
        public Nullable<System.Guid> TakeOverRequestMinistryId { get; set; }
    
        public virtual Ministry Ministry { get; set; }
        public virtual ICollection<MediaRequest> FollowupMediaRequests { get; set; }
        public virtual MediaRequest ParentMediaRequest { get; set; }
        public virtual ICollection<MediaRequestContact> MediaRequestContacts { get; set; }
        public virtual ICollection<Ministry> Ministries { get; set; }
    }
}
