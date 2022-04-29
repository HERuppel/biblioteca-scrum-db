/* eslint-disable camelcase */

import { DeletarFuncionarioRequest } from "src/models/DeletarFuncionarioRequest";

import { prismaClient } from "../../database";

class DeletarFuncionarioService {
  public async execute({
    cod_p,
  }: DeletarFuncionarioRequest): Promise<boolean | string> {
    if (!cod_p) return "Dados faltando";

    await prismaClient.funcionario.delete({
      where: {
        cod_p,
      },
    });

    await prismaClient.pessoa.delete({
      where: {
        cod_p,
      },
    });

    return true;
  }
}

export { DeletarFuncionarioService };
