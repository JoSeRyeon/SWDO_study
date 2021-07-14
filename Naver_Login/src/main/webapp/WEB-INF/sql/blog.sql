create table blog_member(
    id          VARCHAR2(20)    PRIMARY key
    ,password   VARCHAR2(20)    not null
    ,name       VARCHAR2(20)    not null
    ,photo      NUMBER(1)       default 1

);

create table blog_board(
    boardnum    NUMBER      PRIMARY key
    ,id         VARCHAR2(20)    not null
    ,title      VARCHAR2(200)   not null
    ,content    VARCHAR2(2000)  not null
    ,inputdate  DATE            default sysdate
    ,likecnt    NUMBER          DEFAULT 0
);

create SEQUENCE blog_board_seq;