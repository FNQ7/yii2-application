-- Adminer 4.8.1 PostgreSQL 14.5 dump

\connect "application";

DROP TABLE IF EXISTS "auth_assignment";
CREATE TABLE "public"."auth_assignment" (
    "item_name" character varying(64) NOT NULL,
    "user_id" character varying(64) NOT NULL,
    "created_at" integer,
    CONSTRAINT "auth_assignment_pkey" PRIMARY KEY ("item_name", "user_id")
) WITH (oids = false);

CREATE INDEX "idx-auth_assignment-user_id" ON "public"."auth_assignment" USING btree ("user_id");

INSERT INTO "auth_assignment" ("item_name", "user_id", "created_at") VALUES
('admin',	'4',	1705502761);

DROP TABLE IF EXISTS "auth_item";
CREATE TABLE "public"."auth_item" (
    "name" character varying(64) NOT NULL,
    "type" smallint NOT NULL,
    "description" text,
    "rule_name" character varying(64),
    "data" bytea,
    "created_at" integer,
    "updated_at" integer,
    CONSTRAINT "auth_item_pkey" PRIMARY KEY ("name")
) WITH (oids = false);

CREATE INDEX "idx-auth_item-type" ON "public"."auth_item" USING btree ("type");

INSERT INTO "auth_item" ("name", "type", "description", "rule_name", "data", "created_at", "updated_at") VALUES
('admin',	1,	'Администратор',	NULL,	NULL,	1705497824,	1705497824),
('user',	1,	'Пользователь',	NULL,	NULL,	1705497824,	1705497824),
('canAdmin',	2,	'Право входа в админку',	NULL,	NULL,	1705501266,	1705501266);

DROP TABLE IF EXISTS "auth_item_child";
CREATE TABLE "public"."auth_item_child" (
    "parent" character varying(64) NOT NULL,
    "child" character varying(64) NOT NULL,
    CONSTRAINT "auth_item_child_pkey" PRIMARY KEY ("parent", "child")
) WITH (oids = false);

INSERT INTO "auth_item_child" ("parent", "child") VALUES
('admin',	'canAdmin');

DROP TABLE IF EXISTS "auth_rule";
CREATE TABLE "public"."auth_rule" (
    "name" character varying(64) NOT NULL,
    "data" bytea,
    "created_at" integer,
    "updated_at" integer,
    CONSTRAINT "auth_rule_pkey" PRIMARY KEY ("name")
) WITH (oids = false);


DROP TABLE IF EXISTS "migration";
CREATE TABLE "public"."migration" (
    "version" character varying(180) NOT NULL,
    "apply_time" integer,
    CONSTRAINT "migration_pkey" PRIMARY KEY ("version")
) WITH (oids = false);

INSERT INTO "migration" ("version", "apply_time") VALUES
('m000000_000000_base',	1705496259),
('m130524_201442_init',	1705496265),
('m190124_110200_add_verification_token_column_to_user_table',	1705496265),
('m140506_102106_rbac_init',	1705496820),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id',	1705496820),
('m180523_151638_rbac_updates_indexes_without_prefix',	1705496820),
('m200409_110543_rbac_update_mssql_trigger',	1705496820);

DROP TABLE IF EXISTS "user";
DROP SEQUENCE IF EXISTS user_id_seq;
CREATE SEQUENCE user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."user" (
    "id" integer DEFAULT nextval('user_id_seq') NOT NULL,
    "username" character varying(255) NOT NULL,
    "auth_key" character varying(32) NOT NULL,
    "password_hash" character varying(255) NOT NULL,
    "password_reset_token" character varying(255),
    "email" character varying(255) NOT NULL,
    "status" smallint DEFAULT '10' NOT NULL,
    "created_at" integer NOT NULL,
    "updated_at" integer NOT NULL,
    "verification_token" character varying(255),
    CONSTRAINT "user_email_key" UNIQUE ("email"),
    CONSTRAINT "user_password_reset_token_key" UNIQUE ("password_reset_token"),
    CONSTRAINT "user_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "user_username_key" UNIQUE ("username")
) WITH (oids = false);

