-- CreateTable
CREATE TABLE "estabelecimento" (
    "cod_est" SERIAL NOT NULL,
    "cnpj" CHAR(18) NOT NULL,
    "cod_b" INTEGER NOT NULL,

    CONSTRAINT "estabelecimento_pkey" PRIMARY KEY ("cod_est")
);

-- CreateIndex
CREATE UNIQUE INDEX "estabelecimento_cod_b_key" ON "estabelecimento"("cod_b");

-- AddForeignKey
ALTER TABLE "estabelecimento" ADD CONSTRAINT "estabelecimento_cod_b_fkey" FOREIGN KEY ("cod_b") REFERENCES "bairro"("cod_b") ON DELETE RESTRICT ON UPDATE CASCADE;
