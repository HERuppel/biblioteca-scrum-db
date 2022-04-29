/* eslint-disable camelcase */
import { Funcionario } from "@prisma/client";

import { prismaClient } from "../../database";
import { CriarFuncionarioRequest } from "../../models/CriarFuncionarioRequest";

class CriarFuncionarioService {
  public async execute({
    nome,
    cpf,
    email_contato,
  }: CriarFuncionarioRequest): Promise<Funcionario | string> {
    if (!nome || !cpf || !email_contato) return "Dados faltando";

    const pessoa = await prismaClient.pessoa.create({
      data: {
        nome,
        cpf,
      },
    });

    const funcionario = await prismaClient.funcionario.create({
      data: {
        cod_p: pessoa.cod_p,
        email_contato,
      },
    });

    return funcionario;
  }
}

export { CriarFuncionarioService };
