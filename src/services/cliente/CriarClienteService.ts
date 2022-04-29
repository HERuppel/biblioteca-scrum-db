/* eslint-disable camelcase */
import { Cliente } from "@prisma/client";

import { prismaClient } from "../../database";
import { CriarClienteRequest } from "../../models/CriarClienteRequest";

const criarTelefone = async (numero: string, cod_p: number) => {
  await prismaClient.telefone.create({
    data: {
      numero,
      cod_p,
    },
  });
};

class CriarClienteService {
  public async execute({
    nome,
    cpf,
    telefone_contato,
  }: CriarClienteRequest): Promise<Cliente | string> {
    if (!nome || !cpf) return "Dados faltando";

    const pessoa = await prismaClient.pessoa.create({
      data: {
        nome,
        cpf,
      },
    });

    const requests: any[] = [];

    telefone_contato.forEach((item) => {
      requests.push(criarTelefone(item, pessoa.cod_p));
    });

    await Promise.all(requests).then((response) => response);

    const cliente = await prismaClient.cliente.create({
      data: {
        cod_p: pessoa.cod_p,
      },
    });

    return cliente;
  }
}

export { CriarClienteService };
