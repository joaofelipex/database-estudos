CREATE TABLE IF NOT EXISTS "routine".board_task_checklist_item(
            id uuid PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
            id_instance uuid NOT NULL,

            id_board UUID,
            id_board_task_checklist UUID,
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
            
            CONSTRAINT board_task_checklist_item_instance_fk FOREIGN KEY (id_instance) REFERENCES public.instance(id),
            CONSTRAINT board_task_checklist_item_board_fk FOREIGN KEY (id_board) REFERENCES "routine".board(id),
            CONSTRAINT board_task_checklist_item_board_task_checklist_fk FOREIGN KEY (id_board_task_checklist) REFERENCES "routine".board_task_checklist(id),
            CONSTRAINT board_task_checklist_item_board_task_fk FOREIGN KEY (id_board_task) REFERENCES "routine".board_task(id)
    );
    
    COMMENT ON TABLE "routine".board_task_checklist_item IS 'Checklist';
    COMMENT ON COLUMN "routine".board_task_checklist_item.id_board IS 'Quadro';
    COMMENT ON COLUMN "routine".board_task_checklist_item.id_board_task IS 'Quadro da Tarefa';
    COMMENT ON COLUMN "routine".board_task_checklist_item.title IS 'Título';
    COMMENT ON COLUMN "routine".board_task_checklist_item.id_board_task_checklist IS 'Visualizar Marcação';
   
    
    CREATE TRIGGER routine_board_task_checklist_item_audit_insert AFTER INSERT ON "routine".board_task_checklist_item
    FOR EACH ROW EXECUTE FUNCTION logger();
    CREATE TRIGGER routine_board_task_checklist_item_audit_update  AFTER UPDATE ON "routine".board_task_checklist_item
    FOR EACH ROW EXECUTE FUNCTION logger();