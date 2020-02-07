using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LogonTest.Startup))]
namespace LogonTest
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
