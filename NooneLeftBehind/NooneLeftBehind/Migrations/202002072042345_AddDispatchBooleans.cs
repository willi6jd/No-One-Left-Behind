namespace NooneLeftBehind.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddDispatchBooleans : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "RequestedDispatchAccess", c => c.Boolean(nullable: false));
            AddColumn("dbo.AspNetUsers", "GrantedDispatchAccess", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "GrantedDispatchAccess");
            DropColumn("dbo.AspNetUsers", "RequestedDispatchAccess");
        }
    }
}
