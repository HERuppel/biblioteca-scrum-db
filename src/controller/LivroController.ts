import { Request, Response } from "express";
import { CriarLivroService } from "src/services/livro/CriarLivroService";
import { DeletarLivroService } from "src/services/livro/DeletarLivroService";

class LivroController {
  public async criar(req: Request, res: Response): Promise<Response> {
    try {
      const criarLivroService = new CriarLivroService();

      const livro = await criarLivroService.execute(req.body);

      return res.status(200).json({
        success: true,
        message: "Operação finalizada com sucesso.",
        content: livro,
      });
    } catch (e) {
      return res.status(400).json({
        success: false,
        message: "Ocorreu um erro na criação",
      });
    }
  }

  public async deletar(req: Request, res: Response): Promise<Response> {
    try {
      const deletarLivroService = new DeletarLivroService();

      const livro = await deletarLivroService.execute(req.body);

      return res.status(200).json({
        success: true,
        message: "Operação finalizada com sucesso.",
        content: livro,
      });
    } catch (e) {
      return res.status(400).json({
        success: false,
        message: "Ocorreu um erro na criação",
      });
    }
  }
}

export { LivroController };
