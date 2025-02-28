-- Tạo database
CREATE DATABASE startup_project_management;
GO

-- Sử dụng database vừa tạo
USE startup_project_management
GO

-- Tạo bảng tblUsers
CREATE TABLE tblUsers (
    Username VARCHAR(50) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL CHECK (Role IN ('Founder', 'Team Member'))
);
GO

-- Thêm 3 người dùng mẫu với tên tiếng Việt
INSERT INTO tblUsers (Username, Name, Password, Role) VALUES 
('founder2', N'Nguyễn Văn A', '123456', 'Founder'),
('member2', N'Trần Thị B', '123456', 'Team Member'),
('member3', N'Lê Hoàng C', '123456', 'Team Member');
GO

-- Tạo bảng tblStartupProjects
CREATE TABLE tblStartupProjects (
    project_id INT IDENTITY(1,1) PRIMARY KEY,
    project_name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX) NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Ideation', 'Development', 'Launch', 'Scaling')),
    estimated_launch DATE NOT NULL
);
GO

INSERT INTO tblStartupProjects (project_name, Description, Status, estimated_launch)
VALUES 
    (N'Ứng dụng Quản lý Nhân sự', N'Phát triển ứng dụng giúp doanh nghiệp quản lý nhân sự hiệu quả.', 'Ideation', '2025-06-01'),
    (N'Chợ Trực Tuyến', N'Nền tảng kết nối người mua và người bán với nhiều tính năng tiện lợi.', 'Development', '2025-09-15'),
    (N'Hệ thống Học Tập AI', N'Ứng dụng trí tuệ nhân tạo để cá nhân hóa trải nghiệm học tập.', 'Launch', '2025-12-10');