-- CreateTable
CREATE TABLE "uf" (
    "uf" CHAR(2) NOT NULL,
    "nome" VARCHAR(64) NOT NULL,

    CONSTRAINT "uf_pkey" PRIMARY KEY ("uf")
);

-- CreateTable
CREATE TABLE "cidade" (
    "cod_c" SERIAL NOT NULL,
    "nome" VARCHAR(64) NOT NULL,
    "uf" CHAR(2) NOT NULL,

    CONSTRAINT "cidade_pkey" PRIMARY KEY ("cod_c")
);

-- CreateTable
CREATE TABLE "bairro" (
    "cod_b" SERIAL NOT NULL,
    "nome" VARCHAR(64) NOT NULL,
    "cod_c" INTEGER NOT NULL,

    CONSTRAINT "bairro_pkey" PRIMARY KEY ("cod_b")
);

-- CreateIndex
CREATE UNIQUE INDEX "cidade_uf_key" ON "cidade"("uf");

-- CreateIndex
CREATE UNIQUE INDEX "bairro_cod_c_key" ON "bairro"("cod_c");

-- AddForeignKey
ALTER TABLE "cidade" ADD CONSTRAINT "cidade_uf_fkey" FOREIGN KEY ("uf") REFERENCES "uf"("uf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bairro" ADD CONSTRAINT "bairro_cod_c_fkey" FOREIGN KEY ("cod_c") REFERENCES "cidade"("cod_c") ON DELETE RESTRICT ON UPDATE CASCADE;
