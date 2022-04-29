import { Router } from "express";

import { routes as clienteRoutes } from "./cliente.routes";
import { routes as emprestimoRoutes } from "./emprestimo.routes";
import { routes as funcionarioRoutes } from "./funcionario.routes";
import { routes as livroRoutes } from "./livro.routes";

const routes = Router();

routes.use("/cliente", clienteRoutes);
routes.use("/funcionario", funcionarioRoutes);
routes.use("/livro", livroRoutes);
routes.use("/emprestimo", emprestimoRoutes);

export { routes };
