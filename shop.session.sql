CREATE TABLE "brands" (
	"id" SERIAL,
	"title" VARCHAR(255) NOT NULL UNIQUE,
	"description" TEXT NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "item_categories" (
	"id" SERIAL,
	"title" VARCHAR(255) NOT NULL UNIQUE,
	"description" TEXT NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "item_types" (
	"id" SERIAL,
	"title" VARCHAR(255) NOT NULL UNIQUE,
	"description" TEXT NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "customers" (
	"id" SERIAL,
	"name" VARCHAR(255) NOT NULL,
	"email" VARCHAR(255) NOT NULL UNIQUE,
	PRIMARY KEY("id")
);

CREATE TABLE "stores" (
	"id" SERIAL,
	"title" VARCHAR(255) NOT NULL UNIQUE,
	"description" TEXT NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "models" (
	"id" SERIAL,
	"title" VARCHAR(255) NOT NULL UNIQUE,
	"brand_id" INTEGER NOT NULL,
	"description" TEXT NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("brand_id") REFERENCES "brands"("id")
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE "orders" (
	"id" SERIAL,
	"code" INTEGER NOT NULL UNIQUE,
	"date" DATE NOT NULL,
	"customer_id" INTEGER NOT NULL,
	"amount" INTEGER NOT NULL,
	"paid" MONEY NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("customer_id") REFERENCES "customers"("id")
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE "items" (
	"id" SERIAL,
	"categ_id" INTEGER NOT NULL,
	"type_id" INTEGER NOT NULL,
	"model_id" INTEGER NOT NULL,
	"price" MONEY NOT NULL,
	"store_id" INTEGER NOT NULL,
	"amount" INTEGER NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("categ_id") REFERENCES "item_categories"("id")
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("type_id") REFERENCES "item_types"("id")
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("model_id") REFERENCES "models"("id")
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("store_id") REFERENCES "stores"("id")
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE "item_order" (
	"item_id" INTEGER NOT NULL,
	"order_id" INTEGER NOT NULL,
	PRIMARY KEY("item_id", "order_id"),
	FOREIGN KEY("item_id") REFERENCES "items"("id")
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("order_id") REFERENCES "orders"("id")
		ON UPDATE CASCADE ON DELETE CASCADE
);