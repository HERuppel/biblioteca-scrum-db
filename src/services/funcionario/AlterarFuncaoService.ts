/* eslint-disable camelcase */
import { AlterarFuncaoRequest } from "src/models/AlterarFuncaoRequest";

import { FuncionarioFuncao } from "@prisma/client";

import { prismaClient } from "../../database";

class AlterarFuncaoService {
  public async execute({
    cod_f,
    cod_p,
    bonificacao,
    ano,
  }: AlterarFuncaoRequest): Promise<FuncionarioFuncao | string> {
    if (!cod_f) return "Dados faltando";

    const hasFuncao = await prismaClient.funcao.findFirst({
      where: {
        cod_f,
      },
    });

    if (!hasFuncao) return "A função não existe!";

    const funcionarioComFuncao =
      await prismaClient.funcionarioFuncao.findUnique({
        where: {
          cod_p,
        },
      });

    if (funcionarioComFuncao) {
      const funcionarioFuncao = await prismaClient.funcionarioFuncao.update({
        data: {
          cod_f,
          ano,
          bonificacao,
        },
        where: {
          cod_p,
        },
      });

      return funcionarioFuncao;
    }

    const funcionarioFuncao = await prismaClient.funcionarioFuncao.upsert({
      create: {
        cod_f,
        cod_p,
        ano,
        bonificacao,
      },
      update: {
        ano,
        bonificacao,
        cod_f,
        cod_p,
      },
      where: {
        cod_p_cod_f: {
          cod_f,
          cod_p,
        },
      },
    });

    return funcionarioFuncao;
  }
}

export { AlterarFuncaoService };
