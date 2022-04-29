import { Request, Response } from "express";
import { CriarClienteService } from "src/services/cliente/CriarClienteService";
import { DeletarClienteService } from "src/services/cliente/DeletarClienteService";

class ClienteController {
  public async criar(req: Request, res: Response): Promise<Response> {
    try {
      const criarClienteService = new CriarClienteService();

      const cliente = await criarClienteService.execute(req.body);

      return res.status(200).json({
        success: true,
        message: "Operação finalizada com sucesso.",
        content: cliente,
      });
    } catch (e) {
      console.log("E", e);
      return res.status(400).json({
        success: false,
        message: "Ocorreu um erro na criação",
      });
    }
  }

  public async deletar(req: Request, res: Response): Promise<Response> {
    try {
      const deletarClienteService = new DeletarClienteService();

      const clienteDeletado = await deletarClienteService.execute(req.body);

      return res.status(200).json({
        success: true,
        message: "Operação finalizada com sucesso.",
        content: clienteDeletado,
      });
    } catch (e) {
      return res.status(400).json({
        success: false,
        message: "Ocorreu um erro na deleção",
      });
    }
  }
}

export { ClienteController };
