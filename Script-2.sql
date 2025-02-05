-- auxiliary.ambience definition

-- Drop table

-- DROP TABLE auxiliary.ambience;

CREATE TABLE auxiliary.ambience (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	id_instance uuid NOT NULL,
	"name" varchar(150) NOT NULL,
	id_building uuid NOT NULL,
	status int4 DEFAULT 0 NULL,
	change_log json DEFAULT '[]'::json NULL,
	created_at timestamp NULL,
	created_by uuid NULL,
	updated_at timestamp NULL,
	updated_by uuid NULL,
	removed_at timestamp NULL,
	removed_by uuid NULL,
	CONSTRAINT ambience_pkey PRIMARY KEY (id)
);

-- Table Triggers

create trigger auxiliary_ambience_audit_insert after
insert
    on
    auxiliary.ambience for each row execute function logger();
create trigger auxiliary_ambience_audit_upadate after
update
    on
    auxiliary.ambience for each row execute function logger();


-- auxiliary.ambience foreign keys

ALTER TABLE auxiliary.ambience ADD CONSTRAINT ambience_building_fk FOREIGN KEY (id_building) REFERENCES auxiliary.building(id);
ALTER TABLE auxiliary.ambience ADD CONSTRAINT ambience_instance_fk FOREIGN KEY (id_instance) REFERENCES public."instance"(id);