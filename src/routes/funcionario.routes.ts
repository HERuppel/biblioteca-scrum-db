import { Router } from "express";
import { FuncionarioController } from "src/controller/FuncionarioController";

const routes = Router();

const funcionarioController = new FuncionarioController();

routes.post("/criar", funcionarioController.criar);
routes.delete("/deletar", funcionarioController.deletar);
routes.post("/alterar_funcao", funcionarioController.alterarFuncao);

export { routes };
