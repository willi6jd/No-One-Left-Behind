using NooneLeftBehind.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace NooneLeftBehind
{
    public partial class NOLBContext : DbContext
    {
        public NOLBContext()
            : base("name=NOLBConnection")
        {
        }

        public virtual DbSet<Request> Requests { get; set; }
        public virtual DbSet<Location> Locations { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}