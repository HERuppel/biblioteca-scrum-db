-- CreateTable
CREATE TABLE "funcionario" (
    "cod_p" INTEGER NOT NULL,
    "email_contato" VARCHAR(64) NOT NULL,

    CONSTRAINT "funcionario_pkey" PRIMARY KEY ("cod_p")
);

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "funcionario_cod_p_fkey" FOREIGN KEY ("cod_p") REFERENCES "pessoa"("cod_p") ON DELETE RESTRICT ON UPDATE CASCADE;
