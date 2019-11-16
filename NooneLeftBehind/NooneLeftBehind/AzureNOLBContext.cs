namespace NooneLeftBehind
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using NooneLeftBehind.Models;

    public partial class AzureNOLBContext : DbContext
    {
        public AzureNOLBContext()
            : base("name=AzureNOLBContext")
        {
        }

        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Request> Requests { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Location>()
                .Property(e => e.StreetAddress)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.RoomNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.Floor)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .Property(e => e.State)
                .IsUnicode(false);

            modelBuilder.Entity<Location>()
                .HasMany(e => e.Requests)
                .WithRequired(e => e.Location)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.TypeOfEmergency)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.InjuriesOrOtherInfo)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Request>()
                .Property(e => e.Longitude)
                .HasPrecision(30, 20);

            modelBuilder.Entity<Request>()
                .Property(e => e.Latitude)
                .HasPrecision(30, 20);
        }
    }
}