INSERT INTO "user" ("id", "username", "auth_key", "password_hash", "password_reset_token", "email", "status", "created_at", "updated_at", "verification_token") VALUES
(5,	'SimpleUser',	'LS9-qV9CrWfK_49WbVuIsPDjg3DCRL9j',	'$2y$13$ArLSgxwxFyAq4Eujf3iTvO.CEEhbYjaN4qTFEhitqCDE1mXkj3xnm',	NULL,	'user@mail.ru',	10,	1705503579,	1705503579,	'w0qzzSi-k-yKmtGvAXi3JCjF8wReespl_1705503579'),
(4,	'admin',	'UeOHVze4fhZM0dNqW6L8OjouwIWaHFth',	'$2y$13$.sWaS.0ft/N4PZckSTacqekDahdn1BeTu73jJ4fifXE6wONiOMroe',	NULL,	'admin@mail.ru',	10,	1705496588,	1705496588,	'z4i9fUz9TpO1JyhWjepDoGkADMBANWJB_1705496588'),
(1,	'Purple',	'x1XrfOwepf5Zd10IO9kl1znmIL2kK__9',	'$2y$13$HwfbDeEL/UCME0hm/ueD3OXobf/mM6NcwGuZVPNNMLcLWv1PoDvsy',	NULL,	'vlad.shin.03@mail.ru',	10,	1705496316,	1705496316,	'BbxoWLGdvkyYcc7-r5icKq6JifRB9kVA_1705496316');

<br />
<b>Warning</b>:  Trying to access array offset on value of type bool in <b>D:\Programs\OSPanel\modules\system\html\openserver\adminer\adminer_core.php</b> on line <b>586</b><br />
<br />
<b>Warning</b>:  Trying to access array offset on value of type bool in <b>D:\Programs\OSPanel\modules\system\html\openserver\adminer\adminer_core.php</b> on line <b>586</b><br />
<br />
<b>Warning</b>:  Trying to access array offset on value of type bool in <b>D:\Programs\OSPanel\modules\system\html\openserver\adminer\adminer_core.php</b> on line <b>586</b><br />
<br />
<b>Warning</b>:  Trying to access array offset on value of type bool in <b>D:\Programs\OSPanel\modules\system\html\openserver\adminer\adminer_core.php</b> on line <b>586</b><br />
DROP TABLE IF EXISTS "userContact";
DROP SEQUENCE IF EXISTS "userContact_id_seq";
CREATE SEQUENCE "userContact_id_seq" INCREMENT  MINVALUE  MAXVALUE  CACHE ;

CREATE TABLE "public"."userContact" (
    "id" integer DEFAULT nextval('"userContact_id_seq"') NOT NULL,
    "email" character varying NOT NULL,
    "phone" character varying NOT NULL,
    CONSTRAINT "userContact_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "userContact" ("id", "email", "phone") VALUES
(1,	'vlad.shin.03@mail.ru',	'+79779976539'),
(5,	'test@test.ru',	'+79632325235');

ALTER TABLE ONLY "public"."auth_assignment" ADD CONSTRAINT "auth_assignment_item_name_fkey" FOREIGN KEY (item_name) REFERENCES auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."auth_item" ADD CONSTRAINT "auth_item_rule_name_fkey" FOREIGN KEY (rule_name) REFERENCES auth_rule(name) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."auth_item_child" ADD CONSTRAINT "auth_item_child_child_fkey" FOREIGN KEY (child) REFERENCES auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."auth_item_child" ADD CONSTRAINT "auth_item_child_parent_fkey" FOREIGN KEY (parent) REFERENCES auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

\connect "postgres";

\connect "template1";

-- 2024-01-18 11:58:40.81257+03
