
use java4_new
CREATE TABLE san_pham (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ma_san_pham VARCHAR(255) ,
        ten_san_pham VARCHAR(255) ,
        trang_thai VARCHAR(50), -- or INT, depending on how you represent status
        ngay_tao DATETIME ,
        ngay_sua DATETIME
        );
        CREATE TABLE mau_sac (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ma_mau VARCHAR(255),
        ten_mau VARCHAR(255),
        trang_thai VARCHAR(50), -- or INT, based on your status representation
        ngay_sua DATETIME,
        ngay_tao DATETIME
        );
        CREATE TABLE size (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ma_size VARCHAR(255),
        ten_size VARCHAR(255),
        trang_thai VARCHAR(50), -- or INT, based on your status representation
        ngay_sua DATETIME,
        ngay_tao DATETIME
        );
        CREATE TABLE danh_muc (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ma_danh_muc VARCHAR(255),
        ten_danh_muc VARCHAR(255),
        trang_thai VARCHAR(50), -- Adjust based on how you plan to represent the status
        ngay_tao DATETIME,
        ngay_sua DATETIME
        );
        CREATE TABLE khach_hang (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ho_ten NVARCHAR(255),
        dia_chi NVARCHAR(255),
        sdt VARCHAR(20),
        trang_thai VARCHAR(50), -- Adjust based on how you plan to represent the status
        ngay_tao DATETIME,
        ngay_sua DATETIME
        );
        CREATE TABLE ctsp (
        id INT IDENTITY(1,1) PRIMARY KEY,
        id_sp INT NULL,
        id_mau_sac INT NULL,
        id_size INT NULL,
        gia_ban DECIMAL(18, 2),
        so_luong_ton INT,
        trang_thai VARCHAR(50), -- Adjust based on your representation of status
        ngay_tao DATETIME,
        ngay_sua DATETIME,
        CONSTRAINT fk_sp FOREIGN KEY (id_sp) REFERENCES san_pham(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_mau_sac FOREIGN KEY (id_mau_sac) REFERENCES mau_sac(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_size FOREIGN KEY (id_size) REFERENCES size(id) ON UPDATE CASCADE ON DELETE CASCADE,
        );
        CREATE TABLE hoa_don (
        id INT IDENTITY(1,1) PRIMARY KEY,
        id_khach_hang INT NULL,
        trang_thai VARCHAR(50), -- Adjust based on how you represent the status
        ngay_tao DATETIME,
        ngay_sua DATETIME,
        dia_chi NVARCHAR(255),
        so_dien_thoai VARCHAR(20),
        CONSTRAINT fk_khach_hang FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id) ON UPDATE CASCADE ON DELETE CASCADE,
        );

        CREATE TABLE hdct (
        id INT IDENTITY(1,1) PRIMARY KEY,
        id_hoa_don INT NULL,
        id_ctsp INT NULL,
        so_luong_mua INT,
        gia_ban DECIMAL(18, 2),
        tong_tien DECIMAL(18, 2),
        trang_thai VARCHAR(50), -- Adjust based on how you represent the status
        ngay_tao DATETIME,
        ngay_sua DATETIME,
        CONSTRAINT fk_hoa_don FOREIGN KEY (id_hoa_don) REFERENCES hoa_don(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_ctsp FOREIGN KEY (id_ctsp) REFERENCES ctsp(id) ON UPDATE CASCADE ON DELETE CASCADE,
        );
        ALTER TABLE san_pham
        ADD id_danh_muc INT NULL;

        ALTER TABLE san_pham
        ADD CONSTRAINT fk_san_pham_danh_muc
        FOREIGN KEY (id_danh_muc) REFERENCES danh_muc(id) ON UPDATE CASCADE ON DELETE CASCADE;

		INSERT INTO danh_muc (ma_danh_muc, ten_danh_muc, trang_thai, ngay_tao, ngay_sua) 
VALUES 
('S001', 'Category 1', 'Active', '2024-03-22 08:00:00', '2024-03-22 08:00:00'),
('S002', 'Category 2', 'Inactive', '2024-03-21 09:30:00', '2024-03-21 09:30:00'),
('S003', 'Category 3', 'Active', '2024-03-20 10:45:00', '2024-03-20 10:45:00'),
('S004', 'Category 4', 'Active', '2024-03-19 11:20:00', '2024-03-19 11:20:00'),
('S005', 'Category 5', 'Inactive', '2024-03-18 12:15:00', '2024-03-18 12:15:00'),
('S006', 'Category 6', 'Active', '2024-03-17 13:00:00', '2024-03-17 13:00:00'),
('S007', 'Category 7', 'Active', '2024-03-16 14:30:00', '2024-03-16 14:30:00'),
('S008', 'Category 8', 'Inactive', '2024-03-15 15:45:00', '2024-03-15 15:45:00'),
('S009', 'Category 9', 'Active', '2024-03-14 16:10:00', '2024-03-14 16:10:00'),
('S010', 'Category 10', 'Active', '2024-03-13 17:20:00', '2024-03-13 17:20:00');
SELECT * FROM danh_muc  


INSERT INTO san_pham  (ma_san_pham, ten_san_pham, trang_thai, ngay_tao, ngay_sua, id_danh_muc)
VALUES
('MSP001', 'San Pham 1', 'Available', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 1),
('MSP002', 'San Pham 2', 'Unavailable', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 2),
('MSP003', 'San Pham 3', 'Available', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 3),
('MSP004', 'San Pham 4', 'Available', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 1),
('MSP005', 'San Pham 5', 'Unavailable', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 2),
('MSP006', 'San Pham 6', 'Available', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 3),
('MSP007', 'San Pham 7', 'Unavailable', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 1),
('MSP008', 'San Pham 8', 'Available', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 2),
('MSP009', 'San Pham 9', 'Available', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 3),
('MSP010', 'San Pham 10', 'Unavailable', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 1);

SELECT * from san_pham sp 


INSERT INTO mau_sac (ma_mau, ten_mau, trang_thai, ngay_sua, ngay_tao) VALUES 
('GREEN', 'Xanh lá', 'DEPRECATED', '2023-07-23T06:18:12', '2023-07-02T06:18:12'),
('GREEN', 'Xanh lá', 'INACTIVE', '2023-08-16T06:18:12', '2023-08-02T06:18:12'),
('GREEN', 'Xanh lá', 'ACTIVE', '2023-07-13T06:18:12', '2023-06-17T06:18:12'),
('BLUE', 'Xanh dương', 'INACTIVE', '2023-05-06T06:18:12', '2023-04-16T06:18:12'),
('GREEN', 'Xanh lá', 'INACTIVE', '2023-10-27T06:18:12', '2023-10-09T06:18:12');

INSERT INTO size (ma_size, ten_size, trang_thai, ngay_sua, ngay_tao) VALUES 
('XXL', 'Extra Extra Large', 'INACTIVE', '2023-11-24T06:19:27', '2023-11-24T06:19:27'),
('S', 'Small', 'DEPRECATED', '2023-11-11T06:19:27', '2023-10-20T06:19:27'),
('S', 'Small', 'INACTIVE', '2023-06-04T06:19:27', '2023-05-13T06:19:27'),
('M', 'Medium', 'DEPRECATED', '2023-07-14T06:19:27', '2023-06-28T06:19:27'),
('S', 'Small', 'DEPRECATED', '2023-04-07T06:19:27', '2023-03-10T06:19:27');
INSERT INTO ctsp (id_sp, id_mau_sac, id_size, gia_ban, so_luong_ton, trang_thai, ngay_tao, ngay_sua) VALUES 
(1, 5, 3, 200.67, 60, 'DEPRECATED', '2023-06-06T06:20:38', '2023-06-23T06:20:38'),
(2, 5, 3, 480.79, 26, 'DEPRECATED', '2023-11-14T06:20:38', '2023-12-11T06:20:38'),
(3, 4, 5, 490.36, 83, 'INACTIVE', '2023-08-24T06:20:38', '2023-09-22T06:20:38'),
(4, 3, 4, 485.02, 55, 'INACTIVE', '2023-06-09T06:20:38', '2023-06-25T06:20:38'),
(5, 2, 5, 168.79, 52, 'ACTIVE', '2023-03-29T06:20:38', '2023-04-03T06:20:38'),
(6, 1, 3, 478.08, 32, 'DEPRECATED', '2024-03-17T06:20:38', '2024-03-22T06:20:38'),
(7, 3, 2, 153.15, 22, 'DEPRECATED', '2023-08-10T06:20:38', '2023-08-14T06:20:38'),
(8, 2, 5, 170.01, 0, 'DEPRECATED', '2023-11-01T06:20:38', '2023-11-03T06:20:38'),
(9, 1, 5, 175.1, 9, 'DEPRECATED', '2023-11-21T06:20:38', '2023-12-02T06:20:38'),
(10, 5, 1, 208.95, 79, 'DEPRECATED', '2023-05-20T06:20:38', '2023-06-14T06:20:38');
select * from ctsp
select *  from hdct
select *  from hoa_don

SELECT Id_hoa_don, COUNT(Id_ctsp) AS SoLuongSanPham
FROM hdct
WHERE Id_hoa_don = 3
GROUP BY Id_hoa_don;