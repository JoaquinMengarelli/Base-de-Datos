 1- Insert a new employee to , but with an null email. Explain what happens.
insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values (4631,'Schnorr','Julieta','x4632', NULL,'1',NULL,'Director');	


UPDATE employees SET employeeNumber = employeeNumber - 20;
UPDATE employees SET employeeNumber = employeeNumber + 20;


alter table employees add age int;
alter table employees add constraint acceptAge check(age between 16 and 70);

alter table employees 
add lastUpdate datetime default current_timestamp;

create trigger before_employee_update 
    before update on employees
    for each row
begin
    set new.lastUpdate = current_timestamp;
end;