create table game
(
    game_id  CHAR(16) FOR BIT DATA not null,
    code     varchar(255)          not null,
    match_id CHAR(16) FOR BIT DATA not null,
    primary key (game_id)
);
create table tournament
(
    match_id      CHAR(16) FOR BIT DATA not null,
    code_length   integer,
    criterion     integer               not null,
    deadline      timestamp             not null,
    pool          varchar(255)          not null,
    started       timestamp             not null,
    originator_id CHAR(16) FOR BIT DATA not null,
    winner_id     CHAR(16) FOR BIT DATA,
    primary key (match_id)
);
create table tournament_players
(
    match_id CHAR(16) FOR BIT DATA not null,
    user_id  CHAR(16) FOR BIT DATA not null
);
create table user_profile
(
    user_id      CHAR(16) FOR BIT DATA not null,
    connected    timestamp             not null,
    created      timestamp             not null,
    display_name varchar(255)          not null,
    oauth_key    varchar(255)          not null,
    primary key (user_id)
);
create index IDXdx19vhmcpb3a8lgxu3jiyb13w on tournament (code_length);
create index IDXa9h9yxbyotcwx27gai0kw9g2f on tournament (started, deadline);
create index IDXakmwux4w2swsj69pg3ignha1v on user_profile (created);
create index IDX7amnj5kvh6ct9ihfmqctn97s1 on user_profile (connected);
alter table user_profile
    add constraint UK_j35xlx80xoi2sb176qdrtoy69 unique (display_name);
alter table user_profile
    add constraint UK_6f815wi5o4jq8p1q1w63o4mhd unique (oauth_key);
alter table game
    add constraint FKegjs96r3uvg786fisw27dbqoi foreign key (match_id) references tournament;
alter table tournament
    add constraint FK43drnxm3b1p9he2hqde03j2jt foreign key (originator_id) references user_profile;
alter table tournament
    add constraint FKg6ga784e1x3jpfq8vuby3rxne foreign key (winner_id) references user_profile;
alter table tournament_players
    add constraint FKlgcpcl5af6tdcgqfi6v993hur foreign key (user_id) references user_profile;
alter table tournament_players
    add constraint FKi84yawbu9x7qu8r4tih7fe84j foreign key (match_id) references tournament;
