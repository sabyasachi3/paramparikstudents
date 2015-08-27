SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `paramparikstudents` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `paramparikstudents` ;

-- -----------------------------------------------------
-- Table `paramparikstudents`.`students`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `paramparikstudents`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `date_of_birth` DATE NULL ,
  `gender` VARCHAR(45) NULL ,
  `caste` VARCHAR(45) NULL ,
  `permanent_address` VARCHAR(500) NULL ,
  `parmanent_pincode` INT NULL ,
  `present_address` VARCHAR(500) NULL ,
  `present_pincode` INT NULL ,
  `email_id` VARCHAR(45) NULL ,
  `contact_no` INT NULL ,
  `contact_no_extra` INT NULL ,
  `date_of_enrolment` DATE NULL ,
  `comment` VARCHAR(45) NULL ,
  PRIMARY KEY (`student_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paramparikstudents`.`result`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `paramparikstudents`.`result` (
  `result_id` INT NOT NULL AUTO_INCREMENT ,
  `student_id` INT NOT NULL ,
  `course` VARCHAR(45) NULL ,
  `institution` VARCHAR(45) NULL ,
  `semester` VARCHAR(45) NULL ,
  `marks` DOUBLE NULL ,
  `percentage` DOUBLE NULL ,
  `grade_point` DOUBLE NULL ,
  `students_student_id` INT NOT NULL ,
  PRIMARY KEY (`result_id`) ,
  INDEX `fk_result_students_idx` (`students_student_id` ASC) ,
  UNIQUE INDEX `result_id_UNIQUE` (`result_id` ASC) ,
  CONSTRAINT `fk_result_students`
    FOREIGN KEY (`students_student_id` )
    REFERENCES `paramparikstudents`.`students` (`student_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paramparikstudents`.`courses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `paramparikstudents`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT ,
  `course_name` VARCHAR(100) NOT NULL ,
  `institute` VARCHAR(100) NULL ,
  `department` VARCHAR(100) NULL ,
  `institute_address` VARCHAR(500) NULL ,
  `pincode` INT NULL ,
  `contact_no` INT NULL ,
  `course_duration` VARCHAR(45) NULL ,
  `college_fees_structure` VARCHAR(45) NULL ,
  `college_fees` DOUBLE NULL ,
  PRIMARY KEY (`course_id`) ,
  UNIQUE INDEX `course_UNIQUE` (`course_name` ASC) ,
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paramparikstudents`.`studentcourses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `paramparikstudents`.`studentcourses` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `student_id` INT NOT NULL ,
  `course_id` INT NOT NULL ,
  `student_staying_at` VARCHAR(45) NULL ,
  `monthly_expenses_of_stay` DOUBLE NULL ,
  `scholarship_applied` VARCHAR(45) NULL ,
  `students_student_id` INT NOT NULL ,
  `courses_course_id` INT NOT NULL ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_studentcourses_students1_idx` (`students_student_id` ASC) ,
  INDEX `fk_studentcourses_courses1_idx` (`courses_course_id` ASC) ,
  PRIMARY KEY (`student_id`, `course_id`) ,
  CONSTRAINT `fk_studentcourses_students1`
    FOREIGN KEY (`students_student_id` )
    REFERENCES `paramparikstudents`.`students` (`student_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_studentcourses_courses1`
    FOREIGN KEY (`courses_course_id` )
    REFERENCES `paramparikstudents`.`courses` (`course_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paramparikstudents`.`payment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `paramparikstudents`.`payment` (
  `payment_id` INT NOT NULL AUTO_INCREMENT ,
  `student_id` INT NOT NULL ,
  `amount` DOUBLE NULL ,
  `mode_of_payment` VARCHAR(45) NULL ,
  `start_period` DATE NULL ,
  `end_period` DATE NULL ,
  `duration_in_month` INT NULL ,
  `cheque_no` VARCHAR(45) NULL ,
  `cheque_issue_date` DATE NULL ,
  `purpose` VARCHAR(255) NULL ,
  `students_student_id` INT NOT NULL ,
  PRIMARY KEY (`payment_id`) ,
  UNIQUE INDEX `payment_id_UNIQUE` (`payment_id` ASC) ,
  INDEX `fk_payment_students1_idx` (`students_student_id` ASC) ,
  CONSTRAINT `fk_payment_students1`
    FOREIGN KEY (`students_student_id` )
    REFERENCES `paramparikstudents`.`students` (`student_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paramparikstudents`.`academic_qualification`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `paramparikstudents`.`academic_qualification` (
  `id` INT NOT NULL ,
  `student_id` VARCHAR(100) NOT NULL ,
  `course` VARCHAR(45) NULL ,
  `year_passed` INT NULL ,
  `university_or_board` VARCHAR(100) NULL ,
  `percentage_of_marks` DOUBLE NULL ,
  `major_subjects` VARCHAR(500) NULL ,
  `students_student_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_academic_qualification_students1_idx` (`students_student_id` ASC) ,
  CONSTRAINT `fk_academic_qualification_students1`
    FOREIGN KEY (`students_student_id` )
    REFERENCES `paramparikstudents`.`students` (`student_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paramparikstudents`.`family_details`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `paramparikstudents`.`family_details` (
  `id` INT NOT NULL ,
  `student_id` VARCHAR(100) NOT NULL ,
  `fathers_name` VARCHAR(45) NULL ,
  `fathers_occupation` VARCHAR(45) NULL ,
  `f_occupation_details` VARCHAR(100) NULL ,
  `mothers_name` VARCHAR(45) NULL ,
  `mothers_occupation` VARCHAR(45) NULL ,
  `m_occupation_details` VARCHAR(45) NULL ,
  `no_of_family_member` INT NULL ,
  `family_type` VARCHAR(45) NULL ,
  `no_of_siblings` INT NULL ,
  `brother_name_1` VARCHAR(45) NULL ,
  `brother_education_1` VARCHAR(100) NULL ,
  `brother_employment_status_1` VARCHAR(45) NULL ,
  `brother_name_2` VARCHAR(45) NULL ,
  `brother_education_2` VARCHAR(100) NULL ,
  `brother_employment_status_2` VARCHAR(45) NULL ,
  `brother_name_3` VARCHAR(45) NULL ,
  `brother_education_3` VARCHAR(100) NULL ,
  `brother_employment_status_3` VARCHAR(45) NULL ,
  `sister_name_1` VARCHAR(45) NULL ,
  `sister_education_1` VARCHAR(100) NULL ,
  `sister_employment_status_1` VARCHAR(45) NULL ,
  `sister_name_2` VARCHAR(45) NULL ,
  `sister_education_2` VARCHAR(100) NULL ,
  `sister_employment_status_2` VARCHAR(45) NULL ,
  `sister_name_3` VARCHAR(45) NULL ,
  `sister_education_3` VARCHAR(100) NULL ,
  `sister_employment_status_3` VARCHAR(45) NULL ,
  `students_student_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) ,
  INDEX `fk_family_details_students1_idx` (`students_student_id` ASC) ,
  CONSTRAINT `fk_family_details_students1`
    FOREIGN KEY (`students_student_id` )
    REFERENCES `paramparikstudents`.`students` (`student_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paramparikstudents`.`scholarship_approved`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `paramparikstudents`.`scholarship_approved` (
  `scholarship_id` INT NOT NULL ,
  `student_id` VARCHAR(100) NOT NULL ,
  `purpose` VARCHAR(45) NULL ,
  `monthly_amount` DOUBLE NULL ,
  `yearly_total_amount` DOUBLE NULL ,
  `status` VARCHAR(45) NULL ,
  `comment` VARCHAR(45) NULL ,
  `students_student_id` INT NOT NULL ,
  PRIMARY KEY (`scholarship_id`) ,
  INDEX `fk_approved_scholarships_students1_idx` (`students_student_id` ASC) ,
  CONSTRAINT `fk_approved_scholarships_students1`
    FOREIGN KEY (`students_student_id` )
    REFERENCES `mydb`.`students` (`student_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `paramparikstudents`.`scholarship_applied`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `paramparikstudents`.`scholarship_approved` (
  `scholarship_id` INT NOT NULL ,
  `student_id` VARCHAR(100) NOT NULL ,
  `purpose` VARCHAR(45) NULL ,
  `monthly_amount` DOUBLE NULL ,
  `yearly_total_amount` DOUBLE NULL ,
  `status` VARCHAR(45) NULL ,
  `comment` VARCHAR(255) NULL ,
  `students_student_id` INT NOT NULL ,
  PRIMARY KEY (`scholarship_id`) ,
  INDEX `fk_approved_scholarships_students1_idx` (`students_student_id` ASC) ,
  CONSTRAINT `fk_approved_scholarships_students1`
    FOREIGN KEY (`students_student_id` )
    REFERENCES `mydb`.`students` (`student_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
