drop table if exists T_ACCOUNT_BENEFICIARY;
drop table if exists T_ACCOUNT_CREDIT_CARD;
drop table if exists T_ACCOUNT;
drop table if exists T_RESTAURANT;
drop table if exists T_REWARD;
drop table if exists DUAL_REWARD_CONFIRMATION_NUMBER;

create table T_ACCOUNT
(
    ID     integer AUTO_INCREMENT primary key,
    NUMBER varchar(9),
    NAME   varchar(50) not null,
    unique (NUMBER)
);
create table T_ACCOUNT_CREDIT_CARD
(
    ID         integer AUTO_INCREMENT primary key,
    ACCOUNT_ID integer,
    NUMBER     varchar(16),
    unique (ACCOUNT_ID, NUMBER)
);
create table T_ACCOUNT_BENEFICIARY
(
    ID                    integer AUTO_INCREMENT primary key,
    ACCOUNT_ID            integer,
    NAME                  varchar(50),
    ALLOCATION_PERCENTAGE decimal(3, 2) not null,
    SAVINGS               decimal(8, 2) not null,
    unique (ACCOUNT_ID, NAME)
);
create table T_RESTAURANT
(
    ID                          integer AUTO_INCREMENT primary key,
    MERCHANT_NUMBER             varchar(10)   not null,
    NAME                        varchar(80)   not null,
    BENEFIT_PERCENTAGE          decimal(3, 2) not null,
    BENEFIT_AVAILABILITY_POLICY varchar(1)    not null,
    unique (MERCHANT_NUMBER)
);
create table T_REWARD
(
    ID                     integer AUTO_INCREMENT primary key,
    CONFIRMATION_NUMBER    varchar(25)   not null,
    REWARD_AMOUNT          decimal(8, 2) not null,
    REWARD_DATE            date          not null,
    ACCOUNT_NUMBER         varchar(9)    not null,
    DINING_AMOUNT          decimal       not null,
    DINING_MERCHANT_NUMBER varchar(10)   not null,
    DINING_DATE            date          not null,
    unique (CONFIRMATION_NUMBER)
);

create table DUAL_REWARD_CONFIRMATION_NUMBER
(
    ZERO integer
);
insert into DUAL_REWARD_CONFIRMATION_NUMBER
values (0);

alter table T_ACCOUNT_CREDIT_CARD
    add constraint FK_ACCOUNT_CREDIT_CARD foreign key (ACCOUNT_ID) references T_ACCOUNT (ID) on delete cascade;
alter table T_ACCOUNT_BENEFICIARY
    add constraint FK_ACCOUNT_BENEFICIARY foreign key (ACCOUNT_ID) references T_ACCOUNT (ID) on delete cascade;