-- Analysis views for supplier risk assessment
DROP VIEW IF EXISTS v_supplier_health;
CREATE VIEW v_supplier_health AS
WITH cert_status_cte AS (
    SELECT supplier_id, 
           CASE WHEN MIN(expiry_date) < DATE('now') THEN 'Expired' ELSE 'Valid' END AS cert_status
    FROM certification GROUP BY supplier_id
)
SELECT s.*, COALESCE(c.cert_status, 'Unknown') as cert_status
FROM suppliers s
LEFT JOIN cert_status_cte c ON s.supplier_id = c.supplier_id;
