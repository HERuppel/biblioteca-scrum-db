import { Router } from "express";
import { ClienteController } from "src/controller/ClienteController";

const routes = Router();

const clienteController = new ClienteController();

routes.post("/criar", clienteController.criar);
routes.delete("/deletar", clienteController.deletar);

export { routes };
