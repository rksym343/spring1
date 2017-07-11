CREATE DATABASE spring;

create table spring.project(
	pno int not null auto_increment,
	p_name varchar(100) not null,
	p_detail text,
	start_date timestamp,
	end_date timestamp,
	p_condition varchar(5),
	primary key(pno)
);


INSERT INTO project (p_name, p_detail, start_date, end_date, p_condition)
VALUES('프로젝트1', '프로젝트 설명1', '2017-01-01', '2017-02-01', '준비'),
('프로젝트2', '프로젝트 설명1', '2017-03-01', '2017-05-01', '종료'),
('프로젝트3', '프로젝트 설명1', '2017-04-01', '2017-08-01', '진행중'),
('프로젝트4', '프로젝트 설명1', '2017-08-01', '2017-10-01', '보류');

select max(pno) from project;
