using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WF_ext.Startup))]
namespace WF_ext
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
