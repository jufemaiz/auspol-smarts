
create table `speeches` (
  `day` date,
  `name` varchar(255) not null default '',
  `party` varchar(16) not null default '',
  `speaker` varchar(16) not null default '',
  `speech` text
);
