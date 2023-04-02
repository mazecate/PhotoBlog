insert into users (USERNAME, PASSWORD, PHONE, EMAIL, DESCRIPTION) values ('m', '{noop}m', 'test', 'test', 'test');
INSERT INTO user_roles(username, role) VALUES ('m', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('m', 'ROLE_ADMIN');

insert into users (USERNAME, PASSWORD, PHONE, EMAIL, DESCRIPTION) values ('s', '{noop}s', 'test', 'test', 'test');
INSERT INTO user_roles(username, role) VALUES ('s', 'ROLE_USER');