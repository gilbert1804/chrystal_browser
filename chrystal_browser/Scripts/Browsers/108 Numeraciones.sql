delete from browser where code='108';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('108','Numeraciones ®','select * from numeration order by code',0,0,'f','f',400,705,'f','00','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('108','CODE','Código',100,'t',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('108','DESCRIPTION','Descripción',250,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('108','PREFIX','Prefijo',100,'t',2,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('108','LAST_NUMBER','Último Número',100,'t',3,'Integer','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('108','CODE','Código',0,0,'numeration');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('108','DESCRIPTION','Descripción',1,1,'numeration');