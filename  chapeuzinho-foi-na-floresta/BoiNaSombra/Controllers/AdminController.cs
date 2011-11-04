using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BoiNaSombra.Controllers
{
    public class AdminController : Controller
    {
		[HttpGet]
        public ActionResult Index()
        {
            return View();
        }

		[HttpGet]
		public ActionResult ListaInvestidores()
		{
			return View();
		}

		[HttpGet]
		public ActionResult CadastrarInvestidor()
		{
			//implementar depois que o modelo estiver pronto
			return View();
		}

		[HttpGet]
		public ActionResult ListaParceiros()
		{
			return View();
		}
    }
}
