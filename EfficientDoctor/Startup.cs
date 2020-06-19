using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EfficientDoctor.Startup))]
namespace EfficientDoctor
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
