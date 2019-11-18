namespace NooneLeftBehind.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Request
    {
        public int RequestID { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime TimeStamp { get; set; }

        [Required]
        [StringLength(50)]
        public string TypeOfEmergency { get; set; }

        public int? NumberOfPeople { get; set; }

        public int? NumberOfImmobilePeople { get; set; }

        [StringLength(2048)]
        public string InjuriesOrOtherInfo { get; set; }

        public bool AccessibleOutsideWindow { get; set; }

        public int LocationID { get; set; }

        [StringLength(255)]
        public string FirstName { get; set; }

        [StringLength(255)]
        public string LastName { get; set; }

        [StringLength(50)]
        public string PhoneNumber { get; set; }

        public decimal? Longitude { get; set; }

        public decimal? Latitude { get; set; }

        public bool Cleared { get; set; }

        public virtual Location Location { get; set; }
    }
}
