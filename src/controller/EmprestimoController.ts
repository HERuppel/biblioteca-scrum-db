import { Request, Response } from "express";
import { DevolverService } from "src/services/emprestimo/DevolverService";
import { EmprestarService } from "src/services/emprestimo/EmprestarService";

class EmprestimoController {
  public async emprestar(req: Request, res: Response): Promise<Response> {
    try {
      const emprestarService = new EmprestarService();

      const emprestimo = await emprestarService.execute(req.body);

      return res.status(200).json({
        success: true,
        message: "Operação finalizada com sucesso.",
        content: emprestimo,
      });
    } catch (e) {
      return res.status(400).json({
        success: false,
        message: "Ocorreu um erro na criação",
      });
    }
  }

  public async devolver(req: Request, res: Response): Promise<Response> {
    try {
      const devolverService = new DevolverService();

      const devolucao = await devolverService.execute(req.body);

      return res.status(200).json({
        success: true,
        message: "Operação finalizada com sucesso.",
        content: devolucao,
      });
    } catch (e) {
      return res.status(400).json({
        success: false,
        message: "Ocorreu um erro na criação",
      });
    }
  }
}

export { EmprestimoController };
