delete from browser where code='051';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('051','Orden Compra Espera ®','select 
so.*,
c.symbol 
from shopping_operation so 
join coin c on ( c.code = so.coin_code) 
where so.wait =''T'' and so.operation_type = ''ORDER'' order by so.document_no desc',0,1,'f','f',400,1120,'f','00','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('051','CORRELATIVE','CORRELATIVE',0,'f',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('051','DOCUMENT_NO','Documento',100,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('051','EMISSION_DATE','Fecha Emisión',100,'t',2,'Date','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('051','EXPIRATION_DATE','Vence',100,'t',3,'Date','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('051','PROVIDER_CODE','Código',0,'f',4,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('051','PROVIDER_NAME','Nombre',281,'t',5,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('051','TOTAL','Total $',118,'t',6,'Double','f','t');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('051','SYMBOL','',100,'f',7,'String','t','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('051','OPERATION_COMMENTS','Condiciones',265,'t',8,'String','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('051','DOCUMENT_NO','Documento',1,0,'shopping_operation');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('051','PROVIDER_CODE','Código',4,1,'shopping_operation');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('051','PROVIDER_NAME','Nombre',5,2,'shopping_operation');