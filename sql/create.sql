CREATE TABLE `fill_up` (
  `fill_up_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(30) NOT NULL,
  `fill_up_date` date DEFAULT NULL,
  `fill_up_gas_amount` double NOT NULL,
  `fill_up_price_pg` double DEFAULT NULL,
  `miles_driven` double DEFAULT NULL,
  `miles_per_gallon` double DEFAULT NULL,
  PRIMARY KEY (`fill_up_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gas_grade` (
  `gas_grade_id` int(11) NOT NULL,
  `gas_grade_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`gas_grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
