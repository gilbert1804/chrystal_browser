delete from browser where code='005';
insert into browser(code,description,query,internal_search_field,show_field,full_screen,resizable,lenght,width,show_coin,coin_code,paginate,query_count,max_rows_by_page,font_size) values ('005','Departamentos ®','SELECT 
    d.*,
    COALESCE(
        (SELECT COUNT(*) 
         FROM products p 
         WHERE p.department = d.code
        ), 
        0
    ) AS department_count,
    fd.description AS fatherdescription
FROM 
    department d
LEFT JOIN 
    department fd ON d.father_department = fd.code
WHERE 
    d.code NOT LIKE ''%00''
ORDER BY 
   fatherdescription',0,0,'f','f',400,940,'f','00','f','',500,11);
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('005','CODE','Código',100,'t',0,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('005','DESCRIPTION','Descripción',380,'t',1,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('005','FATHERDESCRIPTION','Dpt.Padre',200,'t',2,'String','f','f');
insert into browser_columns(main_code,field,field_label,width,visible,index_column,column_type,column_symbol,use_symbol) values ('005','DEPARTMENT_COUNT','Nro Prod.',100,'t',3,'Long','f','f');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('005','CODE','Código',0,0,'department');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('005','DESCRIPTION','Descripción',1,1,'department');
insert into browser_filters(main_code,field,field_label,index_column,index_order,table_name) values ('005','FATHERDESCRIPTION','Dpt.Padre',2,2,'department');