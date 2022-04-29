/*
  Warnings:

  - You are about to drop the `Cliente` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Cliente" DROP CONSTRAINT "Cliente_cod_p_fkey";

-- DropTable
DROP TABLE "Cliente";

-- CreateTable
CREATE TABLE "cliente" (
    "cod_p" INTEGER NOT NULL,
    "telefone_contato" CHAR(11) NOT NULL,

    CONSTRAINT "cliente_pkey" PRIMARY KEY ("cod_p")
);

-- AddForeignKey
ALTER TABLE "cliente" ADD CONSTRAINT "cliente_cod_p_fkey" FOREIGN KEY ("cod_p") REFERENCES "pessoa"("cod_p") ON DELETE RESTRICT ON UPDATE CASCADE;
