INSERT INTO users (name,email,password,role)
SELECT 'AbiCart Admin','admin@abicart.local','$2a$10$aNeSh0D.KsL2Y8VI2Iqrku2VdtH4YMIDDV4PP1.dWjDvgtfwS2sAu','ADMIN'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email='admin@abicart.local');

INSERT INTO users (name,email,password,role)
SELECT 'Demo Seller','seller@abicart.local','$2a$10$kBRpg37RDeqVE361x3eL8ewxI2GFJIfE7zQoCarMmb8ZCVbv1k5Da','SELLER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email='seller@abicart.local');

INSERT INTO users (name,email,password,role)
SELECT 'Demo Buyer','buyer@abicart.local','$2a$10$pSc7ySTMTVZQl4Gj0AECVeSkDvK.AbIzRTIMAsxpTWTLnC05cp3Ga','BUYER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email='buyer@abicart.local');

INSERT INTO products (seller_id, name, description, category, price, stock, image_url)
SELECT u.id, 'Classic Teddy Bear', 'Soft plush teddy bear for gifting.', 'TOYS', 499.00, 25, 'https://via.placeholder.com/160?text=Teddy'
FROM users u
WHERE u.email='seller@abicart.local'
AND NOT EXISTS (SELECT 1 FROM products WHERE name='Classic Teddy Bear');

INSERT INTO products (seller_id, name, description, category, price, stock, image_url)
SELECT u.id, 'Premium Gift Box', 'Reusable gift box with ribbon.', 'GIFTS', 699.00, 18, 'https://via.placeholder.com/160?text=Gift+Box'
FROM users u
WHERE u.email='seller@abicart.local'
AND NOT EXISTS (SELECT 1 FROM products WHERE name='Premium Gift Box');

INSERT INTO products (seller_id, name, description, category, price, stock, image_url)
SELECT u.id, 'Study Stationery Kit', 'Notebook, pens and sticky notes.', 'STATIONERY', 249.00, 40, 'https://via.placeholder.com/160?text=Stationery'
FROM users u
WHERE u.email='seller@abicart.local'
AND NOT EXISTS (SELECT 1 FROM products WHERE name='Study Stationery Kit');
