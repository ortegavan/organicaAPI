using System;
using Microsoft.AspNetCore.Mvc;
using Organica.Entidade;
using Organica.Negocio;

namespace Organica.API.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class ProdutoController : ControllerBase
	{
		public ProdutoController()
		{
		}

		[HttpGet("tanaepoca")]
		public IList<ProdutoInfo> ListarPorEpoca()
        {
			return new ProdutoNegocio().ListarPorEpoca();
        }
	}
}

