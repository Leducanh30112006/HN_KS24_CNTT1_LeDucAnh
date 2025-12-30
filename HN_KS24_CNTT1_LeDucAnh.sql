create database HN_KS24_CNTT1_LeDucAnh;
use HN_KS24_CNTT1_LeDucAnh;

create table Student(
    StudentID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

create table Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL CHECK (Credits > 0)
);
create table Enrollment (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(4,2) DEFAULT 0,
    
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

insert into Student values 
	(1, 'Nguyễn Văn A', 'a@gmail.com', '0901111111'),
	(2, 'Trần Thị B', 'b@gmail.com', '0902222222'),
	(3, 'Lê Văn C', 'c@gmail.com', '0903333333'),
	(4, 'Phạm Thị D', 'd@gmail.com', '0904444444'),
	(5, 'Hoàng Văn E', 'e@gmail.com', '0905555555');
    
insert into Course  values
	(1, 'Cơ sở dữ liệu', 3),
	(2, 'Lập trình C', 4),
	(3, 'Lập trình Java', 3),
	(4, 'Mạng máy tính', 3),
	(5, 'Hệ điều hành', 4);
	
insert into Enrollment value
	(1, 1, 8.5),
	(1, 2, 7.0),
	(2, 3, 6.5),
	(3, 1, 9.0),
	(4, 4, 8.0);

 -- Viết lệnh cập nhật
UPDATE Enrollment
SET Grade = 9.0
WHERE StudentID = 2 AND CourseID = 3;


-- truy vấn 
SELECT FullName, Email, Phone
FROM Student;

-- Xóa khóa học có Mã KH = 101
DELETE FROM Course
WHERE CourseID = 101;

-- Nếu hệ thống báo lỗi không cho xóa, nguyên nhân là do khóa học có Mã KH = 101
-- đang được tham chiếu trong bảng Enrollment thông qua khóa ngoại (CourseID).
-- Việc xóa bản ghi ở bảng (Course) sẽ làm mất tính toàn vẹn tham chiếu,
-- nên CSDL không cho phép xóa khi còn dữ liệu liên quan ở bảng con.
    
    
    
    


