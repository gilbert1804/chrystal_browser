delete from browser where code='128';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('128','Productos Compuestos ®','select 
p.code,
p.description,
p.mark,
p.model,
CASE 
    WHEN allow_decimal = TRUE THEN ''SI''
    ELSE ''NO''
END AS allow_decimal_status, 
case 
        when buy_tax = ''01'' then ''IVA''
        else buy_tax
    end as buy_tax,
CASE 
    WHEN sale_tax = ''01'' THEN ''16%''
    WHEN sale_tax = ''03'' THEN ''08%''
    ELSE ''EX''
END AS sale_tax,
case 
when p.extract_net_from_unit_price_plus_tax
then
(SELECT convert_value_to_coin(
   p.coin,
    ''<P_COIN>'',
    round(cast((pu.maximum_price + (pu.maximum_price * t.aliquot / 100)) as numeric),p.rounding_type) ,
    ''SALES'',
    TRUE
))  
else
(SELECT convert_value_to_coin(
   p.coin,
    ''<P_COIN>'',
    pu.maximum_price + (pu.maximum_price *  t.aliquot / 100) ,
    ''SALES'',
    TRUE
)) 
end as maximum_price,
coalesce ( sum(ps.stock) ,0) as stock,
u.description as unidadm 
from products p 
join products_units pu on (pu.product_code = p.code)
left join products_stock ps on (p.code = ps.product_code)
join taxes t on (t.code = p.sale_tax)
join units u ON pu.unit = u.code
where 
pu.main_unit 
and product_type = ''C''
group by 
p.code,
p.description,
p.mark,
p.model,
pu.maximum_price,
t.aliquot,
u.description
order by p.description',0,0,'f','f',400,940,'t','02','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('128','CODE','Código',100,'t',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('128','DESCRIPTION','Descripción',370,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('128','MODEL','Peso',50,'t',2,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('128','UNIDADM','Unidad',50,'t',3,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('128','BUY_TAX','C.Iva',50,'t',4,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('128','SALE_TAX','V.Iva',50,'t',5,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('128','ALLOW_DECIMAL_STATUS','Dec.',45,'t',6,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('128','MAXIMUM_PRICE','Precio',70,'t',7,'Double','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('128','DESCRIPTION','Descripción',1,0,'products');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('128','CODE','Código',0,1,'products');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('128','MODEL','Peso',2,2,'products');