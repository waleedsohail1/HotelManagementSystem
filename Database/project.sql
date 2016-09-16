create database hotel;

use hotel;


create table addresses (
    address_id int,
    house_num int,
    street_num int,
    town_city varchar(80),
    country varchar(100),
    primary key (address_id)
);


create table customer (
    c_id int,
    c_name varchar(80),
    CNIC text,
    phone_number int,
    primary key (c_id)
);


create table customer_addresses (
    c_id int,
    address_id int,
    Foreign Key (c_id)
        references customer (c_id),
    Foreign Key (address_id)
        references addresses (address_id)
);


create table staff_job_type (
    job_type_code int,
    job_type_name varchar(50),
    primary key (job_type_code)
);


create table staff (
    s_Id int,
    job_type_code int,
    s_name varchar(80),
    CNIC text,
    phone_number int,
    primary key (s_id),
    Foreign Key (job_type_code)
        references staff_job_type (job_type_code)
);

create table staff_addresses (
    s_id int,
    address_id int,
    Foreign Key (s_id)
        references staff (s_id),
    Foreign Key (address_id)
        references addresses (address_id)
);


create table room (
    room_id int,
    manager_id int,
    price float,
    primary key (room_id),
    foreign key (manager_id)
        references staff (s_id)
);


create table room_type (
    room_id int,
    room_type_id varchar(100),
    primary key (room_id , room_type_id),
    foreign key (room_id)
        references room (room_id)
);


create table booking (
    c_id int,
    room_id int,
    s_id int,
    start_date date,
    end_date date,
    charges float,
    primary key (c_id , room_id),
    foreign key (s_id)
        references staff (s_id)
);


create table bill (
    b_id int,
    c_id int,
    amount float,
    Primary Key (b_id),
    Foreign Key (c_id)
        references customer (c_id)
);


create table invoice (
    invoice_id int,
    c_id int,
    b_id int,
    amount float,
    date_issued date,
    date_paid date,
    Primary Key (invoice_id),
    Foreign Key (c_id)
        references customer (c_id),
    Foreign Key (b_id)
        references bill (b_id)
);


create table login (
    s_id int,
    job_type_code int,
    pass varchar(20),
    primary key (s_id),
    foreign key (s_id)
        references staff (s_id),
    foreign key (job_type_code)
        references staff (job_type_code)
);


insert into staff_job_type values(1,'Admin'),(2,'Manager'),(3,'Receptionist');
insert into addresses values (1,20,3,'Lahore','Pakistan');
insert into staff values(1,1,'Admin','35203424242445235',024253523532);
insert into staff_addresses values(1,1);
insert into login values (1,1,'Admin');

