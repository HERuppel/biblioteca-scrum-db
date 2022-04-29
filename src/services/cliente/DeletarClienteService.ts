/* eslint-disable camelcase */

import { DeletarClienteRequest } from "src/models/DeletarClienteRequest";

import { prismaClient } from "../../database";

class DeletarClienteService {
  public async execute({
    cod_p,
  }: DeletarClienteRequest): Promise<boolean | string> {
    if (!cod_p) return "Dados faltando";

    await prismaClient.cliente.delete({
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

export { DeletarClienteService };
