create table applier_tb(
    applier_id          varchar2(30)        primary key
    ,applier_pw         varchar2(30)        not null
    ,applier_nm         varchar2(30)        not null
    ,applier_indate     date                default sysdate
);


create table portfolio_tb(
    portfolio_no        number      primary key
    ,applier_id         varchar2(30)       not null
    ,portfolio_title    varchar2(300)       not null
    ,portfolio_content  varchar2(3000)      not null
    ,portfolio_type     char(1)             default 0
    ,portfolio_st       date                not null
    ,portfolio_et       date                not null
    ,portfolio_gb       char(1)             default 0
    ,portfolio_gb_date	date					default sysdate
    ,constraint portfolio_fk foreign key(applier_id) references applier_tb(applier_id)
);

create sequence portfolio_seq;
