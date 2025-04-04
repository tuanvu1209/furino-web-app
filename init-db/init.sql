-- Step 1: Tạo các bảng không phụ thuộc vào khóa ngoại
CREATE TABLE IF NOT EXISTS roles (
  roleId SERIAL PRIMARY KEY,
  name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS productColors (
  productColorId SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  hex VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS productSizes (
  productSizeId SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS categories (
  categoryId SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  image VARCHAR NOT NULL
);

-- Step 2: Tạo bảng products mà không có các khóa ngoại
CREATE TABLE IF NOT EXISTS products (
  productId SERIAL PRIMARY KEY,
  quantity INTEGER NOT NULL,
  sold INTEGER NOT NULL DEFAULT 0,
  name VARCHAR NOT NULL,
  description TEXT NOT NULL
);

-- Step 3: Tạo các bảng phụ thuộc vào khóa ngoại
CREATE TABLE IF NOT EXISTS users (
  userId SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL CHECK (char_length(name) >= 3),
  phone VARCHAR NOT NULL CHECK (char_length(phone) BETWEEN 10 AND 11),
  email VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  roleId INTEGER NOT NULL DEFAULT 3,
  image VARCHAR,
  status BOOLEAN NOT NULL DEFAULT TRUE,
  address VARCHAR,
  FOREIGN KEY (roleId) REFERENCES roles(roleId)
);

CREATE TABLE IF NOT EXISTS productCategories (
  productCategoryId SERIAL PRIMARY KEY,
  productId INTEGER NOT NULL,
  categoryId INTEGER NOT NULL,
  FOREIGN KEY (productId) REFERENCES products(productId),
  FOREIGN KEY (categoryId) REFERENCES categories(categoryId)
);

CREATE TABLE IF NOT EXISTS productInventories (
  productInventoryId SERIAL PRIMARY KEY,
  productSizeId INTEGER NOT NULL,
  productColorId INTEGER NOT NULL,
  productId INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  price DECIMAL NOT NULL,
  priceDiscount DECIMAL,
  sold INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY (productSizeId) REFERENCES productSizes(productSizeId),
  FOREIGN KEY (productColorId) REFERENCES productColors(productColorId),
  FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE IF NOT EXISTS orders (
  orderId SERIAL PRIMARY KEY,
  userId INTEGER NOT NULL,
  orderDate TIMESTAMP NOT NULL,
  orderStatus INTEGER NOT NULL,
  address VARCHAR NOT NULL,
  province VARCHAR NOT NULL,
  district VARCHAR NOT NULL,
  ward VARCHAR NOT NULL,
  phone VARCHAR NOT NULL,
  quantity INTEGER NOT NULL,
  total INTEGER NOT NULL,
  firstName VARCHAR NOT NULL,
  lastName VARCHAR NOT NULL,
  FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE IF NOT EXISTS orderItems (
  orderItemId SERIAL PRIMARY KEY,
  orderId INTEGER NOT NULL,
  productId INTEGER NOT NULL,
  productColorId INTEGER NOT NULL,
  productSizeId INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  price INTEGER NOT NULL,
  FOREIGN KEY (orderId) REFERENCES orders(orderId),
  FOREIGN KEY (productId) REFERENCES products(productId),
  FOREIGN KEY (productColorId) REFERENCES productColors(productColorId),
  FOREIGN KEY (productSizeId) REFERENCES productSizes(productSizeId)
);

CREATE TABLE IF NOT EXISTS notifications (
  notificationId SERIAL PRIMARY KEY,
  userId INTEGER NOT NULL,
  orderId INTEGER NOT NULL,
  title VARCHAR NOT NULL,
  message VARCHAR NOT NULL,
  read BOOLEAN NOT NULL DEFAULT FALSE,
  notificationDate TIMESTAMP NOT NULL,
  FOREIGN KEY (userId) REFERENCES users(userId),
  FOREIGN KEY (orderId) REFERENCES orders(orderId)
);

CREATE TABLE IF NOT EXISTS productGeneralImages (
  productGeneralImageId SERIAL PRIMARY KEY,
  image VARCHAR NOT NULL,
  productId INTEGER NOT NULL,
  FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE IF NOT EXISTS productImages (
  productImageId SERIAL PRIMARY KEY,
  image VARCHAR NOT NULL,
  productId INTEGER NOT NULL,
  productColorId INTEGER NOT NULL,
  FOREIGN KEY (productId) REFERENCES products(productId),
  FOREIGN KEY (productColorId) REFERENCES productColors(productColorId)
);

-- Step 4: Tạo bảng carts sau cùng
CREATE TABLE IF NOT EXISTS carts (
  cartId SERIAL PRIMARY KEY,
  userId INTEGER NOT NULL,
  productId INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  productColorId INTEGER NOT NULL,
  productSizeId INTEGER NOT NULL,
  FOREIGN KEY (userId) REFERENCES users(userId),
  FOREIGN KEY (productId) REFERENCES products(productId),
  FOREIGN KEY (productColorId) REFERENCES productColors(productColorId),
  FOREIGN KEY (productSizeId) REFERENCES productSizes(productSizeId)
);
