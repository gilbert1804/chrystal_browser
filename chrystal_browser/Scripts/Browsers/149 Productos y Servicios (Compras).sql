delete from browser where code='149';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('149','Productos y Servicios(Compras) ®','select 
p.code,
p.description,
p.mark,
p.model,
case 
        when buy_tax = ''01'' then ''16%''
        else buy_tax
    end as buy_tax,
    case 
        when sale_tax = ''01'' then ''16%''
        else sale_tax
    end as sale_tax,
case 
when p.extract_net_from_unit_cost_plus_tax
then
(SELECT convert_value_to_coin(
   p.coin,
    ''<P_COIN>'',
    round(cast((pu.unitary_cost + (pu.unitary_cost * t.aliquot / 100)) as numeric),p.rounding_type) ,
    ''SHOPPING'',
    TRUE
))  
else
(SELECT convert_value_to_coin(
   p.coin,
    ''<P_COIN>'',
    pu.unitary_cost + (pu.unitary_cost *  t.aliquot / 100) ,
    ''SHOPPING'',
    TRUE
)) 
end as maximum_price,
coalesce ( sum(ps.stock) ,0) as stock 
from products p 
join products_units pu on (pu.product_code = p.code)
left join products_stock ps on (p.code = ps.product_code)
join taxes t on (t.code = p.buy_tax)
where 
pu.main_unit 
and p.code<>''SERVGAST''
and  p.status=''01''
and product_type in (''T'',''S'')
group by 
p.code,
p.description,
p.mark,
p.model,
pu.unitary_cost,
t.aliquot
order by description
',0,0,'f','f',400,985,'t','02','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('149','CODE','Código',120,'t',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('149','DESCRIPTION','Descripción',400,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('149','MAXIMUM_PRICE','Cost.Unit',60,'t',2,'Double','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('149','MARK','Marca',100,'t',3,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('149','BUY_TAX','C,Iva',40,'t',4,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('149','SALE_TAX','V.Iva',40,'t',5,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('149','STOCK','Exist.Total',70,'t',6,'Double','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('149','DESCRIPTION','Descripción',1,0,'products');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('149','CODE','Código',0,1,'products');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('149','MARK','Marca',3,2,'products');





