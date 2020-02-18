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

        public DateTimeOffset TimeStamp { get; set; }

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

        [NotMapped] public string Description => GetDescription();

        public string GetDescription()
        {
            var description = string.Empty;
            description += TimeStamp.LocalDateTime.ToShortDateString() + "  " + TimeStamp.LocalDateTime.ToShortTimeString();
            var parameters = new List<string>();

            if (!string.IsNullOrWhiteSpace(Location.StreetAddress))
                parameters.Add($"{Location.StreetAddress}<br>");
            if (!string.IsNullOrWhiteSpace(Location.Floor))
                parameters.Add($"Floor {Location.Floor}{(string.IsNullOrWhiteSpace(Location.RoomNumber) ? "<br>" : ",")}");
            if (!string.IsNullOrWhiteSpace(Location.RoomNumber))
                parameters.Add($"Room {Location.RoomNumber}<br>");
            if (!string.IsNullOrWhiteSpace(Location.City))
                parameters.Add($"{Location.City},");
            if (!string.IsNullOrWhiteSpace(Location.State))
                parameters.Add($"{Location.State}");
            var address = string.Join(" ", parameters);

            description += $"<br><br><b>Location</b>:<br>{address}";
            description += $"<br><br><b>Emergency</b>: {TypeOfEmergency}";
            description += $"<br><b>People</b>: {NumberOfPeople}";
            description += $"<br><b>Immobile People</b>: {NumberOfImmobilePeople}";
            description += $"<br><br><b>Injuries/Info</b>: {InjuriesOrOtherInfo}";
            description += $"<br><b>Name</b>: {FirstName} {LastName}";
            description += $"<br><b>Phone</b>: <a href=tel:{PhoneNumber}>{PhoneNumber}</a>";

            return description;
        }
    }
}
