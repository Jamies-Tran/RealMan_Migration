USE realmanDb;

# branch
CREATE TABLE branch(
	branch_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(255) NOT NULL,
    branch_thumbnail LONGTEXT,
    branch_street VARCHAR(255) NOT NULL,
    branch_ward VARCHAR(255) NOT NULL,
    branch_district VARCHAR(255) NOT NULL,
    branch_province VARCHAR(255) NOT NULL,
    latitude DOUBLE,
    longitude DOUBLE,
    open TIME NOT NULL,
    close TIME NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,
    created_by VARCHAR(255),
    updated_by VARCHAR(255)
);

# account
CREATE TABLE account(
	account_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    branch_id BIGINT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone VARCHAR(15),
    password VARCHAR(255),
    staff_code VARCHAR(20),
    role TINYINT,
    thumbnail LONGTEXT,
    dob DATE,
    gender TINYINT,
    account_status TINYINT,
    created_at DATETIME,
    updated_at DATETIME,
    created_by VARCHAR(255),
    updated_by VARCHAR(255),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

CREATE TABLE service_category(
	service_category_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    service_category_code VARCHAR(20) NOT NULL,
    service_category_name VARCHAR(255),
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255)
);

#service
CREATE TABLE barber_service(
	barber_service_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    service_category_id BIGINT,
    barber_service_name VARCHAR(255),
    barber_service_price BIGINT,
    thumbnail LONGTEXT,
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (service_category_id) REFERENCES service_category(service_category_id)
);

#barber service display
CREATE TABLE barber_service_display(
	barber_service_display_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    barber_service_id BIGINT NOT NULL,
    barber_service_display_content LONGTEXT NOT NULL,
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (barber_service_id) REFERENCES barber_service(barber_service_id)
);

# combo
CREATE TABLE combo(
	combo_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    branch_id BIGINT,
    combo_name VARCHAR(255) NOT NULL,
    combo_price BIGINT NOT NULL,
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

# combo service
CREATE TABLE combo_service(
	combo_service_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    combo_id BIGINT NOT NULL,
    barber_service_id BIGINT NOT NULL,
    FOREIGN KEY (combo_id) REFERENCES combo(combo_id),
    FOREIGN KEY (barber_service_id) REFERENCES barber_service(barber_service_id)
);

# branch display
CREATE TABLE branch_display(
	branch_display_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    branch_id BIGINT,
    branch_display_content LONGTEXT,
	created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

# branch service
CREATE TABLE branch_service(
	branch_service_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    branch_id BIGINT,
    barber_service_id BIGINT,
    branch_service_price BIGINT,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (barber_service_id) REFERENCES barber_service(barber_service_id)
);