﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gcpe.Hub.Data.Entity
{
    [Table("ActivitySharedWith", Schema = "calendar")]
    public partial class ActivitySharedWith
    {
        public int Id { get; set; }
        public int ActivityId { get; set; }
        public Guid MinistryId { get; set; }
        public bool IsActive { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? CreatedDateTime { get; set; }
        public int? CreatedBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? LastUpdatedDateTime { get; set; }
        public int? LastUpdatedBy { get; set; }
        [Required]
        public byte[] TimeStamp { get; set; }
        public Guid RowGuid { get; set; }

        [ForeignKey("ActivityId")]
        [InverseProperty("ActivitySharedWith")]
        public Activity Activity { get; set; }
        [ForeignKey("CreatedBy")]
        [InverseProperty("ActivitySharedWithCreatedByNavigation")]
        public SystemUser CreatedByNavigation { get; set; }
        [ForeignKey("LastUpdatedBy")]
        [InverseProperty("ActivitySharedWithLastUpdatedByNavigation")]
        public SystemUser LastUpdatedByNavigation { get; set; }
        [ForeignKey("MinistryId")]
        [InverseProperty("ActivitySharedWith")]
        public Ministry Ministry { get; set; }
    }
}
