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
    
    public partial class ContactWebAddress
    {
        public System.Guid Id { get; set; }
        public System.Guid ContactId { get; set; }
        public string WebAddress { get; set; }
        public System.Guid WebAddressTypeId { get; set; }
        public System.DateTime CreationDate { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        public virtual Contact Contact { get; set; }
        public virtual WebAddressType WebAddressType { get; set; }
    }
}
