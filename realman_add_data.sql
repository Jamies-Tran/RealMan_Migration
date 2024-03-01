USE realmanDb;

# Add shop owner
INSERT INTO account(first_name,last_name,staff_code,phone,password,role,thumbnail, account_status) VALUE('SHOP', 'OWNER', 'RM123', '0981874777','$2a$12$Z.UfJHlsxFnF8hnLGKwpveo8mSOIlk9Rb5Z9jyVWHx9hTe/gILH1G',0,'-',0);

# Add category
INSERT INTO service_category(service_category_code, service_category_name, created_at, created_by, updated_at, updated_by) VALUE("HAIRCUT", "Cắt Tóc", null, "-", null, "-");
INSERT INTO service_category(service_category_code, service_category_name, created_at, created_by, updated_at, updated_by) VALUE("MASSAGE", "Massage", null, "-", null, "-");
INSERT INTO service_category(service_category_code, service_category_name, created_at, created_by, updated_at, updated_by) VALUE("OTHER", "Khác", null, "-", null, "-");