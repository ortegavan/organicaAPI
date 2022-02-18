using System;
using Microsoft.AspNetCore.Mvc;
using Organica.Entidade;
using Organica.Negocio;

namespace Organica.API.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class CategoriaController : ControllerBase
	{
		public CategoriaController()
		{
		}

		[HttpGet]
		public IList<CategoriaInfo> Listar()
        {
			return new CategoriaNegocio().Listar();
        }
	}
}

