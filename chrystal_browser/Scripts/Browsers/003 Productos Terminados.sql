delete from browser where code='003';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('003','Productos Terminados ®','select 
    p.code,
    p.description,
    p.mark,
    p.model,
    p.minimal_stock,
    p.maximum_stock,
    d.description as depa,
    u.description as unit,
    pu.unitary_cost,
    case 
        when days_warranty =1 then ''SI''
        when days_warranty =0 then ''NO''
    end as Verif,
    case 
        when allow_decimal =true then ''SI''
        when allow_decimal =false then ''NO''
    end as allow_decimal,
    case 
        when buy_tax = ''01'' then ''16%''
        else buy_tax
    end as buy_tax,
    case 
        when sale_tax = ''01'' then ''16%''
        else sale_tax
    end as sale_tax,
    case 
        when p.extract_net_from_unit_price_plus_tax
            then (SELECT convert_value_to_coin(
                        p.coin,
                        ''<P_COIN>'',
                        round(cast((pu.maximum_price + (pu.maximum_price * t.aliquot / 100)) as numeric), p.rounding_type) ,
                        ''SALES'',
                        TRUE
                    ))  
        else (SELECT convert_value_to_coin(
                        p.coin,
                        ''<P_COIN>'',
                        pu.maximum_price + (pu.maximum_price * t.aliquot / 100) ,
                        ''SALES'',
                        TRUE
                    )) 
    end as maximum_price,
   coalesce ( sum(ps.stock) ,0) as stock,
   ps1.stock as stock1
from 
    products p 
    join products_units pu on (pu.product_code = p.code)
    left join products_stock ps on (p.code = ps.product_code)
    left join products_stock ps1 on (p.code = ps1.product_code and ps1.store = ''00'')
    join taxes t on (t.code = p.sale_tax)
    join units u on(u.code=pu.unit)
    join department d on(d.code=p.department)
where 
    pu.main_unit 
    and product_type = ''T''
group by 
    p.code,
    p.description,
    p.mark,
    p.model,
    u.description,
    d.description,
    pu.unitary_cost,
    pu.maximum_price,
    t.aliquot,
    ps1.stock
order by 
    p.description',0,0,'f','f',500,1240,'t','02','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','CODE','Código',100,'t',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','DESCRIPTION','Descripción',400,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','MARK','Marca',100,'t',2,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','UNITARY_COST','Cost.',50,'t',3,'Double','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','MAXIMUM_PRICE','P.Max',50,'t',4,'Double','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','BUY_TAX','C.Iva',50,'t',5,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','SALE_TAX','V.Iva',50,'t',6,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','STOCK1','Exis.Tienda',70,'t',7,'Double','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','STOCK','Exis.Total',70,'t',8,'Double','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','UNIT','Unidad',50,'t',9,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','VERIF','Inv.V',40,'t',10,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','ALLOW_DECIMAL','Dec.',40,'t',11,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('003','DEPA','DEPA',0,'f',12,'String','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('003','DESCRIPTION','Descripción',1,0,'products');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('003','CODE','Código',0,1,'products');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('003','MARK','Marca',2,2,'products');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('003','DEPA','Departamento',12,3,'department');