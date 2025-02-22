delete from browser where code='047';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('047','Recepción Notas Entrega Compras ®','SELECT 
    so.correlative,
    so.operation_type,
    so.document_no,
    so.control_no,
    so.emission_date,
    so.reception_date,
    so.register_hour,
    so.register_date,
    so.provider_code,
    so.provider_name,
    so.provider_id,
    so.provider_address,
    so.provider_phone,
    so.credit_days,
    so.expiration_date,
    so.wait,
    so.description,
    so.store,
    so.locations,
    so.user_code,
    so.station,
    so.begin_used,
    so.total_amount,
    so.total_net_details,
    so.total_tax_details,
    so.total_details,
    so.percent_discount,
    so.discount,
    so.percent_freight,
    so.freight,
    so.total_net,
    so.total_tax,
    so.total,
    so.credit,
    so.cash,
    so.operation_comments,
    so.total_count_details,
    so.pending,
    so.buyer,
    so.freight_tax,
    so.freight_aliquot,
    so.total_retention_tax,
    so.total_retention_municipal,
    so.total_retention_islr,
    so.total_operation,
    so.retention_tax_prorration,
    so.retention_islr_prorration,
    so.retention_municipal_prorration,
    so.coin_code,
    so.free_tax,
    so.total_exempt,
    so.secondary_coin,
    so.base_igtf,
    so.percent_igtf,
    so.igtf,
    -- Columna total$
    soc.total AS total$
FROM 
    shopping_operation so
LEFT JOIN 
    shopping_operation_coins soc
    ON so.correlative = soc.main_correlative
    AND soc.coin_code = ''02''
WHERE 
    so.wait = ''F''
    AND so.operation_type = ''DELIVERYNOTE'' order by document_no desc',0,1,'f','f',400,863,'f','00','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('047','CORRELATIVE','CORRELATIVE',0,'f',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('047','DOCUMENT_NO','Documento',100,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('047','EMISSION_DATE','Fecha Emisión',100,'t',2,'Date','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('047','PROVIDER_CODE','Código',0,'f',3,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('047','PROVIDER_NAME','Nombre',256,'t',4,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('047','TOTAL','Total',123,'t',5,'Double','f','t');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('047','TOTAL$','Total $',123,'t',6,'Double','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('047','PROVIDER_CODE','Código',3,0,'shopping_operation');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('047','PROVIDER_NAME','Nombre',4,1,'shopping_operation');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('047','DOCUMENT_NO','Documento',1,2,'shopping_operation');