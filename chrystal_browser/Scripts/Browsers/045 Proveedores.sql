delete from browser where code='045';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('045','Proveedores ®','SELECT 
    p.*,
    COALESCE(
        (SELECT balance 
         FROM providers_balance pb 
         WHERE pb.provider = p.code 
         ORDER BY emission_date DESC 
         LIMIT 1), 
        0
    ) AS balance,
    -- Subconsulta para balance ajustado por provider_code
    (SELECT 
        CAST(SUM(CASE WHEN indexing_factor <> 0 THEN balance / indexing_factor ELSE 0 END) AS numeric(10, 2))
     FROM 
        debtstopay
     WHERE 
        provider_code = p.code
    ) AS balance_redondeado
FROM 
    provider p
ORDER BY 
    p.description;

',0,0,'f','f',400,900,'f','00','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('045','CODE','Código',100,'t',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('045','DESCRIPTION','Descripción',300,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('045','PHONE','Teléfonos',100,'t',2,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('045','CREDIT_DAYS','Dias.Cred',65,'t',3,'Integer','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('045','BALANCE','Saldo (Sin/Index) Bs',120,'t',4,'Double','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('045','BALANCE_REDONDEADO','Saldo $',60,'t',5,'BigDecimal','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('045','CODE','Código',0,0,'provider');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('045','DESCRIPTION','Descripción',1,1,'provider');