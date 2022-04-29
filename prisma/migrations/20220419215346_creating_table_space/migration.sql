/*
  Warnings:

  - You are about to drop the column `name` on the `pessoa` table. All the data in the column will be lost.
  - The primary key for the `possui` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `num_unidade` on the `possui` table. All the data in the column will be lost.
  - You are about to drop the `exemplar` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[cod_l]` on the table `emprestimo` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `cod_l` to the `emprestimo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome` to the `pessoa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `quantidade` to the `possui` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "exemplar" DROP CONSTRAINT "exemplar_cod_l_fkey";

-- DropForeignKey
ALTER TABLE "possui" DROP CONSTRAINT "possui_num_unidade_cod_l_fkey";

-- DropIndex
DROP INDEX "possui_num_unidade_cod_l_key";

-- AlterTable
ALTER TABLE "emprestimo" ADD COLUMN     "cod_l" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "pessoa" DROP COLUMN "name",
ADD COLUMN     "nome" VARCHAR(64) NOT NULL;

-- AlterTable
ALTER TABLE "possui" DROP CONSTRAINT "possui_pkey",
DROP COLUMN "num_unidade",
ADD COLUMN     "quantidade" INTEGER NOT NULL,
ADD CONSTRAINT "possui_pkey" PRIMARY KEY ("cod_est", "cod_l");

-- DropTable
DROP TABLE "exemplar";

-- CreateIndex
CREATE UNIQUE INDEX "emprestimo_cod_l_key" ON "emprestimo"("cod_l");

-- AddForeignKey
ALTER TABLE "emprestimo" ADD CONSTRAINT "emprestimo_cod_l_fkey" FOREIGN KEY ("cod_l") REFERENCES "livro"("cod_l") ON DELETE RESTRICT ON UPDATE CASCADE;
