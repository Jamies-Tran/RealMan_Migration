USE realmanDb;
 
# branch
CREATE TABLE branch(
	branch_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(255) NOT NULL,
    branch_manager_code VARCHAR(100),
    branch_hotline VARCHAR(50),
    branch_thumbnail LONGTEXT,
    branch_street VARCHAR(255) NOT NULL,
    branch_ward VARCHAR(255) NOT NULL,
    branch_district VARCHAR(255) NOT NULL,
    branch_province VARCHAR(255) NOT NULL,
    latitude DOUBLE,
    longitude DOUBLE,
    open TIME NOT NULL,
    close TIME NOT NULL,
    require_staffs INT,
    max_staffs INT,
    branch_status_code VARCHAR(100),
    branch_status_name VARCHAR(256),
    created_at DATETIME,
    updated_at DATETIME,
    created_by VARCHAR(255),
    updated_by VARCHAR(255)
);

# account
CREATE TABLE account(
	account_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone VARCHAR(15),
    address VARCHAR(512),
    password VARCHAR(255),
    staff_code VARCHAR(20),
    role_code VARCHAR(100),
    role_name VARCHAR(256),
    thumbnail LONGTEXT,
    dob DATE,
    gender_code VARCHAR(100),
    gender_name VARCHAR(256),
    professional_type_code VARCHAR(100),
    professional_type_name VARCHAR(256),
    account_status_CODE VARCHAR(100),
    account_status_NAME VARCHAR(100),
    created_at DATETIME,
    updated_at DATETIME,
    created_by VARCHAR(255),
    updated_by VARCHAR(255)
);

CREATE TABLE account_branch(
	account_branch_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    account_id BIGINT,
    branch_id BIGINT,
    working_status_code VARCHAR(100),
    working_status_name VARCHAR(256),
	is_manager BOOLEAN,
    created_at DATETIME,
    updated_at DATETIME,
    created_by VARCHAR(255),
    updated_by VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

CREATE TABLE shop_category(
	shop_category_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    shop_category_code VARCHAR(20) NOT NULL,
    shop_category_name VARCHAR(255),
    service_assignment_code VARCHAR(100),
    service_assignment_name VARCHAR(256),
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255)
);

#service
CREATE TABLE shop_service(
	shop_service_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    shop_category_id BIGINT,
    shop_service_name VARCHAR(255),
    shop_service_price BIGINT,
    shop_service_thumbnail LONGTEXT,
    estimate_duration INT,
    duration_unit_code VARCHAR(100),
    duration_unit_name VARCHAR(256),
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (shop_category_id) REFERENCES shop_category(shop_category_id)
);

#barber service display
CREATE TABLE shop_service_display(
	service_display_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    shop_service_id BIGINT NOT NULL,
    service_display_content LONGTEXT NOT NULL,
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (shop_service_id) REFERENCES shop_service(shop_service_id)
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
    shop_service_id BIGINT NOT NULL,
    FOREIGN KEY (combo_id) REFERENCES combo(combo_id),
    FOREIGN KEY (shop_service_id) REFERENCES shop_service(shop_service_id)
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
    shop_service_id BIGINT,
    branch_service_price BIGINT,
    branch_service_status_code VARCHAR(100) DEFAULT '',
    branch_service_status_name VARCHAR(256) DEFAULT '',
    estimate_duration INT,
    duration_unit_code VARCHAR(100),
    duration_unit_name VARCHAR(250),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (shop_service_id) REFERENCES shop_service(shop_service_id)
);

CREATE TABLE weekly_plan (
	weekly_plan_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    weekly_plan_name VARCHAR(100) DEFAULT "",
    branch_id BIGINT,
    weekly_plan_status_code VARCHAR(100),
    weekly_plan_status_name VARCHAR(256),
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

CREATE TABLE daily_plan (
	daily_plan_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    weekly_plan_id BIGINT,
    date DATE,
    day_in_week_code VARCHAR(100),
    day_in_week_name VARCHAR(256),
    daily_plan_status_code VARCHAR(100),
	daily_plan_status_name VARCHAR(256),
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (weekly_plan_id) REFERENCES weekly_plan(weekly_plan_id)
);

CREATE TABLE daily_plan_service (
	daily_plan_service_id BIGINT PRIMARY KEY AUTO_INCREMENT,
	daily_plan_id BIGINT,
    shop_service_id BIGINT,
    estimate_duration INT,
    duration_unit_code VARCHAR(100),
    duration_unit_name VARCHAR(250),
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (daily_plan_id) REFERENCES daily_plan(daily_plan_id),
    FOREIGN KEY (shop_service_id) REFERENCES shop_service(shop_service_id)
);

CREATE TABLE daily_plan_account (
	daily_plan_accoun_id BIGINT PRIMARY KEY AUTO_INCREMENT,
	daily_plan_id BIGINT,
    account_id BIGINT,
    shift_code VARCHAR(100) DEFAULT "",
	shift_name VARCHAR(256) DEFAULT "",
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (daily_plan_id) REFERENCES daily_plan(daily_plan_id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE booking (
	booking_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    account_id BIGINT,
    branch_id BIGINT,
    daily_plan_id BIGINT,
    booked_at DATE,
    booking_code VARCHAR(100) DEFAULT "",
    booking_method_code VARCHAR(100) DEFAULT "",
    booking_method_name VARCHAR(256) DEFAULT "",
    status_code VARCHAR(100) DEFAULT "",
    status_name VARCHAR(256) DEFAULT "",
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (daily_plan_id) REFERENCES daily_plan(daily_plan_id)
);

CREATE TABLE booking_service (
	booking_service_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    booking_id BIGINT,
    service_id BIGINT,
    staff_id BIGINT,
    pick_up_type_code VARCHAR(100) DEFAULT "",
    pick_up_type_name VARCHAR(256) DEFAULT "",
	begin_at TIME,
    finish_at TIME,
    actual_begin_at TIME,
    actual_finished_at TIME,
    status_code VARCHAR(100) DEFAULT "",
    status_name VARCHAR(256) DEFAULT "",
    price BIGINT,
    created_at DATETIME,
    created_by VARCHAR(255),
    updated_at DATETIME,
    updated_by VARCHAR(255),
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    FOREIGN KEY (service_id) REFERENCES shop_service(shop_service_id),
    FOREIGN KEY (staff_id) REFERENCES account(account_id)
);

