-- CreateTable
CREATE TABLE "exemplar" (
    "cod_l" INTEGER NOT NULL,
    "num_unidade" INTEGER NOT NULL,

    CONSTRAINT "exemplar_pkey" PRIMARY KEY ("cod_l","num_unidade")
);

-- CreateTable
CREATE TABLE "possui" (
    "cod_est" INTEGER NOT NULL,
    "cod_l" INTEGER NOT NULL,
    "num_unidade" INTEGER NOT NULL,

    CONSTRAINT "possui_pkey" PRIMARY KEY ("cod_est","cod_l","num_unidade")
);

-- CreateIndex
CREATE UNIQUE INDEX "exemplar_cod_l_key" ON "exemplar"("cod_l");

-- CreateIndex
CREATE UNIQUE INDEX "possui_cod_est_key" ON "possui"("cod_est");

-- CreateIndex
CREATE UNIQUE INDEX "possui_cod_l_key" ON "possui"("cod_l");

-- CreateIndex
CREATE UNIQUE INDEX "possui_num_unidade_cod_l_key" ON "possui"("num_unidade", "cod_l");

-- AddForeignKey
ALTER TABLE "exemplar" ADD CONSTRAINT "exemplar_cod_l_fkey" FOREIGN KEY ("cod_l") REFERENCES "livro"("cod_l") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "possui" ADD CONSTRAINT "possui_cod_est_fkey" FOREIGN KEY ("cod_est") REFERENCES "estabelecimento"("cod_est") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "possui" ADD CONSTRAINT "possui_cod_l_fkey" FOREIGN KEY ("cod_l") REFERENCES "livro"("cod_l") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "possui" ADD CONSTRAINT "possui_num_unidade_cod_l_fkey" FOREIGN KEY ("num_unidade", "cod_l") REFERENCES "exemplar"("num_unidade", "cod_l") ON DELETE RESTRICT ON UPDATE CASCADE;
