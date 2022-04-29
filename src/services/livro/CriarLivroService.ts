/* eslint-disable camelcase */
import { Livro } from "@prisma/client";

import { prismaClient } from "../../database";
import { CriarLivroRequest } from "../../models/CriarLivroRequest";

class CriarLivroService {
  public async execute({
    nome,
    num_paginas,
  }: CriarLivroRequest): Promise<Livro | string> {
    if (!nome || !num_paginas) return "Dados faltando";

    const livro = await prismaClient.livro.create({
      data: {
        nome,
        num_paginas,
      },
    });

    return livro;
  }
}

export { CriarLivroService };
