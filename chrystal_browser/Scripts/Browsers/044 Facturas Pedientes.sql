delete from browser where code='044';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('044','Facturas Pendientes ®','SELECT * FROM sales_operation WHERE wait =''F'' AND pending = ''T'' AND operation_type = ''BILL''  AND canceled = false ORDER BY document_no desc',0,1,'f','f',400,740,'f','00','t','SELECT count(correlative) FROM sales_operation WHERE wait =''F'' AND pending = ''T'' AND operation_type = ''BILL''  AND canceled = false',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('044','CORRELATIVE','CORRELATIVE',0,'f',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('044','DOCUMENT_NO','Documento',100,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('044','EMISSION_DATE','Fecha Emisión',107,'t',2,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('044','CLIENT_CODE','CLIENT_CODE',0,'f',3,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('044','CLIENT_NAME','Nombre',260,'t',4,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('044','TOTAL','Total',112,'t',5,'Double','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('044','CLIENT_CODE','Código',3,0,'sales_operation');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('044','CLIENT_NAME','Nombre',4,1,'sales_operation');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('044','DOCUMENT_NO','Documento',1,2,'sales_operation');