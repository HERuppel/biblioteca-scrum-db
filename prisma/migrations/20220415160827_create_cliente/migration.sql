-- CreateTable
CREATE TABLE "Cliente" (
    "cod_p" INTEGER NOT NULL,
    "telefone_contato" CHAR(11) NOT NULL,

    CONSTRAINT "Cliente_pkey" PRIMARY KEY ("cod_p")
);

-- AddForeignKey
ALTER TABLE "Cliente" ADD CONSTRAINT "Cliente_cod_p_fkey" FOREIGN KEY ("cod_p") REFERENCES "pessoa"("cod_p") ON DELETE RESTRICT ON UPDATE CASCADE;
