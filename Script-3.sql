-- auxiliary.building definition

-- Drop table

-- DROP TABLE auxiliary.building;

CREATE TABLE auxiliary.building (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	id_instance uuid NOT NULL,
	"name" varchar(200) NOT NULL,
	zip_code varchar(8) NULL,
	public_place varchar(150) NULL,
	"number" varchar(20) NULL,
	complement varchar(150) NULL,
	neighborhood varchar(150) NULL,
	id_city uuid NULL,
	latitude numeric(13, 6) NULL,
	longitude numeric(13, 6) NULL,
	status int4 DEFAULT 0 NULL,
	change_log json DEFAULT '[]'::json NULL,
	created_at timestamp NULL,
	created_by uuid NULL,
	updated_at timestamp NULL,
	updated_by uuid NULL,
	removed_at timestamp NULL,
	removed_by uuid NULL,
	CONSTRAINT building_pkey PRIMARY KEY (id)
);

-- Table Triggers

create trigger auxiliary_building_audit_insert after
insert
    on
    auxiliary.building for each row execute function logger();
create trigger auxiliary_building_audit_update after
update
    on
    auxiliary.building for each row execute function logger();


-- auxiliary.building foreign keys

ALTER TABLE auxiliary.building ADD CONSTRAINT building_city_fk_1 FOREIGN KEY (id_city) REFERENCES public.city(id);
ALTER TABLE auxiliary.building ADD CONSTRAINT building_instance_fk FOREIGN KEY (id_instance) REFERENCES public."instance"(id);