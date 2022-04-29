import { Request, Response } from "express";
import { AlterarFuncaoService } from "src/services/funcionario/AlterarFuncaoService";
import { CriarFuncionarioService } from "src/services/funcionario/CriarFuncionarioService";
import { DeletarFuncionarioService } from "src/services/funcionario/DeletarFuncionarioService";

class FuncionarioController {
  public async criar(req: Request, res: Response): Promise<Response> {
    try {
      const criarFuncionarioService = new CriarFuncionarioService();

      const funcionario = await criarFuncionarioService.execute(req.body);

      return res.status(200).json({
        success: true,
        message: "Operação finalizada com sucesso.",
        content: funcionario,
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
      const deletarFuncionarioService = new DeletarFuncionarioService();

      const funcionarioDeletado = await deletarFuncionarioService.execute(
        req.body
      );

      return res.status(200).json({
        success: true,
        message: "Operação finalizada com sucesso.",
        content: funcionarioDeletado,
      });
    } catch (e) {
      return res.status(400).json({
        success: false,
        message: "Ocorreu um erro na criação",
      });
    }
  }

  public async alterarFuncao(req: Request, res: Response): Promise<Response> {
    try {
      const alterarFuncaoService = new AlterarFuncaoService();

      const funcaoAlterada = await alterarFuncaoService.execute(req.body);

      return res.status(200).json({
        success: true,
        message: "Operação finalizada com sucesso.",
        content: funcaoAlterada,
      });
    } catch (e) {
      console.log(e);
      return res.status(400).json({
        success: false,
        message: "Ocorreu um erro na alteração",
      });
    }
  }
}

export { FuncionarioController };
