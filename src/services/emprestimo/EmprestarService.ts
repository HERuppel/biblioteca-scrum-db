/* eslint-disable camelcase */
import { Emprestimo } from "@prisma/client";

import { prismaClient } from "../../database";
import { EmprestarRequest } from "../../models/EmprestarRequest";

class EmprestarService {
  public async execute({
    cod_l,
    cod_p,
    taxa_juros,
  }: EmprestarRequest): Promise<Emprestimo | string> {
    if (!cod_l || !cod_p || !taxa_juros) return "Dados faltando";

    const limitDate = new Date();
    limitDate.setDate(limitDate.getDate() + 15);

    const emprestimo = await prismaClient.emprestimo.create({
      data: {
        taxa_juros,
        cod_l,
        cod_p,
        data_limite: limitDate,
      },
    });

    return emprestimo;
  }
}

export { EmprestarService };
