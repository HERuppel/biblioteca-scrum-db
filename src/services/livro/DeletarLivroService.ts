/* eslint-disable camelcase */
import { Livro } from "@prisma/client";

import { prismaClient } from "../../database";
import { DeletarLivroRequest } from "../../models/DeletarLivroRequest";

class DeletarLivroService {
  public async execute({
    cod_l,
  }: DeletarLivroRequest): Promise<Livro | string> {
    if (!cod_l) return "Dados faltando";

    const livro = await prismaClient.livro.delete({
      where: {
        cod_l,
      },
    });

    return livro;
  }
}

export { DeletarLivroService };
