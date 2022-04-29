/* eslint-disable camelcase */
import { Emprestimo } from "@prisma/client";

import { prismaClient } from "../../database";
import { DevolverRequest } from "../../models/DevolverRequest";

class DevolverService {
  public async execute({
    cod_emp,
  }: DevolverRequest): Promise<Emprestimo | string> {
    if (!cod_emp) return "Dados faltando";

    const hasEmprestimo = await prismaClient.emprestimo.findFirst({
      where: {
        cod_emp,
      },
    });

    if (!hasEmprestimo) return "Empréstimo não encontrado!";

    const limitDate = new Date();
    limitDate.setDate(limitDate.getDate() + 15);

    const emprestimo = await prismaClient.emprestimo.update({
      data: {
        data_devolucao: new Date(),
      },
      where: {
        cod_emp,
      },
    });

    return emprestimo;
  }
}

export { DevolverService };
