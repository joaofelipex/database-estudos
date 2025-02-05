CREATE TABLE IF NOT EXISTS "routine".board_task_checklist(
            id uuid PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
            id_instance uuid NOT NULL,

            id_board UUID,
            id_board_task UUID,
            title VARCHAR (100),
    
            status int4 NULL DEFAULT 0,
            change_log json NULL DEFAULT '[]'::json,
            created_at timestamp NULL,
            created_by uuid NULL,
            updated_at timestamp,
            updated_by uuid NULL,
            removed_at timestamp NULL,
            removed_by uuid NULL,
            
            CONSTRAINT board_task_checklist_instance_fk FOREIGN KEY (id_instance) REFERENCES public.instance(id),
            CONSTRAINT board_task_checklist_board_fk FOREIGN KEY (id_board) REFERENCES "routine".board(id),
            CONSTRAINT board_task_checklist_board_task_fk FOREIGN KEY (id_board_task) REFERENCES "routine".board_task(id)
    );
    
    COMMENT ON TABLE "routine".board_task_checklist IS 'Checklist';
    COMMENT ON COLUMN "routine".board_task_checklist.id_board IS 'Quadro';
    COMMENT ON COLUMN "routine".board_task_checklist.id_board_task IS 'Quadro da Tarefa';
    COMMENT ON COLUMN "routine".board_task_checklist.title IS 'Título';
    
    CREATE TRIGGER routine_board_task_checklist_audit_insert AFTER INSERT ON "routine".board_task_checklist
    FOR EACH ROW EXECUTE FUNCTION logger();
    CREATE TRIGGER routine_board_task_checklist_audit_update AFTER UPDATE ON "routine".board_task_checklist
    FOR EACH ROW EXECUTE FUNCTION logger();