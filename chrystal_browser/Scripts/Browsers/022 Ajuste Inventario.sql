delete from browser where code='022';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('022','Ajuste Inventario ®','SELECT 
    io.correlative,
    io.operation_type,
    io.document_no,
    io.emission_date,
    io.wait,
    io.description,
    io.store,
    io.locations,
    io.destination_store,
    io.destination_location,
    io.total,
    io.register_date,
    (SELECT CAST(io.total / ch.sales_aliquot AS numeric(10, 2))
     FROM coin_history ch
     WHERE ch.main_code = ''02'' 
       AND ch.register_date >= io.register_date
     ORDER BY ch.register_date ASC
     LIMIT 1) AS total$
FROM 
    inventory_operation io
WHERE 
    io.wait = ''F'' 
    AND io.operation_type = ''ADJUSTMENT''
ORDER BY 
    io.document_no desc',0,0,'f','f',400,860,'f','00','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('022','DOCUMENT_NO','Documento',100,'t',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('022','EMISSION_DATE','Fecha Emisión',110,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('022','DESCRIPTION','Descripción',268,'t',2,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('022','TOTAL','Total',120,'t',3,'Double','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('022','TOTAL$','Total $',120,'t',4,'BigDecimal','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('022','DOCUMENT_NO','Documento',0,0,'inventory_operation');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('022','EMISSION_DATE','Fecha Emisión',1,1,'inventory_operation');