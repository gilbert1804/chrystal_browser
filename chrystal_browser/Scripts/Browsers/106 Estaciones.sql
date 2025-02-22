delete from browser where code='106';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('106','Estaciones ®','select 
code,
description,
numeration_sales_bill,
numeration_sales_point_bill,
case 
when use_arching_box=true then ''Si''
when use_arching_box=false then ''No''
end as use_arching_box
from stations where code <> ''00'' order by description ',0,0,'f','f',400,725,'f','00','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('106','CODE','Código',120,'t',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('106','DESCRIPTION','Descripción',260,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('106','NUMERATION_SALES_BILL','Nr.Fac',70,'t',2,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('106','NUMERATION_SALES_POINT_BILL','Nr.Pvt',70,'t',3,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('106','USE_ARCHING_BOX','Arq.Cj',50,'t',4,'Boolean','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('106','CODE','Código',0,0,'stations');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('106','DESCRIPTION','Descripción',1,1,'stations');