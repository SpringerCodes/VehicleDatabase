drop table vehicles CASCADE CONSTRAINTS;
drop table model CASCADE CONSTRAINTS;
drop table brand CASCADE CONSTRAINTS;
drop table dealers CASCADE CONSTRAINTS;
drop table customers CASCADE CONSTRAINTS;
drop table inventory CASCADE CONSTRAINTS;
drop table sales CASCADE CONSTRAINTS;
drop table parts CASCADE CONSTRAINTS;
drop table suppliers CASCADE CONSTRAINTS;
drop table supplier_parts CASCADE CONSTRAINTS;
drop table manufacturer CASCADE CONSTRAINTS;


create table vehicles
    (VIN                char(17),
     model_id           varchar2(12),
     color              varchar2(10),
     engine_type        varchar2(15),
     transmission       varchar2(10),
     convertible        char(1),
     primary key        (VIN)
    );
    
create table model
    (model_id           varchar2(10),
     model_name         varchar2(20),
     year               numeric(4),
     brand_id           varchar2(10),   
     primary key        (model_id)
    );

create table brand
    (brand_id           varchar2(10),
     brand_name         varchar2(20) not null,
     primary key        (brand_id)
    );

create table dealers
    (dealer_id          varchar2(10),
     dealer_name        varchar2(50) not null,
     phone              varchar2(10),
     primary key (dealer_id)
    );

create table customers
    (customer_id        varchar2(10),
     name               varchar2(30) not null,
     address            varchar2(50),
     phone              varchar2(10),
     gender             char(1),
     income             numeric(12,2) check (income > 0),
     primary key        (customer_id)
    );

create table inventory
    (VIN                char(17),
     dealer_id          varchar2(10),
     available_date     DATE,
     date_of_sale       DATE,
     purchase_price     numeric(12,2) check (purchase_price > 0),     
     primary key        (VIN)
    );

create table sales
    (VIN                char(17),
     customer_id        varchar2(10),
     dealer_id          varchar2(10),
     purchase_date      DATE, 
     purchase_amount    numeric(12,2) check (purchase_amount > 0),
     primary key        (VIN)
    ); 

create table parts
    (part_id            varchar2(10),
     part_name          varchar2(50),
     model_id           varchar2(10),
     manufacture_date   DATE,
     primary key        (part_id)
    );
    
create table suppliers
    (supplier_id        varchar2(10),
     supplier_name      varchar2(50),
     location           varchar2(10),
     primary key        (supplier_id)
    );
    
create table supplier_parts
    (supplier_id        varchar2(10),
     part_id            varchar2(10),     
     primary key        (supplier_id, part_id)
    );
    
create table manufacturer
    (manu_id            varchar2(10),
     manu_name          varchar2(50) not null,
     location           varchar2(20),
     primary key        (manu_id)
    );
    
    
ALTER TABLE vehicles
ADD FOREIGN KEY (model_id) REFERENCES model(model_id)
ON DELETE SET NULL;

ALTER TABLE model
ADD FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
ON DELETE CASCADE;

ALTER TABLE inventory
ADD FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
ON DELETE SET NULL;

ALTER TABLE inventory
ADD FOREIGN KEY (dealer_id) REFERENCES dealers(dealer_id)
ON DELETE SET NULL;

ALTER TABLE sales
ADD FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
ON DELETE SET NULL;

ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE SET NULL;

ALTER TABLE sales
ADD FOREIGN KEY (dealer_id) REFERENCES dealers(dealer_id)
ON DELETE SET NULL;

ALTER TABLE parts
ADD FOREIGN KEY (model_id) REFERENCES model(model_id)
ON DELETE CASCADE;

ALTER TABLE supplier_parts
ADD FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
ON DELETE CASCADE;

ALTER TABLE supplier_parts
ADD FOREIGN KEY (part_id) REFERENCES parts(part_id)
ON DELETE CASCADE;

insert into brand values ('B07942862', 'Tesla');
insert into brand values ('B76197581', 'Toyota');
insert into brand values ('B60696843', 'Honda');
insert into brand values ('B56309124', 'Lexus');
insert into brand values ('B81030481', 'Chevrolet');
insert into brand values ('B17863183', 'Ford');
insert into brand values ('B69992954', 'Volkswagen');
insert into brand values ('B46053864', 'Kia');
insert into brand values ('B55976565', 'Nissan');

