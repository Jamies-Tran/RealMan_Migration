USE realmanDb;

# Add shop owner
INSERT INTO account(first_name,last_name,staff_code,phone, address, password,role_code, role_name,thumbnail, account_status_code, account_status_name) 
	VALUE('SHOP', 'OWNER', 'RM123', '0981874777', '43 Phan Văn Trị','$2a$12$Z.UfJHlsxFnF8hnLGKwpveo8mSOIlk9Rb5Z9jyVWHx9hTe/gILH1G','SHOPOWNER', 'Chủ sở hữu','-','ACTIVATED', 'Đang công tác');

# Add category
INSERT INTO shop_category(shop_category_code, shop_category_name, service_assignment_code, service_assignment_name, created_at, created_by, updated_at, updated_by) VALUE("HAIRCUT", "Cắt Tóc", "STYLIST", "-", null, "-", null, "-");
INSERT INTO shop_category(shop_category_code, shop_category_name, service_assignment_code, service_assignment_name, created_at, created_by, updated_at, updated_by) VALUE("MASSAGE", "Massage", "MASSEUR", "-",null, "-", null, "-");