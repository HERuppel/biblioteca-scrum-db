/*
  Warnings:

  - You are about to drop the column `cod_a` on the `livro` table. All the data in the column will be lost.
  - You are about to drop the column `cod_ed` on the `livro` table. All the data in the column will be lost.
  - You are about to drop the `area_livro` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `editora` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `possui` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "livro" DROP CONSTRAINT "livro_cod_a_fkey";

-- DropForeignKey
ALTER TABLE "livro" DROP CONSTRAINT "livro_cod_ed_fkey";

-- DropForeignKey
ALTER TABLE "possui" DROP CONSTRAINT "possui_cod_est_fkey";

-- DropForeignKey
ALTER TABLE "possui" DROP CONSTRAINT "possui_cod_l_fkey";

-- DropIndex
DROP INDEX "livro_cod_a_key";

-- DropIndex
DROP INDEX "livro_cod_ed_key";

-- AlterTable
ALTER TABLE "livro" DROP COLUMN "cod_a",
DROP COLUMN "cod_ed";

-- DropTable
DROP TABLE "area_livro";

-- DropTable
DROP TABLE "editora";

-- DropTable
DROP TABLE "possui";
