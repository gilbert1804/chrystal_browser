delete from browser where code='109';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('109','Monedas ®','select code, description,symbol, sales_aliquot, buy_aliquot, 
case 
        when show_in_browsers =true then ''Si''
        when show_in_browsers =false then ''No''
 end as show_in_browsers, 
case 
        when value_inventory =true then ''Si''
        when value_inventory =false then ''No''
 end as value_inventory,
case 
        when apply_igtf =true then ''Si''
        when apply_igtf =false then ''No''
 end as aply_igtf
 from coin where code between ? and ? order by code',0,0,'f','f',400,820,'f','00','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('109','CODE','Código',100,'t',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('109','DESCRIPTION','Descripción',130,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('109','SYMBOL','Simbolo',60,'t',2,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('109','SALES_ALIQUOT','Fact.Venta',80,'t',3,'Double','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('109','BUY_ALIQUOT','Fact.Compra',80,'t',4,'Double','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('109','VALUE_INVENTORY','Cap.',70,'t',5,'Boolean','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('109','APLY_IGTF','IGTF',80,'t',6,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('109','SHOW_IN_BROWSERS','Buscador',70,'t',7,'Boolean','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('109','CODE','Código',0,0,'coin');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('109','DESCRIPTION','Descripción',1,1,'coin');

insert into browser_parameters(main_code,default_value,line) values ('109','01',5);
insert into browser_parameters(main_code,default_value,line) values ('109','10',6);