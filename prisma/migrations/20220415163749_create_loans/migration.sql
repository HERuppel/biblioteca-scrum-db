-- CreateTable
CREATE TABLE "emprestimo" (
    "cod_emp" SERIAL NOT NULL,
    "data" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "taxa_juros" DOUBLE PRECISION NOT NULL,
    "data_devolucao" TIMESTAMP(3),
    "data_limite" TIMESTAMP(3) NOT NULL,
    "cod_p" INTEGER NOT NULL,
    "cod_est" INTEGER NOT NULL,

    CONSTRAINT "emprestimo_pkey" PRIMARY KEY ("cod_emp")
);

-- CreateIndex
CREATE UNIQUE INDEX "emprestimo_cod_p_key" ON "emprestimo"("cod_p");

-- CreateIndex
CREATE UNIQUE INDEX "emprestimo_cod_est_key" ON "emprestimo"("cod_est");

-- AddForeignKey
ALTER TABLE "emprestimo" ADD CONSTRAINT "emprestimo_cod_p_fkey" FOREIGN KEY ("cod_p") REFERENCES "pessoa"("cod_p") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "emprestimo" ADD CONSTRAINT "emprestimo_cod_est_fkey" FOREIGN KEY ("cod_est") REFERENCES "estabelecimento"("cod_est") ON DELETE RESTRICT ON UPDATE CASCADE;
