import sqlite3

def run_audit():
    conn = sqlite3.connect('karoo_audit.db')
    cursor = conn.cursor()
    # Simple logic to flag suppliers
    cursor.execute("UPDATE suppliers SET status = 'Review' WHERE supplier_id IN (SELECT supplier_id FROM v_supplier_health WHERE cert_status = 'Expired')")
    conn.commit()
    print("Audit complete.")
    conn.close()

if __name__ == '__main__':
    run_audit()
