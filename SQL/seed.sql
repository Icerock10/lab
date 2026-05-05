-- TABLES
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price NUMERIC(10, 2) NOT NULL,
  category VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  amount NUMERIC(10, 2) NOT NULL,
  status VARCHAR(20) CHECK (status IN ('pending', 'paid', 'cancelled', 'refunded')),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS order_items (
  id SERIAL PRIMARY KEY,
  order_id INTEGER REFERENCES orders(id),
  product_id INTEGER REFERENCES products(id),
  quantity INTEGER NOT NULL
);

-- USERS
INSERT INTO users (name, email, created_at) VALUES
  ('Alice Müller',    'alice@example.com',   '2023-01-15 10:00:00'),
  ('Bob Schmidt',     'bob@example.com',     '2023-02-20 11:30:00'),
  ('Clara Wagner',    'clara@example.com',   '2023-03-05 09:15:00'),
  ('David Becker',    'david@example.com',   '2023-04-10 14:00:00'),
  ('Eva Hoffmann',    'eva@example.com',     '2023-05-22 16:45:00'),
  ('Frank Klein',     'frank@example.com',   '2023-06-01 08:00:00'),
  ('Grace Wolf',      'grace@example.com',   '2023-07-19 13:20:00'),
  ('Hans Braun',      'hans@example.com',    '2023-08-30 10:10:00'),
  ('Irene Koch',      'irene@example.com',   '2023-09-14 17:00:00'),
  ('Jan Fischer',     'jan@example.com',     '2023-10-05 12:00:00');

-- PRODUCTS
INSERT INTO products (name, price, category) VALUES
  ('Laptop Pro 15',       1299.99, 'Electronics'),
  ('Wireless Mouse',        29.99, 'Electronics'),
  ('Mechanical Keyboard',   89.99, 'Electronics'),
  ('USB-C Hub',             49.99, 'Electronics'),
  ('Standing Desk',        399.99, 'Furniture'),
  ('Ergonomic Chair',      299.99, 'Furniture'),
  ('Desk Lamp',             39.99, 'Furniture'),
  ('Notebook A5',            9.99, 'Stationery'),
  ('Ballpoint Pens x10',     5.99, 'Stationery'),
  ('Whiteboard 90x60',      79.99, 'Stationery'),
  ('Monitor 27"',          349.99, 'Electronics'),
  ('Webcam HD',             69.99, 'Electronics'),
  ('Headphones Pro',       149.99, 'Electronics'),
  ('Coffee Mug',            12.99, 'Kitchen'),
  ('French Press',          34.99, 'Kitchen');

-- ORDERS
INSERT INTO orders (user_id, amount, status, created_at) VALUES
  (1, 1329.98, 'paid',      '2023-11-01 10:00:00'),
  (1,   89.99, 'paid',      '2023-11-15 11:00:00'),
  (2,  349.99, 'paid',      '2023-11-03 09:00:00'),
  (2,   49.99, 'cancelled', '2023-11-20 14:00:00'),
  (3, 1299.99, 'paid',      '2023-11-05 08:30:00'),
  (3,  299.99, 'paid',      '2023-12-01 10:00:00'),
  (3,   39.99, 'refunded',  '2023-12-10 15:00:00'),
  (4,  699.98, 'paid',      '2023-11-08 13:00:00'),
  (5,   79.98, 'paid',      '2023-11-12 16:00:00'),
  (5,  149.99, 'pending',   '2023-12-15 09:00:00'),
  (6,  399.99, 'paid',      '2023-11-18 11:30:00'),
  (7,   29.99, 'paid',      '2023-11-22 10:45:00'),
  (8,  419.98, 'paid',      '2023-11-25 14:15:00'),
  (9,   47.97, 'paid',      '2023-12-02 12:00:00'),
  (1,  349.99, 'paid',      '2023-12-05 10:00:00');

-- ORDER_ITEMS
INSERT INTO order_items (order_id, product_id, quantity) VALUES
  (1,  1, 1),  -- Alice: Laptop
  (1,  2, 1),  -- Alice: Mouse
  (2,  3, 1),  -- Alice: Keyboard
  (3, 11, 1),  -- Bob: Monitor
  (4,  4, 1),  -- Bob: USB-C Hub (cancelled)
  (5,  1, 1),  -- Clara: Laptop
  (6,  6, 1),  -- Clara: Chair
  (7,  7, 1),  -- Clara: Lamp (refunded)
  (8,  5, 1),  -- David: Desk
  (8, 12, 1),  -- David: Webcam
  (9,  8, 2),  -- Eva: Notebooks x2
  (9,  9, 2),  -- Eva: Pens x2
  (10,13, 1),  -- Eva: Headphones
  (11, 5, 1),  -- Frank: Desk
  (12, 2, 1),  -- Grace: Mouse
  (13, 6, 1),  -- Hans: Chair
  (13, 7, 1),  -- Hans: Lamp
  (14, 8, 1),  -- Irene: Notebook
  (14, 9, 2),  -- Irene: Pens
  (14,14, 2),  -- Irene: Mugs
  (15,11, 1);  -- Alice: Monitor