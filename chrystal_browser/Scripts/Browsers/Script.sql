SELECT 
    io.correlative,
    io.operation_type,
    io.document_no,
    io.emission_date,
    io.wait,
    io.description,
    io.store,
    io.locations,
    io.destination_store,
    io.destination_location,
    io.total,
    io.register_date,
    (SELECT CAST(io.total / ch.sales_aliquot AS numeric(10, 2))
     FROM coin_history ch
     WHERE ch.main_code = '02' 
       AND ch.register_date >= io.register_date
     ORDER BY ch.register_date ASC
     LIMIT 1) AS total$
FROM 
    inventory_operation io
WHERE 
    io.wait = 'F' 
    AND io.operation_type = 'LOAD'
ORDER BY 
    io.document_no desc