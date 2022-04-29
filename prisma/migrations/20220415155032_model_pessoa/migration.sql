-- CreateTable
CREATE TABLE "pessoa" (
    "cod_p" SERIAL NOT NULL,
    "cpf" VARCHAR(14) NOT NULL,
    "name" VARCHAR(64) NOT NULL,

    CONSTRAINT "pessoa_pkey" PRIMARY KEY ("cod_p")
);
