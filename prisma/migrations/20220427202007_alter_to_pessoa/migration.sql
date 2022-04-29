-- DropForeignKey
ALTER TABLE "telefone" DROP CONSTRAINT "telefone_cod_p_fkey";

-- AddForeignKey
ALTER TABLE "telefone" ADD CONSTRAINT "telefone_cod_p_fkey" FOREIGN KEY ("cod_p") REFERENCES "pessoa"("cod_p") ON DELETE RESTRICT ON UPDATE CASCADE;
