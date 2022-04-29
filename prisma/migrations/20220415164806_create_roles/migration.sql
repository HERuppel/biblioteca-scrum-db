-- CreateTable
CREATE TABLE "funcao" (
    "cod_f" SERIAL NOT NULL,
    "carga_horaria" INTEGER NOT NULL,
    "salario_base" DOUBLE PRECISION NOT NULL,
    "descricao" VARCHAR(255) NOT NULL,

    CONSTRAINT "funcao_pkey" PRIMARY KEY ("cod_f")
);

-- CreateTable
CREATE TABLE "funcionario_funcao" (
    "cod_p" INTEGER NOT NULL,
    "cod_f" INTEGER NOT NULL,
    "ano" CHAR(4) NOT NULL,
    "bonificacao" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "funcionario_funcao_pkey" PRIMARY KEY ("cod_p","cod_f")
);

-- CreateIndex
CREATE UNIQUE INDEX "funcionario_funcao_cod_p_key" ON "funcionario_funcao"("cod_p");

-- CreateIndex
CREATE UNIQUE INDEX "funcionario_funcao_cod_f_key" ON "funcionario_funcao"("cod_f");

-- AddForeignKey
ALTER TABLE "funcionario_funcao" ADD CONSTRAINT "funcionario_funcao_cod_p_fkey" FOREIGN KEY ("cod_p") REFERENCES "pessoa"("cod_p") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "funcionario_funcao" ADD CONSTRAINT "funcionario_funcao_cod_f_fkey" FOREIGN KEY ("cod_f") REFERENCES "funcao"("cod_f") ON DELETE RESTRICT ON UPDATE CASCADE;
