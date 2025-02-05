select id as "value" , name as "label" FROM public.account where id in (select id_account from public.account_type_account ata 
where id_type_account = (select id from public.list_value_item lvi where lvi.identifier ='FORNECEDOR_INTERNO'
))



select id frsom public.list_value_item lvi where lvi.identifier ='FORNECEDOR_INTERNO'

select id_account from public.account_type_account ata 
where id_type_account = (select id from public.list_value_item lvi where lvi.identifier ='FORNECEDOR_INTERNO'
)