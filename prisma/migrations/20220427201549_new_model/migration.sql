/*
  Warnings:

  - You are about to drop the column `telefone_contato` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the `bairro` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cadastro` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cidade` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `estabelecimento` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `uf` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `cod_t` to the `cliente` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "bairro" DROP CONSTRAINT "bairro_cod_c_fkey";

-- DropForeignKey
ALTER TABLE "cadastro" DROP CONSTRAINT "cadastro_cod_est_fkey";

-- DropForeignKey
ALTER TABLE "cadastro" DROP CONSTRAINT "cadastro_cod_p_fkey";

-- DropForeignKey
ALTER TABLE "cidade" DROP CONSTRAINT "cidade_uf_fkey";

-- DropForeignKey
ALTER TABLE "estabelecimento" DROP CONSTRAINT "estabelecimento_cod_b_fkey";

-- AlterTable
ALTER TABLE "cliente" DROP COLUMN "telefone_contato",
ADD COLUMN     "cod_t" INTEGER NOT NULL;

-- DropTable
DROP TABLE "bairro";

-- DropTable
DROP TABLE "cadastro";

-- DropTable
DROP TABLE "cidade";

-- DropTable
DROP TABLE "estabelecimento";

-- DropTable
DROP TABLE "uf";

-- CreateTable
CREATE TABLE "telefone" (
    "cod_t" SERIAL NOT NULL,
    "cod_p" INTEGER NOT NULL,
    "numero" VARCHAR(11) NOT NULL,

    CONSTRAINT "telefone_pkey" PRIMARY KEY ("cod_t")
);

-- CreateIndex
CREATE UNIQUE INDEX "telefone_cod_p_key" ON "telefone"("cod_p");

-- AddForeignKey
ALTER TABLE "telefone" ADD CONSTRAINT "telefone_cod_p_fkey" FOREIGN KEY ("cod_p") REFERENCES "cliente"("cod_p") ON DELETE RESTRICT ON UPDATE CASCADE;
