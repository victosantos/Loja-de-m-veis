CREATE TABLE "cliente" (
  "cpf_cliente" SERIAL PRIMARY KEY,
  "nome_cliente" varchar(40),
  "id_endereco" int(11),
  "telefone" int(11)
);

CREATE TABLE "endereco" (
  "id_endereco" SERIAL PRIMARY KEY,
  "cep" int(8),
  "endereco" varchar(40),
  "numero" int(7),
  "bairro" varchar(40),
  "pais" varchar(25)
);

CREATE TABLE "produto" (
  "id" SERIAL PRIMARY KEY,
  "nome" varchar(40),
  "preco" float4,
  "descricao" text,
  "id_categoria" int(11)
);

CREATE TABLE "categoria" (
  "id_categoria" SERIAL PRIMARY KEY,
  "nome_categoria" varchar(40)
);

CREATE TABLE "estoque" (
  "id_estoque" SERIAL PRIMARY KEY,
  "id_produto" int(11),
  "quantidade" int
);

CREATE TABLE "tipo_pagamento" (
  "id_tipo_pagamento" SERIAL PRIMARY KEY,
  "nome_tipo_pagamento" varchar(40),
  "ativo" bit(1)
);

CREATE TABLE "pedido" (
  "id_pedido" SERIAL PRIMARY KEY,
  "cpf_cliente" int(11),
  "id_tipo_pagamento" int(11),
  "valor_total" double(9,2),
  "id_endereco_cobranca" int(11),
  "id_endereco_entrega" int(11),
  "id_status" int(11),
  "data_status" timestamp
);

CREATE TABLE "entrega" (
  "id_entrega" SERIAL PRIMARY KEY,
  "id_pedido" int(11),
  "previsto_para" date,
  "id_status" int(11),
  "data_status" timestamp
);

CREATE TABLE "tracking" (
  "id_tracking" SERIAL PRIMARY KEY,
  "id_pedido" int(11),
  "id_status" int(11),
  "descricao" text,
  "data_status" timestamp,
  "geo_lat" varchar(14),
  "geo_long" varchar(14)
);

CREATE TABLE "status" (
  "id_status" SERIAL PRIMARY KEY,
  "descricao" text
);

ALTER TABLE "cliente" ADD FOREIGN KEY ("id_endereco") REFERENCES "endereco" ("id_endereco");

ALTER TABLE "produto" ADD FOREIGN KEY ("id_categoria") REFERENCES "categoria" ("id_categoria");

ALTER TABLE "estoque" ADD FOREIGN KEY ("id_produto") REFERENCES "produto" ("id");

ALTER TABLE "pedido" ADD FOREIGN KEY ("cpf_cliente") REFERENCES "cliente" ("cpf_cliente");

ALTER TABLE "pedido" ADD FOREIGN KEY ("id_tipo_pagamento") REFERENCES "tipo_pagamento" ("id_tipo_pagamento");

ALTER TABLE "pedido" ADD FOREIGN KEY ("id_endereco_cobranca") REFERENCES "cliente" ("id_endereco");

ALTER TABLE "pedido" ADD FOREIGN KEY ("id_endereco_entrega") REFERENCES "cliente" ("id_endereco");

ALTER TABLE "pedido" ADD FOREIGN KEY ("id_status") REFERENCES "status" ("id_status");

ALTER TABLE "entrega" ADD FOREIGN KEY ("id_pedido") REFERENCES "pedido" ("id_pedido");

ALTER TABLE "entrega" ADD FOREIGN KEY ("id_status") REFERENCES "status" ("id_status");

ALTER TABLE "tracking" ADD FOREIGN KEY ("id_pedido") REFERENCES "pedido" ("id_pedido");

ALTER TABLE "tracking" ADD FOREIGN KEY ("id_status") REFERENCES "status" ("id_status");
