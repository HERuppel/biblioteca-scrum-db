import { Router } from "express";
import { EmprestimoController } from "src/controller/EmprestimoController";

const routes = Router();

const emprestimoController = new EmprestimoController();

routes.post("/emprestar", emprestimoController.emprestar);
routes.post("/devolver", emprestimoController.devolver);

export { routes };
