using System;
using Microsoft.AspNetCore.Mvc;
using Organica.Entidade;
using Organica.Negocio;

namespace Organica.API.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class ImagemController : ControllerBase
	{
		public ImagemController()
		{
		}

		[HttpGet("{codigoProduto}")]
		public IList<ImagemInfo> Listar(int codigoProduto)
        {
			return new ImagemNegocio().Listar(codigoProduto);
        }
	}
}

