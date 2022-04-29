/*
  Warnings:

  - You are about to drop the column `cod_est` on the `emprestimo` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "emprestimo" DROP CONSTRAINT "emprestimo_cod_est_fkey";

-- DropIndex
DROP INDEX "emprestimo_cod_est_key";

-- AlterTable
ALTER TABLE "emprestimo" DROP COLUMN "cod_est";
