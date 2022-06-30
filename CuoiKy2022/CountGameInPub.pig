data_game = LOAD '/PigData_Final/game.csv' USING PigStorage(',') as ( ID:int,Name:chararray,Platform:chararray,Year:int,Genre:chararray,Publisher:chararray);

data_sale = LOAD '/PigData_Final/game_sale.csv' USING PigStorage(',') as ( ID:int,Other_Sales:float,Global_Sales:float,NA_Sales:float,EU_Sales:float,JP_Sales:float);

data_filter = FILTER data_game by Year >= 2010;

data_join = JOIN data_filter BY ID, data_sale BY ID;

pub_year_group =  Group data_join BY (Publisher, Year);

game_count_pub = FOREACH pub_year_group GENERATE group as Publisher, COUNT(data_join.Name) AS SoLuongGame;

dump game_count_pub;




