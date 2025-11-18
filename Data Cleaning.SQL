                               -- Data Cleaning


select * from layoffs;

-- Remove Duplicates
-- Standardize the Data
-- Null Values or Blank Values
-- Remove Any Columns


create table layoffs_staging
like layoffs;

select * from layoffs_staging;

insert layoffs_staging
select * from layoffs;

						 -- Remove Duplicates
                         
                         

select *,row_number() over(
partition by company,location,industry,total_laid_off,
percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from layoffs_staging;


select * from layoffs_staging
where company="casper";


with duplicate_cte as
(
select *,row_number() over(
partition by company,location,industry,total_laid_off,
percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from layoffs_staging
)
select * from duplicate_cte where row_num>1;

select * from layoffs_staging
where company="casper";

with duplicate_cte as
(
select *,row_number() over(
partition by company,location,industry,total_laid_off,
percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from layoffs_staging
)
delete from duplicate_cte where row_num>1;


select * from layoffs_staging;
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select * from layoffs_staging2
where row_num>1;


insert into layoffs_staging2
select *,row_number() over(
partition by company,location,industry,total_laid_off,
percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from layoffs_staging;


delete from layoffs_staging2
WHERE row_num > 1;

select * from layoffs_staging2;


                           -- Standardizing Data
                           
                           

select company,trim(company)
from layoffs_staging2;


update layoffs_staging2
set company=trim(company);


select company from layoffs_staging2;
select *from layoffs_staging2
where industry like"crypto%";


update layoffs_staging2
set industry="crypto"
where industry like"crypto%";


select distinct country, trim(trailing "." from country)
from layoffs_staging2
order by 1;

select distinct country,trim(TRAILING '.' FROM country)
from layoffs_staging2
order by 1;


UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
where country like "united%";


select `date`,STR_TO_DATE(`date`, '%m/%d/%Y')
from layoffs_staging2;


UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;

select * from layoffs_staging2;


select * from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

update layoffs_staging2
set industry= null
where industry=" ";


SELECT distinct industry
FROM layoffs_staging2
WHERE industry IS NULL  OR industry = '';

select * from layoffs_staging2
where company= "Airbnb";


select t1.industry,t2.industry 
from layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company = t2.company
where(t1.industry is null or t1.industry=" ")
and t2.industry is not null; 

update layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;

select * from layoffs_staging2
where company like "bally%";

                       -- Null Values and Blank Values
                       
                       

SELECT *
FROM layoffs_staging2;


SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


delete
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

                             -- Remove Any Columns
                             


select * from layoffs_staging2;


alter table layoffs_staging2
drop column row_num;



