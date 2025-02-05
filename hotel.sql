CREATE TABLE IF NOT EXISTS auxiliary.hotel(
            id uuid PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
            id_instance uuid NOT NULL,
    
            name VARCHAR(200) NOT NULL,
            zip_code VARCHAR(8),
            public_place VARCHAR(150),
            number VARCHAR(20),
            complement VARCHAR(150),
            neighborhood VARCHAR(150),
            id_city UUID NOT NULL,
    
            status int4 NULL DEFAULT 0,
            change_log json NULL DEFAULT '[]'::json,
            created_at timestamp NULL,
            created_by uuid NULL,
            updated_at timestamp NULL,
            updated_by uuid NULL,
            removed_at timestamp NULL,
            removed_by uuid NULL,
            
            CONSTRAINT auxiliary_hotel_instance_fk FOREIGN KEY (id_instance) REFERENCES "instance"(id),
            CONSTRAINT auxiliary_city_fk FOREIGN KEY (id_city) REFERENCES public.city(id)
    );
    
    COMMENT ON COLUMN auxiliary.hotel.name IS 'Hotel';
    COMMENT ON COLUMN auxiliary.hotel.zip_code IS 'CEP';
    COMMENT ON COLUMN auxiliary.hotel.public_place IS 'Logradouro';
    COMMENT ON COLUMN auxiliary.hotel.number IS 'Número';
    COMMENT ON COLUMN auxiliary.hotel.complement IS 'Complemento';
    COMMENT ON COLUMN auxiliary.hotel.neighborhood IS 'Bairro';
    COMMENT ON COLUMN auxiliary.hotel.id_city IS 'Cidade';
  
    CREATE TRIGGER auxiliary_hotel_audit_insert AFTER INSERT ON auxiliary.hotel
    FOR EACH ROW EXECUTE FUNCTION logger();
    CREATE TRIGGER auxiliary_hotel_audit_update AFTER UPDATE ON auxiliary.hotel
    FOR EACH ROW EXECUTE FUNCTION logger();

