import { Router } from "express";
import { LivroController } from "src/controller/LivroController";

const routes = Router();

const livroController = new LivroController();

routes.post("/criar", livroController.criar);
routes.delete("/deletar", livroController.deletar);

export { routes };