insert into dealers values ('D48936452','Tesla of Burbank',         '6264563183');
insert into dealers values ('D00928168','Toyota of Waldorf',        '3014268746');
insert into dealers values ('D05517447','Honda of Norfolk',         '7578792491');
insert into dealers values ('D89758420','Virginia Beach Lexus',     '7571597584');
insert into dealers values ('D82462554','Bowie Chevrolet',          '2404453879');
insert into dealers values ('D86470081','Pasadena Ford',            '6264422671');
insert into dealers values ('D53213757','Volkswagen of Glendale',   '6261675974');
insert into dealers values ('D03325842','Koons Kia',                '3011278559');
insert into dealers values ('D67528297','SoCal Nissan',             '6268765244');

insert into customers values ('C87605924','Frodo Baggins',      '215 Hobbiton Lane',        '6261287654','M', 75000);
insert into customers values ('C81033186','Samwise Gamgee',     '117 Prancing Pony Way',    '6269485662','M', 60000);
insert into customers values ('C32567730','Gandalf',            '655 Balrog Blvd',          '5194842236','M', 90000);
insert into customers values ('C85340400','Hermione Granger',   '4422 Kings Cross Street',  '2234589761','F', 65000);
insert into customers values ('C33176250','Pansy Parkinson',    '8261 Rowling Avenue',      '4834891087','F', 42000);
insert into customers values ('C73858267','Luna Lovegood',      '6187 Lupine Lane',         '4435079957','F', 55000);
insert into customers values ('C62295099','Harry Potter',       '12 Grimald Place',         '4268721387','M', 57000);
insert into customers values ('C62146586','Dudley Dursley',     '4 Privet Drive',           '1579953478','M', 34000);
insert into customers values ('C96655520','Joe Biden',          '1600 Pennsylvania Avenue', '2024587790','M', 400000);

insert into manufacturer values ('MA4530093','Auto Parts Inc.', 'Waldorf'); 
insert into manufacturer values ('MA8750224','Parts R Us', 'Waldorf'); 
insert into manufacturer values ('MA3183116','Auto Manufacturer LLC', 'Virginia Beach'); 
insert into manufacturer values ('MA8261138','Vehicle Pieces Co.', 'Virginia Beach'); 
insert into manufacturer values ('MA5376937','Best Auto Parts', 'Suffolk'); 

insert into suppliers values ('S25128294','T&H Auto Parts','Baltimore');
insert into suppliers values ('S70695947','Autozone','Baltimore');
insert into suppliers values ('S74181128','Allied Auto','Orlando');
insert into suppliers values ('S47530503','Prime Automotive','Orlando');
insert into suppliers values ('S94404324','777 Car Parts','Miami');
insert into suppliers values ('S12783874','Getrag','Detroit');

insert into model values ('M54454434','Camry', 2016, 'B76197581');
insert into model values ('M71786507','Model S', 2016, 'B07942862');
insert into model values ('M16385267','Accord', 2012, 'B60696843');
insert into model values ('M84148202','RX', 2019, 'B56309124');
insert into model values ('M52087971','Camaro', 2018, 'B81030481');
insert into model values ('M91356341','Mustang', 2016, 'B17863183');
insert into model values ('M79168566','Bug', 2016, 'B69992954');
insert into model values ('M46987974','Soul', 2016, 'B46053864');
insert into model values ('M33659799','Altima', 2016, 'B55976565');

insert into vehicles values ('29181734251861553', 'M54454434', 'white', 'V4',       'automatic', 'n');
insert into vehicles values ('66439702020339881', 'M71786507', 'blue',  'Electric', 'automatic', 'n');
insert into vehicles values ('74189999610561417', 'M16385267', 'green', 'V4',       'automatic', 'n');
insert into vehicles values ('47451511531729329', 'M84148202', 'red',   'V6',       'automatic', 'n');
insert into vehicles values ('44723162834957595', 'M52087971', 'black', 'V8',       'manual',    'y');
insert into vehicles values ('99413242958149202', 'M91356341', 'red',   'V8',       'manual',    'y');
insert into vehicles values ('12324277548928314', 'M79168566', 'white', 'V4',       'automatic', 'y');
insert into vehicles values ('19389631822261947', 'M46987974', 'blue',  'V6',       'automatic', 'n');
insert into vehicles values ('70898525370373980', 'M33659799', 'black', 'V6',       'automatic', 'n');
insert into vehicles values ('15743874349843247', 'M54454434', 'white', 'V4',       'automatic', 'n');
insert into vehicles values ('56723489456487567', 'M54454434', 'red',   'V4',       'automatic', 'n');
insert into vehicles values ('41231567897547894', 'M54454434', 'gold',  'V4',       'automatic', 'n');
insert into vehicles values ('13247984657894561', 'M54454434', 'gold',  'V4',       'automatic', 'n');
insert into vehicles values ('41536487894657894', 'M71786507', 'white', 'Electric', 'automatic', 'n');
insert into vehicles values ('12348674789564854', 'M71786507', 'black', 'Electric', 'automatic', 'n');
insert into vehicles values ('13487654657894561', 'M71786507', 'blue',  'Electric', 'automatic', 'n');


