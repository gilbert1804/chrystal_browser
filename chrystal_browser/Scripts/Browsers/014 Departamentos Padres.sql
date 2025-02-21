SELECT 
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
    d.code LIKE '%00'
ORDER BY 
   fatherdescription