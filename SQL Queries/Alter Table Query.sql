ALTER TABLE [dbo].[2019-Nov]
ALTER COLUMN event_time datetime2 NULL;

ALTER TABLE [dbo].[2019-Nov]
ALTER COLUMN event_type varchar(50) NULL;

ALTER TABLE [dbo].[2019-Nov]
ALTER COLUMN product_id int NOT NULL;

ALTER TABLE [dbo].[2019-Nov]
ALTER COLUMN category_id bigint NULL;

ALTER TABLE [dbo].[2019-Nov]
ALTER COLUMN category_code varchar(50) NULL;

ALTER TABLE [dbo].[2019-Nov]
ALTER COLUMN brand varchar(50) NULL;

ALTER TABLE [dbo].[2019-Nov]
ALTER COLUMN price float NOT NULL;

ALTER TABLE [dbo].[2019-Nov]
ALTER COLUMN user_id int NOT NULL;

ALTER TABLE [dbo].[2019-Nov]
ALTER COLUMN user_session varchar(200) NULL;