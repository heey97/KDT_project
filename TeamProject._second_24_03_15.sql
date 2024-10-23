DROP TABLE KDT_COMMENTS;
DROP TABLE KDT_COMMUNITY; 
DROP TABLE KDT_NOTICE; 
DROP TABLE KDT_BUYLIST; 
DROP TABLE kdt_images;
DROP TABLE KDT_SELLLIST; 
DROP TABLE KDT_MEMBER;

CREATE  Table kdt_member (
  id varchar2(100) PRIMARY KEY,
  password varchar2(100) NOT NULL,
  name varchar2(100) NOT NULL,
  birth char(8) NOT NULL,
  gender varchar2(10) NOT NULL,
  phonenum varchar2(100) NOT NULL,
  email varchar2(100),   
  add_city varchar2(100) ,
  add_state varchar2(100) ,
  add_dong varchar2(100) ,
  add_details varchar2(100) ,
  postalcode varchar2(100) ,
  favorite varchar2(100),
  reg_date DATE DEFAULT sysdate
);



CREATE  Table kdt_selllist (
  pdt_code varchar2(100) PRIMARY KEY,
  sell_id varchar2(100) NOT NULL,
  category varchar2(100) NOT NULL,
  price NUMBER(10) NOT NULL,
  read_cnt NUMBER(10) DEFAULT 0,
  title varchar2(100) NOT NULL,
  contents varchar2(3000),   
  sell_location varchar2(100),
  sell_stt char(1) DEFAULT 'N',
  sell_date DATE DEFAULT sysdate,
  FOREIGN KEY (sell_id) REFERENCES kdt_member(id)
);


/*
    CREATE  TABLE kdt_files(
   idx number(2) PRIMARY KEY,
   
   selllist_idx   number(2),   
   notice_idx   number(2),   
   community_idx number(2),
   
   att_file varchar2(200),
   up_file varchar2(200),
   FOREIGN KEY (mem_id) REFERENCES kdt_member(id)
);*/

CREATE  Table kdt_buylist (
   pdt_code varchar2(100) PRIMARY KEY
   sell_id varchar2(100) NOT NULL,   
   price number(10) NOT NULL,      
   title varchar2(100) NOT NULL,   
   pay_id varchar2(100) NOT NULL,
   pay_type varchar2(100) ,
   pay_key varchar2(100) ,
   pay_date DATE DEFAULT sysdate,
     FOREIGN KEY (pdt_code) REFERENCES kdt_selllist(pdt_code),
     FOREIGN KEY (sell_id) REFERENCES kdt_member(id)
);

CREATE Table kdt_notice  (
   idx number(10) PRIMARY KEY,
   title varchar2(100) NOT NULL,
   contents varchar2(3000),
   read_cnt number(10) DEFAULT 0,
   crt_date DATE DEFAULT sysdate
);
CREATE SEQUENCE kdt_notice_idx_seq;

CREATE Table kdt_community  (
   idx number(10) PRIMARY KEY,
   writer_id varchar2(100),
   title varchar2(100),
   contents varchar2(3000),
   read_cnt number(10) DEFAULT 0,
   comment_cnt NUMBER(10),
   crt_date DATE DEFAULT sysdate,
   FOREIGN KEY (writer_id) REFERENCES kdt_member(id)
);
CREATE SEQUENCE kdt_community_idx_seq;

CREATE Table kdt_comments  (
   idx number(10) ,
   self_idx number(10),
   mref number(10) NOT NULL,
   comment_id varchar2(100) NOT NULL,
   contents varchar2(3000),
   heart_cnt number(10) DEFAULT 0,
   crt_date DATE DEFAULT sysdate,
   FOREIGN KEY (mref) REFERENCES kdt_community(idx),
   FOREIGN KEY (comment_id) REFERENCES kdt_member(id),
   CONSTRAINT kdt_comments_PK PRIMARY KEY (idx,self_idx)
);
CREATE SEQUENCE kdt_comments_idx_seq;
CREATE SEQUENCE kdt_comments_self_idx_seq;