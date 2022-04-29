-- CreateTable
CREATE TABLE "editora" (
    "cod_ed" SERIAL NOT NULL,
    "nome" VARCHAR(64) NOT NULL,

    CONSTRAINT "editora_pkey" PRIMARY KEY ("cod_ed")
);

-- CreateTable
CREATE TABLE "area_livro" (
    "cod_a" SERIAL NOT NULL,
    "nome" VARCHAR(64) NOT NULL,
    "descricao" VARCHAR(255) NOT NULL,

    CONSTRAINT "area_livro_pkey" PRIMARY KEY ("cod_a")
);

-- CreateTable
CREATE TABLE "livro" (
    "cod_l" SERIAL NOT NULL,
    "nome" VARCHAR(64) NOT NULL,
    "num_paginas" INTEGER NOT NULL,
    "cod_a" INTEGER NOT NULL,
    "cod_ed" INTEGER NOT NULL,

    CONSTRAINT "livro_pkey" PRIMARY KEY ("cod_l")
);

-- CreateIndex
CREATE UNIQUE INDEX "livro_cod_ed_key" ON "livro"("cod_ed");

-- CreateIndex
CREATE UNIQUE INDEX "livro_cod_a_key" ON "livro"("cod_a");

-- AddForeignKey
ALTER TABLE "livro" ADD CONSTRAINT "livro_cod_ed_fkey" FOREIGN KEY ("cod_ed") REFERENCES "editora"("cod_ed") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "livro" ADD CONSTRAINT "livro_cod_a_fkey" FOREIGN KEY ("cod_a") REFERENCES "area_livro"("cod_a") ON DELETE RESTRICT ON UPDATE CASCADE;