insert into inventory values ('12324277548928314', 'D53213757', TO_DATE('06/05/2021','MM/DD/YYYY'), TO_DATE('05/15/2021','MM/DD/YYYY'), 19000);
insert into inventory values ('19389631822261947', 'D03325842', TO_DATE('06/05/2021','MM/DD/YYYY'), TO_DATE('05/15/2021','MM/DD/YYYY'), 12000);
insert into inventory values ('70898525370373980', 'D67528297', TO_DATE('06/05/2021','MM/DD/YYYY'), TO_DATE('05/15/2021','MM/DD/YYYY'), 17000);
insert into inventory values ('15743874349843247', 'D00928168', TO_DATE('03/01/2021','MM/DD/YYYY'), TO_DATE('02/02/2021','MM/DD/YYYY'), 19000);
insert into inventory values ('56723489456487567', 'D00928168', TO_DATE('06/02/2021','MM/DD/YYYY'), TO_DATE('05/15/2021','MM/DD/YYYY'), 19000);
insert into inventory values ('41231567897547894', 'D00928168', TO_DATE('06/03/2021','MM/DD/YYYY'), TO_DATE('05/15/2021','MM/DD/YYYY'), 19000);
insert into inventory values ('13247984657894561', 'D00928168', TO_DATE('06/06/2021','MM/DD/YYYY'), TO_DATE('05/15/2021','MM/DD/YYYY'), 19000);
insert into inventory values ('41536487894657894', 'D48936452', TO_DATE('06/10/2021','MM/DD/YYYY'), TO_DATE('05/15/2021','MM/DD/YYYY'), 19000);
insert into inventory values ('12348674789564854', 'D48936452', TO_DATE('06/15/2021','MM/DD/YYYY'), TO_DATE('05/15/2021','MM/DD/YYYY'), 19000);
insert into inventory values ('13487654657894561', 'D48936452', TO_DATE('08/31/2021','MM/DD/YYYY'), TO_DATE('05/15/2021','MM/DD/YYYY'), 19000);


insert into sales values ('29181734251861553', 'C81033186', 'D00928168', TO_DATE('06/10/2021','MM/DD/YYYY'), 25300);
insert into sales values ('66439702020339881', 'C32567730', 'D48936452', TO_DATE('07/10/2021','MM/DD/YYYY'), 45000);
insert into sales values ('74189999610561417', 'C62146586', 'D05517447', TO_DATE('01/10/2020','MM/DD/YYYY'), 23500);
insert into sales values ('47451511531729329', 'C85340400', 'D89758420', TO_DATE('02/10/2020','MM/DD/YYYY'), 37000);
insert into sales values ('44723162834957595', 'C96655520', 'D82462554', TO_DATE('05/10/2021','MM/DD/YYYY'), 39000);
insert into sales values ('99413242958149202', 'C87605924', 'D86470081', TO_DATE('04/10/2019','MM/DD/YYYY'), 38250);

insert into parts values ('P19726345','Windshield',                 'M54454434', TO_DATE('06/05/2015','MM/DD/YYYY'));
insert into parts values ('P70114991','Left Tail light',            'M71786507', TO_DATE('06/05/2019','MM/DD/YYYY'));
insert into parts values ('P61098908','Tailpipe',                   'M16385267', TO_DATE('06/05/2010','MM/DD/YYYY'));
insert into parts values ('P11992306','Driver Side Door Handle',    'M54454434', TO_DATE('06/15/2015','MM/DD/YYYY'));
insert into parts values ('P08463173','Passenger Side Mirror',      'M54454434', TO_DATE('06/17/2015','MM/DD/YYYY'));
insert into parts values ('P32443412','Air Filter',                 'M71786507', TO_DATE('06/05/2019','MM/DD/YYYY'));
insert into parts values ('P48797246','Transmission',               'M54454434', TO_DATE('03/21/2015','MM/DD/YYYY'));

insert into supplier_parts values ('S25128294', 'P19726345');
insert into supplier_parts values ('S25128294', 'P70114991');
insert into supplier_parts values ('S70695947', 'P19726345');
insert into supplier_parts values ('S74181128', 'P61098908');
insert into supplier_parts values ('S47530503', 'P11992306');
insert into supplier_parts values ('S94404324', 'P08463173');
insert into supplier_parts values ('S12783874', 'P48797246');

