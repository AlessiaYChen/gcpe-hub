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
    
    public partial class CompanyAddress
    {
        public System.Guid Id { get; set; }
        public System.Guid CompanyId { get; set; }
        public string StreetAddress { get; set; }
        public Nullable<System.Guid> CityId { get; set; }
        public string CityName { get; set; }
        public Nullable<System.Guid> ProvStateId { get; set; }
        public string ProvStateName { get; set; }
        public string PostalZipCode { get; set; }
        public System.Guid CountryId { get; set; }
        public int AddressType { get; set; }
        public System.DateTime CreationDate { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        public virtual Company Company { get; set; }
        public virtual Country Country { get; set; }
        public virtual ProvState ProvState { get; set; }
        public virtual City City { get; set; }
    }
}
