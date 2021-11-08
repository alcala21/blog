-- Create database;
drop database if exists pets;
create database pets;
use pets;

-- Make a table of cats
create table cats
(
  id              int unsigned not null auto_increment,
  name       varchar(150) not null,
  owner      varchar(150) not null,
  birth         date not null,
  primary key     (id)
);

-- Populate table
insert into cats ( name, owner, birth) values
( 'sandy', 'lennon', '2015-01-03' ),
( 'cookie', 'casey', '2013-11-13' ),
( 'charlie', 'river', '2016-05-21' );

-- Query the cats table
select * from cats;