-- CreateTable
CREATE TABLE "cadastro" (
    "cod_p" INTEGER NOT NULL,
    "cod_est" INTEGER NOT NULL,
    "data" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "cadastro_pkey" PRIMARY KEY ("cod_p","cod_est")
);

-- CreateIndex
CREATE UNIQUE INDEX "cadastro_cod_p_key" ON "cadastro"("cod_p");

-- CreateIndex
CREATE UNIQUE INDEX "cadastro_cod_est_key" ON "cadastro"("cod_est");

-- AddForeignKey
ALTER TABLE "cadastro" ADD CONSTRAINT "cadastro_cod_p_fkey" FOREIGN KEY ("cod_p") REFERENCES "pessoa"("cod_p") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cadastro" ADD CONSTRAINT "cadastro_cod_est_fkey" FOREIGN KEY ("cod_est") REFERENCES "estabelecimento"("cod_est") ON DELETE RESTRICT ON UPDATE CASCADE;
