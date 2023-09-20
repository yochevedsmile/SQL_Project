CREATE TABLE catagory
(
  catagory_num NUMERIC(5) NOT NULL,
  catagory_name VARCHAR(15) NOT NULL,
  last_updated_date DATE NOT NULL,
  PRIMARY KEY (catagory_num)
);

CREATE TABLE type
(
  type_ID NUMERIC(5) NOT NULL,
  type_name VARCHAR(15) NOT NULL,
  deposit NUMERIC(5) NOT NULL,
  stuck NUMERIC(5) NOT NULL,
  catagory_num NUMERIC(5) NOT NULL,
  PRIMARY KEY (type_ID),
  FOREIGN KEY (catagory_num) REFERENCES catagory(catagory_num)
);

CREATE TABLE product
(
  product_num NUMERIC(5) NOT NULL,
  color VARCHAR(15) NOT NULL,
  weight NUMERIC(5) NOT NULL,
  type_ID NUMERIC(5) NOT NULL,
  PRIMARY KEY (product_num),
  FOREIGN KEY (type_ID) REFERENCES type(type_ID)
);

CREATE TABLE shifts
(
  finish_time NUMERIC(4) NOT NULL,
  start_time NUMERIC(4) NOT NULL,
  shift_type VARCHAR(15) NOT NULL,
  salary NUMERIC(4) NOT NULL,
  s_id NUMERIC(4) NOT NULL,
  PRIMARY KEY (s_id)
);

CREATE TABLE person
(
  id NUMERIC(5) NOT NULL,
  phone_number NUMERIC(5) NOT NULL,
  name VARCHAR(15) NOT NULL,
  address VARCHAR(15) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE manager
(
  monthly_profit_ NUMERIC(4) NOT NULL,
  id NUMERIC(5) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES person(id)
);

CREATE TABLE shift_manager
(
  num_volunteers_ INT NOT NULL,
  id NUMERIC(5) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES person(id)
);

CREATE TABLE volunteer_
(
  Email VARCHAR(15) NOT NULL,
  gender VARCHAR(15) NOT NULL,
  availability NUMERIC(5) NOT NULL,
  id NUMERIC(5) NOT NULL,
  id NUMERIC(5) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES person(id),
  FOREIGN KEY (id) REFERENCES shift_manager(id)
);

CREATE TABLE customer_
(
  address VARCHAR(15) NOT NULL,
  type VARCHAR(15) NOT NULL,
  urgency VARCHAR(15) NOT NULL,
  id NUMERIC(5) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES person(id)
);

CREATE TABLE order
(
  order_ID NUMERIC(5) NOT NULL,
  status VARCHAR(5) NOT NULL,
  return_date DATE NOT NULL,
  delivery_date DATE NOT NULL,
  id NUMERIC(5) NOT NULL,
  id NUMERIC(5) NOT NULL,
  PRIMARY KEY (order_ID),
  FOREIGN KEY (id) REFERENCES volunteer_(id),
  FOREIGN KEY (id) REFERENCES customer_(id)
);

CREATE TABLE volunteering_
(
  v_id NUMERIC(4) NOT NULL,
  date DATE NOT NULL,
  id NUMERIC(5) NOT NULL,
  id NUMERIC(5) NOT NULL,
  s_id NUMERIC(4) NOT NULL,
  PRIMARY KEY (v_id),
  FOREIGN KEY (id) REFERENCES volunteer_(id),
  FOREIGN KEY (id) REFERENCES customer_(id),
  FOREIGN KEY (s_id) REFERENCES shifts(s_id)
);

CREATE TABLE in_order
(
  product_num NUMERIC(5) NOT NULL,
  order_ID NUMERIC(5) NOT NULL,
  PRIMARY KEY (product_num, order_ID),
  FOREIGN KEY (product_num) REFERENCES product(product_num),
  FOREIGN KEY (order_ID) REFERENCES order(order_ID)
);