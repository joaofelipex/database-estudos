CREATE TABLE IF NOT EXISTS travel.request_hotel(
    id uuid PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    id_instance uuid NOT NULL,
    
    id_city UUID NOT NULL,
    name VARCHAR(200),
    zip_code varchar(8) NULL,
    "number" varchar(20) NULL,
    complement varchar(150) NULL,
	neighborhood varchar(150) NULL,
  
    status int4 NULL DEFAULT 0,
    change_log json NULL DEFAULT '[]'::json,
    created_at timestamp NULL,
    created_by uuid NULL,
    updated_at timestamp NULL,
    updated_by uuid NULL,
    removed_at timestamp NULL,
    removed_by uuid NULL,
    
    CONSTRAINT user_telegram_instance_fk FOREIGN KEY (id_instance) REFERENCES public.instance(id),
    CONSTRAINT user_telegram_user_fk FOREIGN KEY (id_user) REFERENCES travel.request(id)
  
);

COMMENT ON TABLE acl.user_telegram IS 'Usuário do Telegram';
COMMENT ON COLUMN acl.user_telegram.email IS 'Email';
COMMENT ON COLUMN acl.user_telegram.chat_id IS 'Chat id';

CREATE TRIGGER acl_user_telegram_audit_insert AFTER INSERT ON acl."user_telegram"
FOR EACH ROW EXECUTE FUNCTION logger();
CREATE TRIGGER acl_user_telegram_audit_update AFTER UPDATE ON acl."user_telegram"
FOR EACH ROW EXECUTE FUNCTION logger();
  
