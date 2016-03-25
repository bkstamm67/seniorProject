-- DATABASE DATA
-- Name:  Group 2
-- Assignment:  Final Project
-- Date:  2.19.16
-- TO UPLOAD, IMPORT IN MYPHPADMIN AFTER UPLOADING databaseTables.sql

/*  UNCOMMENT THIS BLOCK IF USING MYSQL DATABASE THAT ALLOWS MORE THAN ONE DATABASE */
/* OSU'S MYSQL DATABASE DOES NOT ALLOW THIS SO THIS BLOCK NEEDS TO REMAIN COMMENTED IF LOADING TO YOUR OSU DATABASE */

-- adminTable
-- pdf url links and "about" text 
insert into adminTable (adminID, title, notes, about) values 
	(1, "about", "The Corvallis Sustainability Coalition is a network of organizations and individuals in Corvallis/Benton County, Oregon working together to create a more sustainable community.\n\nThe Coalition includes businesses, non-profits, faith communities, educational institutions, and government entities that are committed to creating a community that values environmental quality, social equity, and economic vitality. Our primary purpose is to foster communication and collaboration so that we can accelerate progress toward a sustainable future.\n\nThe Coalition was launched in 2007 by local coordinators of the Natural Step who saw the need to bring together those in our community working on different aspects of sustainability. We are now an independent 501(c)(3) non-profit organization. Our work has built on the efforts and accomplishments of the City of Corvallis and other community groups.\n\nParticipation in the Corvallis Sustainability Coalition is open to local organizations and individuals who support its vision, mission, goals, and guiding objectives. There is no fee for participation.", ""),
	(2, "recycle depot url", "http://site.republicservices.com/site/corvallis-or/en/documents/corvallisrecycledepot.pdf", ""),
	(3, "recycle curbside url", "http://site.republicservices.com/site/corvallis-or/en/documents/detailedrecyclingguide.pdf", "")
	;

-- adminUser
-- usernames, passwords, etc.
insert into adminUser (userID, fName, lName, userName, password, email) values 
	(1, "Brian", "Stamm", "bstamm", "bstamm", "stammbr@oregonstate.edu"), 
	(2, "Katie", "Musick", "kmusick", "saba", "someAddress@hotmail.com"),
	(3, "User", "1", "user", "user", "user@address.org")
	;
	
-- reuse
-- general reuse categories
insert into reuse (reuseID, item, notes) values
	(1, "Household", ""),
	(2, "Bedding/Bath", ""),
	(3, "Children's Goods", ""),
	(4, "Appliances - Small", ""), 
	(5, "Appliances - Large", ""),
	(6, "Building/Home Improvement", ""),
	(7, "Wearable Items", ""),
	(8, "Useable Electronics", ""),
	(9, "Sporting Equipment/Camping", ""),
	(10, "Garden", ""),
	(11, "Food", ""),
	(12, "Medical Supplies", ""),
	(13, "Office Equipment", ""), 
	(14, "Packing Materials", ""),
	(15, "Miscellaneous", "")
	;
	
-- repair
-- specific items that are repaired
insert into repair (repairID, item, notes) values 
	(1, 'Books', ""), 
	(2, 'Cell Phones', ""), 
	(3, 'Clothes', ""),
	(4, 'Computers', ""), 
	(5, 'Appliances - Small', ""),
	(6, 'Furniture', ""),
	(7, 'Lawn Equipment', ""),
	(8, 'Reel Mowers', ""),
	(9, 'Sandals', ""),
	(10, 'Screen Repair', ""),
	(11, 'Shoes, Boots', ""), 
	(12, 'Upholstery, Furniture', "")
	;	
	
-- reuseSubcategory and reuse_subcat
-- specific items that are reused
insert into reuseSubcategory (subcatID, itemSub, notes) values
	(1, "Arts and crafts", "Household"),
	(2, "Barbeque grills", "Household"),
	(3, "Books", "Household"),
	(4, "Canning jars", "Household"),
	(5, "Cleaning supplies", "Household"),
	(6, "Clothes hanger", "Household"),
	(7, "Cookware", "Household"),
	(8, 'Dishes', "Household"),
	(9, 'Fabric', "Household"),
	(10, 'Food storage containers', "Household"),
	(11, 'Furniture', "Household"),
	(12, 'Luggage', "Household"),
	(13, 'Mattresses', "Household"),
	(14, 'Ornaments', "Household"),
	(15, 'Toiletries', "Household"),
	(16, 'Utensils', "Household")
	;
	
insert into reuse_subcat (rid, sid) values
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11), (1, 12), (1, 13), (1, 14), (1, 15), (1, 16);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(17, 'Blankets', "Bedding/Bath"),		
	(18, 'Comforters', "Bedding/Bath"),
	(19, 'Linens', "Bedding/Bath"),
	(20, 'Sheets', "Bedding/Bath"),
	(21, 'Small rugs', "Bedding/Bath"),
	(22, 'Towels', "Bedding/Bath")
	;

insert into reuse_subcat (rid, sid) values
(2, 17), (2, 18), (2, 19), (2, 20), (2, 21), (2, 22);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(23, 'Arts and crafts', "Children's Goods"),	
	(24, 'Baby carriers', "Children's Goods"),
	(25, 'Baby gates', "Children's Goods"),
	(26, 'Bike trailers', "Children's Goods"),
	(27, 'Books', "Children's Goods"),
	(28, 'Child car seats', "Children's Goods"),
	(29, 'Clothes', "Children's Goods"),
	(30, 'Crayons', "Children's Goods"),
	(31, 'Cribs', "Children's Goods"),
	(32, 'Diapers', "Children's Goods"),
	(33, 'High chairs', "Children's Goods"),
	(34, 'Maternity', "Children's Goods"),
	(35, 'Musical instruments', "Children's Goods"),
	(36, 'Nursing items', "Children's Goods"),
	(37, 'Playpens', "Children's Goods"),
	(38, 'School supplies', "Children's Goods"),
	(39, 'Strollers', "Children's Goods"),
	(40, 'Toys', "Children's Goods")
	;
	
insert into reuse_subcat (rid, sid) values
(3, 23), (3, 24), (3, 25), (3, 26), (3, 27), (3, 28), (3, 29), (3, 30), (3, 31), 
(3, 32), (3, 33), (3, 34), (3, 35), (3, 36), (3, 37), (3, 38), (3, 39), (3, 40);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(41, 'Blenders', "Appliances - Small"),		
	(42, 'Dehumidifiers', "Appliances - Small"),
	(43, 'Fans', "Appliances - Small"),
	(44, 'Microwaves', "Appliances - Small"),
	(45, 'Space heaters', "Appliances - Small"),
	(46, 'Toasters', "Appliances - Small"),
	(47, 'Vacuum cleaners', "Appliances - Small")
	;
	
insert into reuse_subcat (rid, sid) values
(4, 41), (4, 42), (4, 43), (4, 44), (4, 45), (4, 46), (4, 47);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(48, 'Dishwashers', "Appliances - Large"),	
	(49, 'Freezers', "Appliances - Large"),
	(50, 'Refrigerators', "Appliances - Large"),
	(51, 'Stoves', "Appliances - Large"),
	(52, 'Washers/Dryers', "Appliances - Large")
	;
	
insert into reuse_subcat (rid, sid) values
(5, 48), (5, 49), (5, 50), (5, 51), (5, 52);	
	
insert into reuseSubcategory (subcatID, itemSub, notes) values
	(53, 'Bricks', "Building/Home Improvement"),	
	(54, 'Carpet padding', "Building/Home Improvement"),
	(55, 'Carpets', "Building/Home Improvement"),
	(56, 'Ceramic tiles', "Building/Home Improvement"),
	(57, 'Doors', "Building/Home Improvement"),
	(58, 'Drywall', "Building/Home Improvement"),
	(59, 'Electrical supplies', "Building/Home Improvement"),
	(60, 'Hand tools', "Building/Home Improvement"),
	(61, 'Hardware', "Building/Home Improvement"),
	(62, 'Insulation', "Building/Home Improvement"),
	(63, 'Ladders', "Building/Home Improvement"),
	(64, 'Light fixtures', "Building/Home Improvement"),
	(65, 'Lighting ballasts', "Building/Home Improvement"),
	(66, 'Lumber', "Building/Home Improvement"),
	(67, 'Motors', "Building/Home Improvement"),
	(68, 'Paint', "Building/Home Improvement"),
	(69, 'Pipe', "Building/Home Improvement"),
	(70, 'Plumbing', "Building/Home Improvement"),
	(71, 'Power tools', "Building/Home Improvement"),
	(72, 'Reusable metal items', "Building/Home Improvement"),
	(73, 'Roofing', "Building/Home Improvement"),
	(74, 'Vinyl', "Building/Home Improvement"),
	(75, 'Windows', "Building/Home Improvement")
	;
	
insert into reuse_subcat (rid, sid) values
(6, 53), (6, 54), (6, 55), (6, 56), (6, 57), (6, 58), (6, 59), (6, 60), (6, 61), (6, 62), (6, 63), 
(6, 64), (6, 65), (6, 66), (6, 67), (6, 68), (6, 69), (6, 70), (6, 71), (6, 72), (6, 73), (6, 74);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(76, 'Belts', "Wearable Items"),						
	(77, 'Boots', "Wearable Items"),
	(78, 'Clothes', "Wearable Items"),
	(79, 'Coats', "Wearable Items"),
	(80, 'Hats', "Wearable Items"),
	(81, 'Rainwear', "Wearable Items"),
	(82, 'Sandals', "Wearable Items"),
	(83, 'Shoes', "Wearable Items")
	;
	
insert into reuse_subcat (rid, sid) values
(7, 76), (7, 77), (7, 78), (7, 79), (7, 80), (7, 81), (7, 82), (7, 83);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(84, 'Calculators', "Useable Electronics"),			
	(85, 'Cameras', "Useable Electronics"),
	(86, 'Cassette players', "Useable Electronics"),
	(87, 'CD players', "Useable Electronics"),
	(88, 'CDs', "Useable Electronics"),
	(89, 'Cell phones', "Useable Electronics"),
	(90, 'Computers', "Useable Electronics"),
	(91, 'Curling irons', "Useable Electronics"),
	(92, 'DVD players', "Useable Electronics"),
	(93, 'Game consoles', "Useable Electronics"),
	(94, 'GPS systems', "Useable Electronics"),
	(95, 'Hair dryers', "Useable Electronics"),
	(96, 'Monitors', "Useable Electronics"),
	(97, 'MP3 players', "Useable Electronics"),
	(98, 'Printers', "Useable Electronics"),
	(99, 'Projectors', "Useable Electronics"),
	(100, 'Receivers', "Useable Electronics"),
	(101, 'Scanners', "Useable Electronics"),
	(102, 'Speakers', "Useable Electronics"),
	(103,'Tablets', "Useable Electronics"),
	(104, 'Telephones', "Useable Electronics"),
	(105, 'TVs', "Useable Electronics")
	;

insert into reuse_subcat (rid, sid) values
(8, 84), (8, 85), (8, 86), (8, 87), (8, 88), (8, 89), (8, 90), (8, 91), (8, 92), (8, 93), (8, 94),(8, 95),
(8, 96), (8, 97), (8, 98), (8, 99), (8, 100), (8, 101), (8, 102), (8, 103), (8, 104), (8, 105);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(106, 'Backpacks', "Sporting Equipment/Camping"),
	(107, 'Balls', "Sporting Equipment/Camping"),
	(108, 'Barbells', "Sporting Equipment/Camping"),
	(109, 'Bicycles', "Sporting Equipment/Camping"),
	(110, 'Bike tires', "Sporting Equipment/Camping"),
	(111, 'Camping equipment', "Sporting Equipment/Camping"),
	(112, 'Day packs', "Sporting Equipment/Camping"),
	(113, 'Dumbbells', "Sporting Equipment/Camping"),
	(114, 'Exercise equipment', "Sporting Equipment/Camping"),
	(115, 'Golf clubs', "Sporting Equipment/Camping"),
	(116, 'Helmets', "Sporting Equipment/Camping"),
	(117, 'Hiking boots', "Sporting Equipment/Camping"),
	(118, 'Skateboards', "Sporting Equipment/Camping"),
	(119, 'Skis', "Sporting Equipment/Camping"),
	(120 ,'Small boats', "Sporting Equipment/Camping"),
	(121, 'Snowshoes', "Sporting Equipment/Camping"),
	(122, 'Sporting goods', "Sporting Equipment/Camping"),
	(123, 'Tennis rackets', "Sporting Equipment/Camping"),
	(124, 'Tents', "Sporting Equipment/Camping")
	;
	
insert into reuse_subcat (rid, sid) values
(9, 106), (9, 107), (9, 108), (9, 109), (9, 110), (9, 111), (9, 112), (9, 113), (9, 114), (9, 115),
(9, 116), (9, 117), (9, 118), (9, 119), (9, 120), (9, 121), (9, 122), (9, 123), (9, 124);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(125, 'Chain saws', "Garden"),	
	(126, 'Fencing', "Garden"),
	(127, 'Garden pots', "Garden"),
	(128, 'Garden tools', "Garden"),
	(129 ,'Hand clippers', "Garden"),
	(130, 'Hoses', "Garden"),
	(131, 'Lawn furniture', "Garden"),
	(132, 'Livestock supplies', "Garden"),
	(133, 'Loppers', "Garden"),
	(134, 'Mowers', "Garden"),
	(135, 'Seeders', "Garden"),
	(136, 'Soil amendment', "Garden"),
	(137, 'Sprinklers', "Garden"),
	(138, 'Wheelbarrows', "Garden")
	;
	
insert into reuse_subcat (rid, sid) values
(10, 125), (10, 126), (10, 127), (10, 128), (10, 129), (10, 130), (10, 131), 
(10, 132), (10, 133), (10, 134), (10, 135), (10, 136), (10, 137), (10, 138);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(139, 'Beverages',  "Food"),
	(140, 'Surplus garden produce', "Food"),
	(141, 'Unopened canned goods', "Food"),
	(142, 'Unopened packaged food', "Food")
	;
	
insert into reuse_subcat (rid, sid) values
(11, 139), (11, 140), (11, 141), (11, 142);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(143, 'Adult diapers', "Medical Supplies"),	
	(144, 'Blood pressure monitors', "Medical Supplies"),
	(145, 'Canes', "Medical Supplies"),
	(146, 'Crutches', "Medical Supplies"),
	(147, 'Eye glasses', "Medical Supplies"),
	(148, 'Glucose meters', "Medical Supplies"),
	(149, 'Hearing aids', "Medical Supplies"),
	(150, 'Hospital beds', "Medical Supplies"),
	(151, 'Reach extenders', "Medical Supplies"),
	(152, 'Shower chairs', "Medical Supplies"),
	(153, 'Walkers', "Medical Supplies"),
	(154, 'Wheelchairs', "Medical Supplies")
	;
	
insert into reuse_subcat (rid, sid) values
(12, 143), (12, 144), (12, 145), (12, 146), (12, 147), (12, 148), 
(12, 149), (12, 150), (12, 151), (12, 152), (12, 153), (12, 154);	

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(155, 'Calculators', "Office Equipment"),	
	(156, 'Computers', "Office Equipment"),
	(157, 'Fax machines', "Office Equipment"),
	(158, 'Headsets', "Office Equipment"),
	(159, 'Monitors', "Office Equipment"),
	(160, 'Office furniture', "Office Equipment"),
	(161, 'Paper shredders', "Office Equipment"),
	(162, 'Printer cartridge refilling', "Office Equipment"),
	(163, 'Printers', "Office Equipment"),
	(164, 'Scanners', "Office Equipment"),
	(165, 'Telephones', "Office Equipment")
	;
	
insert into reuse_subcat (rid, sid) values
(13, 155), (13, 156), (13, 157), (13, 158), (13, 159), (13, 160), (13, 161), (13, 162), (13, 163), (13, 164), (13, 165);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(166, 'Bubble wrap', "Packing Materials"),	
	(167, 'Clean foam peanuts', "Packing Materials"),
	(168, 'Foam sheets', "Packing Materials")
	;

insert into reuse_subcat (rid, sid) values
(14, 166), (14, 167), (14, 168);

insert into reuseSubcategory (subcatID, itemSub, notes) values
	(169, 'Egg cartons', "Miscellaneous"),	
	(170, 'Firewood', "Miscellaneous"),
	(171, 'Fabric', "Miscellaneous"),
	(172, 'Paper bags', "Miscellaneous"),
	(173, 'Pet supplies', "Miscellaneous"),
	(174, 'Shopping bags', "Miscellaneous"),
	(175, 'Vehicles/Parts', "Miscellaneous"),
	(176, 'Computer paper', "Miscellaneous"),
	(177, 'Reusable metal items', "Miscellaneous"),
	(178, 'Brown paper',  "Miscellaneous"),
	(179, 'Office supplies', "Miscellaneous")
	;

insert into reuse_subcat (rid, sid) values
(15, 169), (15, 170), (15, 171), (15, 172), (15, 173), (15, 174),
(15, 175), (15, 176), (15, 177), (15, 178), (15, 179);

-- business (REPAIR BUSINESSES) and repair_bus 
insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(1, 'Book Binding','108 SW 3rd St','Corvallis','OR','(541) 757-9861','http://www.cornerstoneassociates.com/bj-bookbinding.html','Rebind and restore books', 0.00, 0.00);
insert into repair_bus (bid, rid) values (1, 1);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(2, 'Cell Phone Sick Bay', '252 SW Madison Ave, Suite 110','Corvallis','OR','(541) 230-1785', 'http://www.cellsickbay.com/index.html', 'Cell phones and tablets', 0.00, 0.00);
insert into repair_bus (bid, rid) values (2, 2);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(3, "Geeks 'N' Nerds", "950 Southeast Geary St, Unit D", 'Albany','OR',"(541) 753-0018", "http://www.computergeeksnnerds.com/", "repair computers of all kinds and cell phone repair, in home repair available", 0.00, 0.00);
insert into repair_bus (bid, rid) values (3, 2);
insert into repair_bus (bid, rid) values (3, 4);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(4, 'Specialty Sewing By Leslie', '225 SW Madison Ave', 'Corvallis', 'OR', '(541) 758-4556','http://www.specialtysewing.com/Leslie_Seamstress/Welcome.html', 'Alterations and custom work', 0.00, 0.00);
insert into repair_bus (bid, rid) values (4, 3);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(5, 'Corvallis Technical','966 NW Circle Blvd','Corvallis','OR','(541) 704-7009','http://www.corvallistechnical.com/','Repair computers and laptops', 0.00, 0.00);
insert into repair_bus (bid, rid) values (5, 4);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(6, 'Bellevue Computers', '1865 NW 9th St', 'Corvallis', 'OR', '(541) 757-3487', 'http://www.bellevuepc.com/', 'Repair computers and laptops', 0.00, 0.00);
insert into repair_bus (bid, rid) values (6, 4);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(7, "OSU Repair Fair", "644 S.W. 13th St", "Corvallis", "OR", "(541) 737-5398", "http://fa.oregonstate.edu/surplus","Oregon State University Property Services Building, Occurs twice per quarter in the evenings", 0.00, 0.00);
insert into repair_bus (bid, rid) values (7, 5);
insert into repair_bus (bid, rid) values (7, 4);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(8, "P.K Furniture Repair & Refinishing","5270 Corvallis-Newport Hwy","Corvallis", "OR", "(541) 230-1727", "http://www.pkfurniturerefinishing.net/","Complete Restoration, Complete Refinishing, Modifications, Custom Color Matching, Furniture Stripping,Chair Press Caning, Repairs", 0.00, 0.00);
insert into repair_bus (bid, rid) values (8, 6);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(9, "Furniture Restoration Center","1321 Main St", "Philomath", "OR", "(541) 929-6681", "http://restorationsupplies.com/","Restores all typers of furniture and has hardware for doing it yourself", 0.00, 0.00);
insert into repair_bus (bid, rid) values (9, 6);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(10, "Power Equipment","713 NE Circle Blvd", "Corvallis", "OR", "(541) 757-8075", "https://corvallispowerequipment.stihldealer.net/","lawn and garden equipment, chain saws  (Stihl, honda, shindiawh), hand held equipment.", 0.00, 0.00);
insert into repair_bus (bid, rid) values (10, 7);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(11, "Robnett's","400 SW 2nd St", "Corvallis", "OR", "(541) 753-5531", "http://ww3.truevalue.com/robnetts/Home.aspx","Reel mowers: adjustment and sharpening, Screens: screen repair for windows and doors", 0.00, 0.00);
insert into repair_bus (bid, rid) values (11, 8);
insert into repair_bus (bid, rid) values (11, 10);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(12, "Footwise","301 SW Madison Ave #100", "Corvallis", "OR", "(541) 757-0875", "http://footwise.com/", "resoles Birkenstock", 0.00, 0.00);
insert into repair_bus (bid, rid) values (12, 9);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(13, "Sedlack","225 SW 2nd St", "Corvallis", "OR", "(541) 752-1498", "http://www.sedlaksshoes.net/","full resoles, elastic and velcros, sewing and patching, leather patches, zippers, half soles and heels", 0.00, 0.00);
insert into repair_bus (bid, rid) values (13, 11);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(14, "Foam Man","2511 NW 9th St", "Corvallis", "OR", "(541) 754-9378", "http://www.thefoammancorvallis.com/","Replacement foam cusions for chairs and couches;  upholstery", 0.00, 0.00);
insert into repair_bus (bid, rid) values (14, 12);

-- business (REUSE BUSINESSES) and reuse_bus
insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(15, 'Albany-Corvallis ReUse It', '', '', '', '', 'https://groups.yahoo.com/neo/groups/albanycorvallisReUseIt/info', 'free items: groups.yahoo.com', 0.00, 0.00);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Large
(15, 48, 5), (15, 49, 5), (15, 50, 5), (15, 51, 5), (15, 52, 5);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(15, 41, 4), (15, 42, 4), (15, 43, 4), (15, 44, 4), (15, 45, 4), (15, 46, 4), (15, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(15, 17, 2), (15, 18, 2), (15, 19, 2), (15, 20, 2), (15, 21, 2), (15, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(15, 106, 9), (15, 107, 9), (15, 108, 9), (15, 109, 9), (15, 110, 9), (15, 111, 9), (15, 112, 9), (15, 113, 9), (15, 114, 9), (15, 115, 9), (15, 116, 9),
(15, 117, 9), (15, 118, 9), (15, 119, 9), (15, 120, 9), (15, 121, 9), (15, 122, 9), (15, 123, 9), (15, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(15, 174, 15), (15, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Building/Home Improvmeent
(15, 53, 6), (15, 54, 6), (15, 55, 6), (15, 56, 6), (15, 57, 6), (15, 58, 6), (15, 59, 6), (15, 60, 6), (15, 61, 6), (15, 62, 6), (15, 63, 6), (15, 64, 6),
(15, 65, 6), (15, 66, 6), (15, 67, 6), (15, 68, 6), (15, 69, 6), (15, 70, 6), (15, 71, 6), (15, 72, 6), (15, 73, 6), (15, 74, 6), (15, 75, 6);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(15, 23, 3), (15, 24, 3), (15, 25, 3), (15, 26, 3), (15, 27, 3), (15, 28, 3), (15, 29, 3), (15, 30, 3), (15, 31, 3), (15, 32, 3), (15, 33, 3), 
(15, 34, 3), (15, 35, 3), (15, 36, 3), (15, 37, 3), (15, 38, 3), (15, 39, 3), (15, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(15, 76, 7), (15, 77, 7), (15, 78, 7), (15, 79, 7), (15, 80, 7), (15, 81, 7), (15, 82, 7), (15, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Computer Paper
(15, 176, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Egg Cartons
(15, 169, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Firewood
(15, 170, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(15, 139, 11), (15, 140, 11), (15, 141, 11), (15, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(15, 125, 10), (15, 126, 10), (15, 127, 10), (15, 128, 10), (15, 129, 10), (15, 130, 10), (15, 131, 10), (15, 132, 10),
(15, 133, 10), (15, 134, 10), (15, 135, 10), (15, 136, 10), (15, 137, 10), (15, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(15, 84, 8), (15, 85, 8), (15, 86, 8), (15, 87, 8), (15, 88, 8), (15, 89, 8), (15, 90, 8), (15, 91, 8), (15, 92, 8), (15, 93, 8), (15, 94, 8), 
(15, 95, 8), (15, 96, 8), (15, 97, 8), (15, 98, 8), (15, 99, 8), (15, 100, 8), (15, 101, 8), (15, 102, 8), (15, 103, 8), (15, 104, 8), (15, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(15, 1, 1), (15, 2, 1), (15, 3, 1), (15,4, 1), (15, 5, 1), (15, 6, 1), (15, 7, 1), (15, 8, 1), (15, 9, 1), (15, 10, 1), 
(15, 11, 1), (15, 12, 1), (15, 13, 1), (15, 14, 1), (15, 15, 1), (15, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(15, 143, 12), (15, 144, 12), (15, 145, 12), (15, 146, 12), (15, 147, 12), (15, 148, 12), (15, 149, 12), (15, 150, 12), 
(15, 151, 12), (15, 152, 12), (15, 153, 12), (15, 154, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(15, 155, 13), (15, 156, 13), (15, 157, 13), (15, 158, 13), (15, 159, 13), (15, 160, 13), (15, 161, 13), 
(15, 163, 13), (15, 164, 13), (15, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(15, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Packing Materials
(15, 166, 14), (15, 167, 14), (15, 168, 14);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(15, 173, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Vehicles
(15, 175, 15);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(16, "Arc Thrift Stores - Corvallis", "928 NW Beca Ave", "Corvallis", "OR", "(541) 754-9011", "http://www.arcbenton.org/","",0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(16, 41, 4), (16, 42, 4), (16, 43, 4), (16, 44, 4), (16, 45, 4), (16, 46, 4), (16, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(16, 16, 2), (16, 18, 2), (16, 19, 2), (16, 20, 2), (16, 21, 2), (16, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(16, 106, 9), (16, 107, 9), (16, 108, 9), (16, 109, 9), (16, 110, 9), (16, 111, 9), (16, 112, 9), (16, 113, 9), (16, 114, 9), (16, 115, 9), (16, 116, 9),
(16, 117, 9), (16, 118, 9), (16, 119, 9), (16, 120, 9), (16, 121, 9), (16, 122, 9), (16, 123, 9), (16, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(16, 174, 15), (16, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Building/Home Improvmeent
(16, 53, 6), (16, 54, 6), (16, 55, 6), (16, 56, 6), (16, 57, 6), (16, 58, 6), (16, 59, 6), (16, 60, 6), (16, 61, 6), (16, 62, 6), (16, 63, 6), (16, 64, 6),
(16, 65, 6), (16, 66, 6), (16, 67, 6), (16, 68, 6), (16, 69, 6), (16, 70, 6), (16, 71, 6), (16, 72, 6), (16, 73, 6), (16, 74, 6), (16, 75, 6);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(16, 23, 3), (16, 24, 3), (16, 25, 3), (16, 26, 3), (16, 27, 3), (16, 28, 3), (16, 29, 3), (16, 30, 3), (16, 31, 3), (16, 32, 3), (16, 33, 3), 
(16, 34, 3), (16, 35, 3), (16, 36, 3), (16, 37, 3), (16, 38, 3), (16, 39, 3), (16, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(16, 76, 7), (16, 77, 7), (16, 78, 7), (16, 79, 7), (16, 80, 7), (16, 81, 7), (16, 82, 7), (16, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(16, 125, 10), (16, 126, 10), (16, 127, 10), (16, 128, 10), (16, 129, 10), (16, 130, 10), (16, 131, 10), (16, 132, 10),
(16, 133, 10), (16, 134, 10), (16, 135, 10), (16, 136, 10), (16, 137, 10), (16, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(16, 84, 8), (16, 85, 8), (16, 86, 8), (16, 87, 8), (16, 88, 8), (16, 89, 8), (16, 90, 8), (16, 91, 8), (16, 92, 8), (16, 93, 8), (16, 94, 8), 
(16, 95, 8), (16, 96, 8), (16, 97, 8), (16, 98, 8), (16, 99, 8), (16, 100, 8), (16, 101, 8), (16, 102, 8), (16, 103, 8), (16, 104, 8), (16, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(16, 1, 1), (16, 2, 1), (16, 3, 1), (16,4, 1), (16, 5, 1), (16, 6, 1), (16, 7, 1), (16, 8, 1), (16, 9, 1), (16, 10, 1), 
(16, 11, 1), (16, 12, 1), (16, 13, 1), (16, 14, 1), (16, 15, 1), (16, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(16, 155, 13), (16, 156, 13), (16, 157, 13), (16, 158, 13), (16, 159, 13), (16, 160, 13), (16, 161, 13), 
(16, 163, 13), (16, 164, 13), (16, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(16, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(16, 173, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Vehicles
(16, 175, 15);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(17, "Arc Thrift Stores - Philomath", "936 Main St","Philomath", "OR","(541) 929-3946","http://www.arcbenton.org/","",0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(17, 41, 4), (17, 42, 4), (17, 43, 4), (17, 44, 4), (17, 45, 4), (17, 46, 4), (17, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(17, 17, 2), (17, 18, 2), (17, 19, 2), (17, 20, 2), (17, 21, 2), (17, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(17, 106, 9), (17, 107, 9), (17, 108, 9), (17, 109, 9), (17, 110, 9), (17, 111, 9), (17, 112, 9), (17, 113, 9), (17, 114, 9), (17, 115, 9), (17, 116, 9),
(17, 117, 9), (17, 118, 9), (17, 119, 9), (17, 120, 9), (17, 121, 9), (17, 122, 9), (17, 123, 9), (17, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(17, 174, 15), (17, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Building/Home Improvmeent
(17, 53, 6), (17, 54, 6), (17, 55, 6), (17, 56, 6), (17, 57, 6), (17, 58, 6), (17, 59, 6), (17, 60, 6), (17, 61, 6), (17, 62, 6), (17, 63, 6), (17, 64, 6),
(17, 65, 6), (17, 66, 6), (17, 67, 6), (17, 68, 6), (17, 69, 6), (17, 70, 6), (17, 71, 6), (17, 72, 6), (17, 73, 6), (17, 74, 6), (17, 75, 6);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(17, 23, 3), (17, 24, 3), (17, 25, 3), (17, 26, 3), (17, 27, 3), (17, 28, 3), (17, 29, 3), (17, 30, 3), (17, 31, 3), (17, 32, 3), (17, 33, 3), 
(17, 34, 3), (17, 35, 3), (17, 36, 3), (17, 37, 3), (17, 38, 3), (17, 39, 3), (17, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(17, 76, 7), (17, 77, 7), (17, 78, 7), (17, 79, 7), (17, 80, 7), (17, 81, 7), (17, 82, 7), (17, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(17, 125, 10), (17, 126, 10), (17, 127, 10), (17, 128, 10), (17, 129, 10), (17, 130, 10), (17, 131, 10), (17, 132, 10),
(17, 133, 10), (17, 134, 10), (17, 135, 10), (17, 136, 10), (17, 137, 10), (17, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(17, 84, 8), (17, 85, 8), (17, 86, 8), (17, 87, 8), (17, 88, 8), (17, 89, 8), (17, 90, 8), (17, 91, 8), (17, 92, 8), (17, 93, 8), (17, 94, 8), 
(17, 95, 8), (17, 96, 8), (17, 97, 8), (17, 98, 8), (17, 99, 8), (17, 100, 8), (17, 101, 8), (17, 102, 8), (17, 103, 8), (17, 104, 8), (17, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(17, 1, 1), (17, 2, 1), (17, 3, 1), (17,4, 1), (17, 5, 1), (17, 6, 1), (17, 7, 1), (17, 8, 1), (17, 9, 1), (17, 10, 1), 
(17, 11, 1), (17, 12, 1), (17, 13, 1), (17, 14, 1), (17, 17, 1), (17, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(17, 155, 13), (17, 156, 13), (17, 157, 13), (17, 158, 13), (17, 159, 13), (17, 160, 13), (17, 161, 13), 
(17, 163, 13), (17, 164, 13), (17, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(17, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(17, 173, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Vehicles
(17, 175, 15);

insert into business(business_id, name, address, city, state, telephone, website, notes, latitude, longitude) values 
(18, "Beekman Place Antique Mall", "601 SW Western Blvd", "Corvallis", "OR","(541) 753-8250","https://www.antiquemalls.com/or/corvallis/97333/16882","",0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(18, 1, 1), (18, 2, 1), (18, 3, 1), (18,4, 1), (18, 5, 1), (18, 6, 1), (18, 7, 1), (18, 8, 1), (18, 9, 1), (18, 10, 1), 
(18, 11, 1), (18, 12, 1), (18, 13, 1), (18, 14, 1), (18, 17, 1), (18, 16, 1);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(19, "Benton County Extension/4-H Activities", "1849 NW 9th","http://extension.oregonstate.edu/benton/","Corvallis","(541) 766-6750", "OR", "", 0.00, 0.00);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Art Supplies
(19, 1, 1), (19, 23, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Fabric
(19, 9, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- School supplies
(19, 38, 3);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(20, "Benton County Master Gardeners","1849 NW 9th St","http://extension.oregonstate.edu/benton/horticulture/mg","Corvallis","(541) 766-6750","OR","", 0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values -- Books
(20, 3, 1), (20, 27, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(20, 125, 10), (20, 126, 10), (20, 127, 10), (20, 128, 10), (20, 129, 10), (20, 130, 10), (20, 131, 10), (20, 132, 10),
(20, 133, 10), (20, 134, 10), (20, 135, 10), (20, 136, 10), (20, 137, 10), (20, 138, 10);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(21, "Book Bin", "215 SW 4th St","http://bookbin.com/","Corvallis","(541) 752-0040","OR", "", 0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values -- Books
(21, 3, 1), (21, 27, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(21, 88, 8);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(22, "Browser's Bookstore","121 NW 4th St","http://www.browsersbookstore.com/","Corvallis","(888) 758-1121","OR","", 0.00,0.00);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(23, "Boys & Girls Club/STARS","1112 NW Circle Blvd","http://www.bgccorvallis.org/","Corvallis","(541) 757-1909","OR","after school programs", 0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Art Supplies
(23, 1, 1), (23, 23, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(23, 174, 15), (23, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(23, 88, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Computer Paper
(23, 176, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Egg Cartons
(23, 169, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Fabric
(23, 9, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(23, 125, 10), (23, 126, 10), (23, 127, 10), (23, 128, 10), (23, 129, 10), (23, 130, 10), (23, 131, 10), (23, 132, 10),
(23, 133, 10), (23, 134, 10), (23, 135, 10), (23, 136, 10), (23, 137, 10), (23, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(23, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- School supplies
(23, 38, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Toiletries
(23, 15, 1);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(24, "Buckingham Palace", "600 SW 3rd St","","Corvallis","(541) 752-7980","OR", "Fri-Sun only", 0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Art Supplies
(24, 1, 1), (24, 23, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(24, 106, 9), (24, 107, 9), (24, 108, 9), (24, 109, 9), (24, 110, 9), (24, 111, 9), (24, 112, 9), (24, 113, 9), (24, 114, 9), (24, 115, 9), (24, 116, 9),
(24, 117, 9), (24, 118, 9), (24, 119, 9), (24, 120, 9), (24, 121, 9), (24, 122, 9), (24, 123, 9), (24, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Books
(24, 3, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(24, 174, 15), (24, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(24, 88, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Fabric
(24, 9, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Furniture
(24, 11, 1);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(25, "Calvary Community Outreach","2125 NW Lester Ave","http://www.communityoutreachinc.org/","Corvallis","(541) 760-5941","OR", "", 0.00,0.00);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(26, "CARDV - Center Against Rape/Domestic Violence","4786 SW Philomath Blvd","http://cardv.org/","Corvallis","(541) 758-0219","OR","", 0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(26, 41, 4), (26, 42, 4), (26, 43, 4), (26, 44, 4), (26, 45, 4), (26, 46, 4), (26, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(26, 1, 1), (26, 2, 1), (26, 3, 1), (26,4, 1), (26, 5, 1), (26, 6, 1), (26, 7, 1), (26, 8, 1), (26, 9, 1), (26, 10, 1), 
(26, 11, 1), (26, 12, 1), (26, 13, 1), (26, 14, 1), (26, 17, 1), (26, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(26, 84, 8), (26, 85, 8), (26, 86, 8), (26, 87, 8), (26, 88, 8), (26, 89, 8), (26, 90, 8), (26, 91, 8), (26, 92, 8), (26, 93, 8), (26, 94, 8), 
(26, 95, 8), (26, 96, 8), (26, 97, 8), (26, 98, 8), (26, 99, 8), (26, 100, 8), (26, 101, 8), (26, 102, 8), (26, 103, 8), (26, 104, 8), (26, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(26, 139, 11), (26, 140, 11), (26, 141, 11), (26, 142, 11);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(27, "Career Closet for Women","942 NW 9th, Ste.A","https://sicorvallis.wordpress.com/","Corvallis","(541) 754-6979","OR", "drop-off at", 0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(27, 76, 7), (27, 77, 7), (27, 78, 7), (27, 79, 7), (27, 80, 7), (27, 81, 7), (27, 82, 7), (27, 83, 7);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(28, "Cat's Meow Humane Society Thrift Shop","411 SW 3rd St","http://www.heartlandhumane.org/","Corvallis","(541) 757-0573","OR", "", 0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(28, 41, 4), (28, 42, 4), (28, 43, 4), (28, 44, 4), (28, 45, 4), (28, 46, 4), (28, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(28, 17, 2), (28, 18, 2), (28, 19, 2), (28, 20, 2), (28, 21, 2), (28, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(28, 106, 9), (28, 107, 9), (28, 108, 9), (28, 109, 9), (28, 110, 9), (28, 111, 9), (28, 112, 9), (28, 113, 9), (28, 114, 9), (28, 115, 9), (28, 116, 9),
(28, 117, 9), (28, 118, 9), (28, 119, 9), (28, 120, 9), (28, 121, 9), (28, 122, 9), (28, 123, 9), (28, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(28, 174, 15), (28, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(28, 23, 3), (28, 24, 3), (28, 25, 3), (28, 26, 3), (28, 27, 3), (28, 28, 3), (28, 29, 3), (28, 30, 3), (28, 31, 3), (28, 32, 3), (28, 33, 3), 
(28, 34, 3), (28, 35, 3), (28, 36, 3), (28, 37, 3), (28, 38, 3), (28, 39, 3), (28, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(28, 76, 7), (28, 77, 7), (28, 78, 7), (28, 79, 7), (28, 80, 7), (28, 81, 7), (28, 82, 7), (28, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(28, 125, 10), (28, 126, 10), (28, 127, 10), (28, 128, 10), (28, 129, 10), (28, 130, 10), (28, 131, 10), (28, 132, 10),
(28, 133, 10), (28, 134, 10), (28, 135, 10), (28, 136, 10), (28, 137, 10), (28, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(28, 84, 8), (28, 85, 8), (28, 86, 8), (28, 87, 8), (28, 88, 8), (28, 89, 8), (28, 90, 8), (28, 91, 8), (28, 92, 8), (28, 93, 8), (28, 94, 8), 
(28, 95, 8), (28, 96, 8), (28, 97, 8), (28, 98, 8), (28, 99, 8), (28, 100, 8), (28, 101, 8), (28, 102, 8), (28, 103, 8), (28, 104, 8), (28, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(28, 1, 1), (28, 2, 1), (28, 3, 1), (28,4, 1), (28, 5, 1), (28, 6, 1), (28, 7, 1), (28, 8, 1), (28, 9, 1), (28, 10, 1), 
(28, 11, 1), (28, 12, 1), (28, 13, 1), (28, 14, 1), (28, 15, 1), (28, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(28, 143, 12), (28, 144, 12), (28, 145, 12), (28, 146, 12), (28, 147, 12), (28, 148, 12), (28, 149, 12), (28, 150, 12), 
(28, 151, 12), (28, 152, 12), (28, 153, 12), (28, 154, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(28, 155, 13), (28, 156, 13), (28, 157, 13), (28, 158, 13), (28, 159, 13), (28, 160, 13), (28, 161, 13), 
(28, 163, 13), (28, 164, 13), (28, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(28, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(28, 173, 15);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(29, "Children's Farm Home","4455 NE Hwy 20","http://www.trilliumfamily.org/","Corvallis","(541) 757-1852","OR", "", 0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(29, 84, 8), (29, 85, 8), (29, 86, 8), (29, 87, 8), (29, 88, 8), (29, 89, 8), (29, 90, 8), (29, 91, 8), (29, 92, 8), (29, 93, 8), (29, 94, 8), 
(29, 95, 8), (29, 96, 8), (29, 97, 8), (29, 98, 8), (29, 99, 8), (29, 100, 8), (29, 101, 8), (29, 102, 8), (29, 103, 8), (29, 104, 8), (29, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(29, 23, 3), (29, 24, 3), (29, 25, 3), (29, 26, 3), (29, 27, 3), (29, 28, 3), (29, 29, 3), (29, 30, 3), (29, 31, 3), (29, 32, 3), (29, 33, 3), 
(29, 34, 3), (29, 35, 3), (29, 36, 3), (29, 37, 3), (29, 38, 3), (29, 39, 3), (29, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(29, 41, 4), (29, 42, 4), (29, 43, 4), (29, 44, 4), (29, 45, 4), (29, 46, 4), (29, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Art Supplies
(29, 1, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(29, 106, 9), (29, 107, 9), (29, 108, 9), (29, 109, 9), (29, 110, 9), (29, 111, 9), (29, 112, 9), (29, 113, 9), (29, 114, 9), (29, 115, 9), (29, 116, 9),
(29, 117, 9), (29, 118, 9), (29, 119, 9), (29, 120, 9), (29, 121, 9), (29, 122, 9), (29, 123, 9), (29, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(29, 76, 7), (29, 77, 7), (29, 78, 7), (29, 79, 7), (29, 80, 7), (29, 81, 7), (29, 82, 7), (29, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Furniture
(29, 11, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(29, 125, 10), (29, 126, 10), (29, 127, 10), (29, 128, 10), (29, 129, 10), (29, 130, 10), (29, 131, 10), (29, 132, 10),
(29, 133, 10), (29, 134, 10), (29, 135, 10), (29, 136, 10), (29, 137, 10), (29, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(29, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Toiletries
(29, 15, 1);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(30, "Chintimini Wildlife Rehabilitation Ctr","311 Lewisburg Rd","http://www.chintiminiwildlife.org/","Corvallis","(541) 745-5324","OR", "", 0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(30, 17, 2), (30, 18, 2), (30, 19, 2), (30, 20, 2), (30, 21, 2), (30, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Building/Home Improvmeent
(30, 53, 6), (30, 54, 6), (30, 55, 6), (30, 56, 6), (30, 57, 6), (30, 58, 6), (30, 59, 6), (30, 60, 6), (30, 61, 6), (30, 62, 6), (30, 63, 6), (30, 64, 6),
(30, 65, 6), (30, 66, 6), (30, 67, 6), (30, 68, 6), (30, 69, 6), (30, 70, 6), (30, 71, 6), (30, 72, 6), (30, 73, 6), (30, 74, 6), (30, 75, 6);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(30, 140, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(30, 125, 10), (30, 126, 10), (30, 127, 10), (30, 128, 10), (30, 129, 10), (30, 130, 10), (30, 131, 10), (30, 132, 10),
(30, 133, 10), (30, 134, 10), (30, 135, 10), (30, 136, 10), (30, 137, 10), (30, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(30, 143, 12), (30, 144, 12), (30, 145, 12), (30, 146, 12), (30, 147, 12), (30, 148, 12), (30, 149, 12), (30, 150, 12), 
(30, 151, 12), (30, 152, 12), (30, 153, 12), (30, 154, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(30, 173, 15);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(31, "Community Outreach","865 NW Reiman","http://www.communityoutreachinc.org/services/emergency-shelter-program/family-shelter/","Corvallis","(541) 758-3000","OR","homeless shelter", 0.00,0.00);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Art Supplies
(31, 1, 1), (31, 23, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(31, 17, 2), (31, 18, 2), (31, 19, 2), (31, 20, 2), (31, 21, 2), (31, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(31, 139, 11), (31, 140, 11), (31, 141, 11), (31, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- School supplies
(31, 38, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Toiletries
(31, 15, 1);

insert into business(business_id, name, address, website, city, telephone, state, notes, latitude, longitude) values 
(32, "Corvallis Environmental Center","214 SW Monroe Ave","http://www.corvallisenvironmentalcenter.org/","Corvallis","(541) 753-9211","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values  -- Art Supplies
(32, 1, 1), (32, 23, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Computer Paper
(32, 176, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden Pots
(32, 127, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(32, 155, 13), (32, 156, 13), (32, 157, 13), (32, 158, 13), (32, 159, 13), (32, 160, 13), (32, 161, 13), 
(32, 163, 13), (32, 164, 13), (32, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- School supplies
(32, 38, 3);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(33, "Corvallis Bicycle Collective","33900 SE Roche Ln/Hwy 34","http://corvallisbikes.org/","Corvallis","(541)224-6885","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(33, 106, 9), (33, 107, 9), (33, 108, 9), (33, 109, 9), (33, 110, 9), (33, 111, 9), (33, 112, 9), (33, 113, 9), (33, 114, 9), (33, 115, 9), (33, 116, 9),
(33, 117, 9), (33, 118, 9), (33, 119, 9), (33, 120, 9), (33, 121, 9), (33, 122, 9), (33, 123, 9), (33, 124, 9);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(34, "Corvallis Furniture","720 NE Granger Ave, Bldg J","http://corvallisfurniture.com/","Corvallis","(541)231-8103","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(34, 106, 9), (34, 107, 9), (34, 108, 9), (34, 109, 9), (34, 110, 9), (34, 111, 9), (34, 112, 9), (34, 113, 9), (34, 114, 9), (34, 115, 9), (34, 116, 9),
(34, 117, 9), (34, 118, 9), (34, 119, 9), (34, 120, 9), (34, 121, 9), (34, 122, 9), (34, 123, 9), (34, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Furniture
(34, 11, 1);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(35, "Corvallis-Uzhhorod Sister Cities/The TOUCH Project","","http://www.sistercities.corvallis.or.us/uzhhorod","Corvallis","(541) 753-5170","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(35, 143, 12), (35, 144, 12), (35, 145, 12), (35, 146, 12), (35, 147, 12), (35, 148, 12), (35, 149, 12), (35, 150, 12), 
(35, 151, 12), (35, 152, 12), (35, 153, 12), (35, 154, 12);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(36, "Cosmic Chameleon","138 SW 2nd St","","Corvallis","(541) 752-9001","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(36, 174, 15), (36, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(36, 23, 3), (36, 24, 3), (36, 25, 3), (36, 26, 3), (36, 27, 3), (36, 28, 3), (36, 29, 3), (36, 30, 3), (36, 31, 3), (36, 32, 3), (36, 33, 3), 
(36, 34, 3), (36, 35, 3), (36, 36, 3), (36, 37, 3), (36, 38, 3), (36, 39, 3), (36, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(36, 76, 7), (36, 77, 7), (36, 78, 7), (36, 79, 7), (36, 80, 7), (36, 81, 7), (36, 82, 7), (36, 83, 7);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(37, "Craigslist","","https://corvallis.craigslist.org/","Corvallis","","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Large
(37, 48, 5), (37, 49, 5), (37, 50, 5), (37, 51, 5), (37, 52, 5);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(37, 41, 4), (37, 42, 4), (37, 43, 4), (37, 44, 4), (37, 45, 4), (37, 46, 4), (37, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(37, 17, 2), (37, 18, 2), (37, 19, 2), (37, 20, 2), (37, 21, 2), (37, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sporting Equipment
(37, 106, 9), (37, 107, 9), (37, 108, 9), (37, 109, 9), (37, 110, 9), (37, 111, 9), (37, 112, 9), (37, 113, 9), (37, 114, 9), (37, 115, 9), (37, 116, 9),
(37, 117, 9), (37, 118, 9), (37, 119, 9), (37, 120, 9), (37, 121, 9), (37, 122, 9), (37, 123, 9), (37, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Brown paper/bags
(37, 174, 15), (37, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Building/Home Improvement
(37, 53, 6), (37, 54, 6), (37, 55, 6), (37, 56, 6), (37, 57, 6), (37, 58, 6), (37, 59, 6), (37, 60, 6), (37, 61, 6), (37, 62, 6), (37, 63, 6), (37, 64, 6),
(37, 65, 6), (37, 66, 6), (37, 67, 6), (37, 68, 6), (37, 69, 6), (37, 70, 6), (37, 71, 6), (37, 72, 6), (37, 73, 6), (37, 74, 6), (37, 75, 6);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's goods
(37, 23, 3), (37, 24, 3), (37, 25, 3), (37, 26, 3), (37, 27, 3), (37, 28, 3), (37, 29, 3), (37, 30, 3), (37, 31, 3), (37, 32, 3), (37, 33, 3), 
(37, 34, 3), (37, 35, 3), (37, 36, 3), (37, 37, 3), (37, 38, 3), (37, 39, 3), (37, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Wearable Items
(37, 76, 7), (37, 77, 7), (37, 78, 7), (37, 79, 7), (37, 80, 7), (37, 81, 7), (37, 82, 7), (37, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Computer paper
(37, 176, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Egg cartons
(37, 169, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Firewood
(37, 170, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(37, 139, 11), (37, 140, 11), (37, 141, 11), (37, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(37, 125, 10), (37, 126, 10), (37, 127, 10), (37, 128, 10), (37, 129, 10), (37, 130, 10), (37, 131, 10), (37, 132, 10),
(37, 133, 10), (37, 134, 10), (37, 135, 10), (37, 136, 10), (37, 137, 10), (37, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(37, 84, 8), (37, 85, 8), (37, 86, 8), (37, 87, 8), (37, 88, 8), (37, 89, 8), (37, 90, 8), (37, 91, 8), (37, 92, 8), (37, 93, 8), (37, 94, 8), 
(37, 95, 8), (37, 96, 8), (37, 97, 8), (37, 98, 8), (37, 99, 8), (37, 100, 8), (37, 101, 8), (37, 102, 8), (37, 103, 8), (37, 104, 8), (37, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(37, 1, 1), (37, 2, 1), (37, 3, 1), (37,4, 1), (37, 5, 1), (37, 6, 1), (37, 7, 1), (37, 8, 1), (37, 9, 1), (37, 10, 1), 
(37, 11, 1), (37, 12, 1), (37, 13, 1), (37, 14, 1), (37, 37, 1), (37, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(37, 143, 12), (37, 144, 12), (37, 145, 12), (37, 146, 12), (37, 147, 12), (37, 148, 12), (37, 149, 12), (37, 150, 12), 
(37, 151, 12), (37, 152, 12), (37, 153, 12), (37, 154, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(37, 155, 13), (37, 156, 13), (37, 157, 13), (37, 158, 13), (37, 159, 13), (37, 160, 13), (37, 161, 13),
(37, 163, 13), (37, 164, 13), (37, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(37, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Packing Material
(37, 166, 14), (37, 167, 14), (37, 168, 14);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(37, 173, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Vehicle Parts
(37, 175, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(38, "First Alternative Co-op Recycling Center","1007 SE 3rd St","http://firstalt.coop/","Corvallis","(541) 753-3115","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Large
(38, 48, 5), (38, 49, 5), (38, 50, 5), (38, 51, 5), (38, 52, 5);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(38, 41, 4), (38, 42, 4), (38, 43, 4), (38, 44, 4), (38, 45, 4), (38, 46, 4), (38, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden Pots
(38, 127, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Packing Materials
(38, 166, 14), (38, 167, 14), (38, 168, 14);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(39, "First Alternative Co-op Store (South Store)","1007 SE 3rd St","http://firstalt.coop/","Corvallis","(541) 753-3115","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(39, 174, 15), (39, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Egg Cartons
(39, 169, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Eyeglasses
(39, 147, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(39, 139, 11), (39, 141, 11), (39, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food containers
(39, 10, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Printer refill
(39, 162, 13);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(40, "First Alternative Co-op Store (North Store)","2855 NW Grant Ave","http://firstalt.coop/","Corvallis","(541) 452-3115","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(40, 174, 15), (40, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Egg Cartons
(40, 169, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Eyeglasses
(40, 147, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(40, 139, 11), (40, 141, 11), (40, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food containers
(40, 10, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Printer refill
(40, 162, 13);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(41, "Furniture Exchange","210 NW 2nd St","http://www.furnitureexchange-usa.com/","Corvallis","(541) 833-0183","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(41, 1, 1), (41, 2, 1), (41, 3, 1), (41,4, 1), (41, 5, 1), (41, 6, 1), (41, 7, 1), (41, 8, 1), (41, 9, 1), (41, 10, 1), 
(41, 11, 1), (41, 12, 1), (41, 13, 1), (41, 14, 1), (41, 15, 1), (41, 16, 1);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(42, "Furniture Share","155 SE Lilly Ave","http://furnitureshare.org/","Corvallis","(541) 754-9511","OR",0.00,0.00,"formerly Benton FS");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Large
(42, 48, 5), (42, 49, 5), (42, 50, 5), (42, 51, 5), (42, 52, 5);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(42, 41, 4), (42, 42, 4), (42, 43, 4), (42, 44, 4), (42, 45, 4), (42, 46, 4), (42, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(42, 17, 2), (42, 18, 2), (42, 19, 2), (42, 20, 2), (42, 21, 2), (42, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(42, 84, 8), (42, 85, 8), (42, 86, 8), (42, 87, 8), (42, 88, 8), (42, 89, 8), (42, 90, 8), (42, 91, 8), (42, 92, 8), (42, 93, 8), (42, 94, 8), 
(42, 95, 8), (42, 96, 8), (42, 97, 8), (42, 98, 8), (42, 99, 8), (42, 100, 8), (42, 101, 8), (42, 102, 8), (42, 103, 8), (42, 104, 8), (42, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(42, 1, 1), (42, 2, 1), (42, 3, 1), (42,4, 1), (42, 5, 1), (42, 6, 1), (42, 7, 1), (42, 8, 1), (42, 9, 1), (42, 10, 1), 
(42, 11, 1), (42, 12, 1), (42, 13, 1), (42, 14, 1), (42, 15, 1), (42, 16, 1);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(43, "Home Grown Gardens","4845 SE 3rd St","http://homegrowngardens77.vpweb.com/","Corvallis","(541) 758-2137","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden pots
(43, 127, 10);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(44, "Garland Nursery","5470 NE Hwy 20","http://www.garlandnursery.com/","Corvallis","(541) 753-6601","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden pots
(44, 127, 10);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(45, "Goodwill Industries","1325 NW 9th St","http://www.goodwill.org/locator/","Corvallis","(541) 752-8278","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Large
(45, 48, 5), (45, 49, 5), (45, 50, 5), (45, 51, 5), (45, 52, 5);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(45, 41, 4), (45, 42, 4), (45, 43, 4), (45, 44, 4), (45, 45, 4), (45, 46, 4), (45, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(45, 17, 2), (45, 18, 2), (45, 19, 2), (45, 20, 2), (45, 21, 2), (45, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(45, 106, 9), (45, 107, 9), (45, 108, 9), (45, 109, 9), (45, 110, 9), (45, 111, 9), (45, 112, 9), (45, 113, 9), (45, 114, 9), (45, 115, 9), (45, 116, 9),
(45, 117, 9), (45, 118, 9), (45, 119, 9), (45, 120, 9), (45, 121, 9), (45, 122, 9), (45, 123, 9), (45, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Building/Home Improvmeent
(45, 53, 6), (45, 54, 6), (45, 55, 6), (45, 56, 6), (45, 57, 6), (45, 58, 6), (45, 59, 6), (45, 60, 6), (45, 61, 6), (45, 62, 6), (45, 63, 6), (45, 64, 6),
(45, 65, 6), (45, 66, 6), (45, 67, 6), (45, 68, 6), (45, 69, 6), (45, 70, 6), (45, 71, 6), (45, 72, 6), (45, 73, 6), (45, 74, 6), (45, 75, 6);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(45, 23, 3), (45, 24, 3), (45, 25, 3), (45, 26, 3), (45, 27, 3), (45, 28, 3), (45, 29, 3), (45, 30, 3), (45, 31, 3), (45, 32, 3), (45, 33, 3), 
(45, 34, 3), (45, 35, 3), (45, 36, 3), (45, 37, 3), (45, 38, 3), (45, 39, 3), (45, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(45, 76, 7), (45, 77, 7), (45, 78, 7), (45, 79, 7), (45, 80, 7), (45, 81, 7), (45, 82, 7), (45, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(45, 125, 10), (45, 126, 10), (45, 127, 10), (45, 128, 10), (45, 129, 10), (45, 130, 10), (45, 131, 10), (45, 132, 10),
(45, 133, 10), (45, 134, 10), (45, 135, 10), (45, 136, 10), (45, 137, 10), (45, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(45, 84, 8), (45, 85, 8), (45, 86, 8), (45, 87, 8), (45, 88, 8), (45, 89, 8), (45, 90, 8), (45, 91, 8), (45, 92, 8), (45, 93, 8), (45, 94, 8), 
(45, 95, 8), (45, 96, 8), (45, 97, 8), (45, 98, 8), (45, 99, 8), (45, 100, 8), (45, 101, 8), (45, 102, 8), (45, 103, 8), (45, 104, 8), (45, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(45, 1, 1), (45, 2, 1), (45, 3, 1), (45,4, 1), (45, 5, 1), (45, 6, 1), (45, 7, 1), (45, 8, 1), (45, 9, 1), (45, 10, 1), 
(45, 11, 1), (45, 12, 1), (45, 13, 1), (45, 14, 1), (45, 15, 1), (45, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(45, 143, 12), (45, 144, 12), (45, 145, 12), (45, 146, 12), (45, 147, 12), (45, 148, 12), (45, 149, 12), (45, 150, 12), 
(45, 151, 12), (45, 152, 12), (45, 153, 12), (45, 154, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(45, 155, 13), (45, 156, 13), (45, 157, 13), (45, 158, 13), (45, 159, 13), (45, 160, 13), (45, 161, 13), 
(45, 163, 13), (45, 164, 13), (45, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(45, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(45, 173, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Vehicles
(45, 175, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(46, "Habitat for Humanity ReStore","4840 SW Philomath Blvd","http://bentonhabitat.org/","Corvallis","(541) 752-6637","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Large
(46, 48, 5), (46, 49, 5), (46, 50, 5), (46, 51, 5), (46, 52, 5);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(46, 41, 4), (46, 42, 4), (46, 43, 4), (46, 44, 4), (46, 45, 4), (46, 46, 4), (46, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(46, 106, 9), (46, 107, 9), (46, 108, 9), (46, 109, 9), (46, 110, 9), (46, 111, 9), (46, 112, 9), (46, 113, 9), (46, 114, 9), (46, 115, 9), (46, 116, 9),
(46, 117, 9), (46, 118, 9), (46, 119, 9), (46, 120, 9), (46, 121, 9), (46, 122, 9), (46, 123, 9), (46, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(46, 174, 15), (46, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Building/Home Improvmeent
(46, 53, 6), (46, 54, 6), (46, 55, 6), (46, 56, 6), (46, 57, 6), (46, 58, 6), (46, 59, 6), (46, 60, 6), (46, 61, 6), (46, 62, 6), (46, 63, 6), (46, 64, 6),
(46, 65, 6), (46, 66, 6), (46, 67, 6), (46, 68, 6), (46, 69, 6), (46, 70, 6), (46, 71, 6), (46, 72, 6), (46, 73, 6), (46, 74, 6), (46, 75, 6);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Art Supplies
(46, 23, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Firewood
(46, 170, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(46, 125, 10), (46, 126, 10), (46, 127, 10), (46, 128, 10), (46, 129, 10), (46, 130, 10), (46, 131, 10), (46, 132, 10),
(46, 133, 10), (46, 134, 10), (46, 135, 10), (46, 136, 10), (46, 137, 10), (46, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(46, 84, 8), (46, 85, 8), (46, 86, 8), (46, 87, 8), (46, 88, 8), (46, 89, 8), (46, 90, 8), (46, 91, 8), (46, 92, 8), (46, 93, 8), (46, 94, 8), 
(46, 95, 8), (46, 96, 8), (46, 97, 8), (46, 98, 8), (46, 99, 8), (46, 100, 8), (46, 101, 8), (46, 102, 8), (46, 103, 8), (46, 104, 8), (46, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(46, 1, 1), (46, 2, 1), (46, 3, 1), (46,4, 1), (46, 5, 1), (46, 6, 1), (46, 7, 1), (46, 8, 1), (46, 9, 1), (46, 10, 1), 
(46, 11, 1), (46, 12, 1), (46, 13, 1), (46, 14, 1), (46, 15, 1), (46, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(46, 143, 12), (46, 144, 12), (46, 145, 12), (46, 146, 12), (46, 147, 12), (46, 148, 12), (46, 149, 12), (46, 150, 12), 
(46, 151, 12), (46, 152, 12), (46, 153, 12), (46, 154, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(46, 155, 13), (46, 156, 13), (46, 157, 13), (46, 158, 13), (46, 159, 13), (46, 160, 13), (46, 161, 13), 
(46, 163, 13), (46, 164, 13), (46, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(46, 179, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(47, "Happy Trails Records, Tapes & CDs","100 SW 3rd St","http://www.corvallisbusiness.com/happytrails.html","Corvallis","(541) 752-9032","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(47, 88, 8);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(48, "Heartland Humane Society","398 SW Twin Oaks Cir","http://www.heartlandhumane.org/","Corvallis","(541) 757-9000","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(48, 17, 2), (48, 18, 2), (48, 19, 2), (48, 20, 2), (48, 21, 2), (48, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(48, 173, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(49, "Home Life Inc.", "2068 NW Fillmore","http://homelifeinc.org/","Corvallis","(541) 753-9015","OR",0.00,0.00,"for developmentally disabled");
insert into reuse_bus(bid, subcatID, reuseID) values -- Art Supplies
(49, 23, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(49, 17, 2), (49, 18, 2), (49, 19, 2), (49, 20, 2), (49, 21, 2), (49, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(49, 84, 8), (49, 85, 8), (49, 86, 8), (49, 87, 8), (49, 88, 8), (49, 89, 8), (49, 90, 8), (49, 91, 8), (49, 92, 8), (49, 93, 8), (49, 94, 8), 
(49, 95, 8), (49, 96, 8), (49, 97, 8), (49, 98, 8), (49, 99, 8), (49, 100, 8), (49, 101, 8), (49, 102, 8), (49, 103, 8), (49, 104, 8), (49, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(49, 1, 1), (49, 2, 1), (49, 3, 1), (49,4, 1), (49, 5, 1), (49, 6, 1), (49, 7, 1), (49, 8, 1), (49, 9, 1), (49, 10, 1), 
(49, 11, 1), (49, 12, 1), (49, 13, 1), (49, 14, 1), (49, 15, 1), (49, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(49, 76, 7), (49, 77, 7), (49, 78, 7), (49, 79, 7), (49, 80, 7), (49, 81, 7), (49, 82, 7), (49, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(49, 125, 10), (49, 126, 10), (49, 127, 10), (49, 128, 10), (49, 129, 10), (49, 130, 10), (49, 131, 10), (49, 132, 10),
(49, 133, 10), (49, 134, 10), (49, 135, 10), (49, 136, 10), (49, 137, 10), (49, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(49, 155, 13), (49, 156, 13), (49, 157, 13), (49, 158, 13), (49, 159, 13), (49, 160, 13), (49, 161, 13), 
(49, 163, 13), (49, 164, 13), (49, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(49, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Vehicle parts
(49, 175, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(50, "Jackson Street Youth Shelter","555 NW Jackson St","http://www.jsysi.org/","Corvallis", "(541) 754-2404" ,"OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Art Supplies
(50, 23, 3), (50, 1, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(50, 17, 2), (50, 18, 2), (50, 19, 2), (50, 20, 2), (50, 21, 2), (50, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(50, 106, 9), (50, 107, 9), (50, 108, 9), (50, 109, 9), (50, 110, 9), (50, 111, 9), (50, 112, 9), (50, 113, 9), (50, 114, 9), (50, 115, 9), (50, 116, 9),
(50, 117, 9), (50, 118, 9), (50, 119, 9), (50, 120, 9), (50, 121, 9), (50, 122, 9), (50, 123, 9), (50, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Building/Home Improvmeent
(50, 53, 6), (50, 54, 6), (50, 55, 6), (50, 56, 6), (50, 57, 6), (50, 58, 6), (50, 59, 6), (50, 60, 6), (50, 61, 6), (50, 62, 6), (50, 63, 6), (50, 64, 6),
(50, 65, 6), (50, 66, 6), (50, 67, 6), (50, 68, 6), (50, 69, 6), (50, 70, 6), (50, 71, 6), (50, 72, 6), (50, 73, 6), (50, 74, 6), (50, 75, 6);
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(50, 88, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(50, 140, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(50, 125, 10), (50, 126, 10), (50, 127, 10), (50, 128, 10), (50, 129, 10), (50, 130, 10), (50, 131, 10), (50, 132, 10),
(50, 133, 10), (50, 134, 10), (50, 135, 10), (50, 136, 10), (50, 137, 10), (50, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(50, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- School Supplies
(50, 38, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Toiletries
(50, 15, 1);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(51, "Linn Benton Food Share","545 SW 2nd","http://communityservices.us/nutrition/detail/category/linn-benton-food-share/","Corvallis","(541) 752-1010","OR",0.00,0.00,"large food donations");
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(51, 139, 11), (51, 141, 11), (51, 142, 11);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(52, "Lions Club","1400 NW 9th St","http://www.e-clubhouse.org/sites/midvalley/","Corvallis","(541) 758-0222","OR",0.00,0.00,"box inside Elks Lodge");
insert into reuse_bus(bid, subcatID, reuseID) values -- Eyeglasses
(52, 147, 12);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(53, "Love INC","2330 NW Professional Dr #102","http://www.yourloveinc.org/","Corvallis","(541) 757-8111","OR",0.00,0.00,"for low income citizens");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Large
(53, 48, 5), (53, 49, 5), (53, 50, 5), (53, 51, 5), (53, 52, 5);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(53, 41, 4), (53, 42, 4), (53, 43, 4), (53, 44, 4), (53, 45, 4), (53, 46, 4), (53, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(53, 17, 2), (53, 18, 2), (53, 19, 2), (53, 20, 2), (53, 21, 2), (53, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(53, 106, 9), (53, 107, 9), (53, 108, 9), (53, 109, 9), (53, 110, 9), (53, 111, 9), (53, 112, 9), (53, 113, 9), (53, 114, 9), (53, 115, 9), (53, 116, 9),
(53, 117, 9), (53, 118, 9), (53, 119, 9), (53, 120, 9), (53, 121, 9), (53, 122, 9), (53, 123, 9), (53, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(53, 23, 3), (53, 24, 3), (53, 25, 3), (53, 26, 3), (53, 27, 3), (53, 28, 3), (53, 29, 3), (53, 30, 3), (53, 31, 3), (53, 32, 3), (53, 33, 3), 
(53, 34, 3), (53, 35, 3), (53, 36, 3), (53, 37, 3), (53, 38, 3), (53, 39, 3), (53, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Firewood
(53, 170, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(53, 139, 11), (53, 141, 11), (53, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(53, 125, 10), (53, 126, 10), (53, 127, 10), (53, 128, 10), (53, 129, 10), (53, 130, 10), (53, 131, 10), (53, 132, 10),
(53, 133, 10), (53, 134, 10), (53, 135, 10), (53, 136, 10), (53, 137, 10), (53, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(53, 84, 8), (53, 85, 8), (53, 86, 8), (53, 87, 8), (53, 88, 8), (53, 89, 8), (53, 90, 8), (53, 91, 8), (53, 92, 8), (53, 93, 8), (53, 94, 8), 
(53, 95, 8), (53, 96, 8), (53, 97, 8), (53, 98, 8), (53, 99, 8), (53, 100, 8), (53, 101, 8), (53, 102, 8), (53, 103, 8), (53, 104, 8), (53, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(53, 1, 1), (53, 2, 1), (53, 3, 1), (53,4, 1), (53, 5, 1), (53, 6, 1), (53, 7, 1), (53, 8, 1), (53, 9, 1), (53, 10, 1), 
(53, 11, 1), (53, 12, 1), (53, 13, 1), (53, 14, 1), (53, 15, 1), (53, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(53, 143, 12), (53, 144, 12), (53, 145, 12), (53, 146, 12), (53, 147, 12), (53, 148, 12), (53, 149, 12), (53, 150, 12), 
(53, 151, 12), (53, 152, 12), (53, 153, 12), (53, 154, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Computers/Monitors (office)
(53, 156, 13), (53, 159, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(53, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(53, 173, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Vehicles
(53, 175, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(54, "Mario Pastega House","3505 NW Samaritan Dr","http://www.samhealth.org/locations/mariopastegahouse/Pages/default.aspx","Corvallis","(541) 768-4650","OR",0.00,0.00,"Good Sam patient family housing");
insert into reuse_bus(bid, subcatID, reuseID) values -- Books
(54, 3, 1), (54, 27, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(54, 88, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(54, 139, 11), (54, 141, 11), (54, 142, 11);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(55, "Mary's River Gleaners","Po Box 2309","","Corvallis","(541) 752-1010","OR",0.00,0.00,"for low income citizens");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Large
(55, 48, 5), (55, 49, 5), (55, 50, 5), (55, 51, 5), (55, 52, 5);
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(55, 41, 4), (55, 42, 4), (55, 43, 4), (55, 44, 4), (55, 45, 4), (55, 46, 4), (55, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(55, 17, 2), (55, 18, 2), (55, 19, 2), (55, 20, 2), (55, 21, 2), (55, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(55, 106, 9), (55, 107, 9), (55, 108, 9), (55, 109, 9), (55, 110, 9), (55, 111, 9), (55, 112, 9), (55, 113, 9), (55, 114, 9), (55, 115, 9), (55, 116, 9),
(55, 117, 9), (55, 118, 9), (55, 119, 9), (55, 120, 9), (55, 121, 9), (55, 122, 9), (55, 123, 9), (55, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(55, 174, 15), (55, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(55, 23, 3), (55, 24, 3), (55, 25, 3), (55, 26, 3), (55, 27, 3), (55, 28, 3), (55, 29, 3), (55, 30, 3), (55, 31, 3), (55, 32, 3), (55, 33, 3), 
(55, 34, 3), (55, 35, 3), (55, 36, 3), (55, 37, 3), (55, 38, 3), (55, 39, 3), (55, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(55, 76, 7), (55, 77, 7), (55, 78, 7), (55, 79, 7), (55, 80, 7), (55, 81, 7), (55, 82, 7), (55, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Firewood
(55, 170, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(55, 139, 11), (55, 140, 11), (55, 141, 11), (55, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(55, 125, 10), (55, 126, 10), (55, 127, 10), (55, 128, 10), (55, 129, 10), (55, 130, 10), (55, 131, 10), (55, 132, 10),
(55, 133, 10), (55, 134, 10), (55, 135, 10), (55, 136, 10), (55, 137, 10), (55, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(55, 84, 8), (55, 85, 8), (55, 86, 8), (55, 87, 8), (55, 88, 8), (55, 89, 8), (55, 90, 8), (55, 91, 8), (55, 92, 8), (55, 93, 8), (55, 94, 8), 
(55, 95, 8), (55, 96, 8), (55, 97, 8), (55, 98, 8), (55, 99, 8), (55, 100, 8), (55, 101, 8), (55, 102, 8), (55, 103, 8), (55, 104, 8), (55, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(55, 1, 1), (55, 2, 1), (55, 3, 1), (55,4, 1), (55, 5, 1), (55, 6, 1), (55, 7, 1), (55, 8, 1), (55, 9, 1), (55, 10, 1), 
(55, 11, 1), (55, 12, 1), (55, 13, 1), (55, 14, 1), (55, 15, 1), (55, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(55, 143, 12), (55, 144, 12), (55, 145, 12), (55, 146, 12), (55, 147, 12), (55, 148, 12), (55, 149, 12), (55, 150, 12), 
(55, 151, 12), (55, 152, 12), (55, 153, 12), (55, 154, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(55, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(55, 173, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Vehicles
(55, 175, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(56, "Midway Farms","6980 US-20","http://www.midwayfarmsoregon.com/","Albany","(541) 740-6141","OR",0.00,0.00,"Highway 20 between Corvallis & Albany");
insert into reuse_bus(bid, subcatID, reuseID) values -- Egg cartons
(56, 169, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown paper/bags
(56, 174, 15), (56, 178, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(57, "Neighbor to Neighbor","1123 Main", "","Philomath","(541) 929-6614","OR",0.00,0.00,"food pantry");
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(57, 139, 11), (57, 140, 11), (57, 141, 11), (57, 142, 11);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(58, "Osborn Aquatic Center","1940 NW Highland Dr","http://www.corvallisoregon.gov/index.aspx?page=57","Corvallis","(541) 766-7946","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Large
(58, 48, 5), (58, 49, 5), (58, 50, 5), (58, 51, 5), (58, 52, 5);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(59, "OSU Emergency Food Pantry","2150 SW Jefferson Way","http://studentlife.oregonstate.edu/hsrc/osu-emergency-food-pantry","Corvallis","(541) 737-3473","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(59, 139, 11), (59, 140, 11), (59, 141, 11), (59, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Toiletries
(59, 15, 1);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(60, "OSU Folk Club Thrift Shop","144 NW 2nd St","http://oregonstate.edu/osufolk/hours","Corvallis","(541) 752-4733","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(60, 41, 4), (60, 42, 4), (60, 43, 4), (60, 44, 4), (60, 45, 4), (60, 46, 4), (60, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(60, 17, 2), (60, 18, 2), (60, 19, 2), (60, 20, 2), (60, 21, 2), (60, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(60, 106, 9), (60, 107, 9), (60, 108, 9), (60, 109, 9), (60, 110, 9), (60, 111, 9), (60, 112, 9), (60, 113, 9), (60, 114, 9), (60, 115, 9), (60, 116, 9),
(60, 117, 9), (60, 118, 9), (60, 119, 9), (60, 120, 9), (60, 121, 9), (60, 122, 9), (60, 123, 9), (60, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(60, 174, 15), (60, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(60, 23, 3), (60, 24, 3), (60, 25, 3), (60, 26, 3), (60, 27, 3), (60, 28, 3), (60, 29, 3), (60, 30, 3), (60, 31, 3), (60, 32, 3), (60, 33, 3), 
(60, 34, 3), (60, 35, 3), (60, 36, 3), (60, 37, 3), (60, 38, 3), (60, 39, 3), (60, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(60, 76, 7), (60, 77, 7), (60, 78, 7), (60, 79, 7), (60, 80, 7), (60, 81, 7), (60, 82, 7), (60, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(60, 88, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(60, 125, 10), (60, 126, 10), (60, 127, 10), (60, 128, 10), (60, 129, 10), (60, 130, 10), (60, 131, 10), (60, 132, 10),
(60, 133, 10), (60, 134, 10), (60, 135, 10), (60, 136, 10), (60, 137, 10), (60, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(60, 1, 1), (60, 2, 1), (60, 3, 1), (60,4, 1), (60, 5, 1), (60, 6, 1), (60, 7, 1), (60, 8, 1), (60, 9, 1), (60, 10, 1), 
(60, 11, 1), (60, 12, 1), (60, 13, 1), (60, 14, 1), (60, 15, 1), (60, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(60, 143, 12), (60, 144, 12), (60, 145, 12), (60, 146, 12), (60, 147, 12), (60, 148, 12), (60, 149, 12), (60, 150, 12), 
(60, 151, 12), (60, 152, 12), (60, 153, 12), (60, 154, 12);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(60, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(60, 173, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(61, "OSU Organic Growers Club","","http://cropandsoil.oregonstate.edu/organic_grower","Corvallis","(541) 737-6810","OR",0.00,0.00,"Crop & Soil Science Dept.");
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(61, 125, 10), (61, 126, 10), (61, 127, 10), (61, 128, 10), (61, 129, 10), (61, 130, 10), (61, 131, 10), (61, 132, 10),
(61, 133, 10), (61, 134, 10), (61, 135, 10), (61, 136, 10), (61, 137, 10), (61, 138, 10);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(62, "Pak Mail","2397 NW Kings Blvd","http://www.pakmail.com/stores/pak-mail-corvallis/","Corvallis","(541) 754-8411","OR",0.00,0.00,"Timberhill Shopping Center");
insert into reuse_bus(bid, subcatID, reuseID) values -- Packing Materials
(62, 166, 14), (62, 167, 14), (62, 168, 14);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(63, "Parent Enhancement Program","421 NW 4th St","http://www.downtowncorvallis.org/members/directory.php?show=779","Corvallis","(541) 758-8292","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Art Supplies
(63, 1, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(63, 106, 9), (63, 107, 9), (63, 108, 9), (63, 109, 9), (63, 110, 9), (63, 111, 9), (63, 112, 9), (63, 113, 9), (63, 114, 9), (63, 115, 9), (63, 116, 9),
(63, 117, 9), (63, 118, 9), (63, 119, 9), (63, 120, 9), (63, 121, 9), (63, 122, 9), (63, 123, 9), (63, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Books
(63, 3, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(63, 174, 15), (63, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(63, 23, 3), (63, 24, 3), (63, 25, 3), (63, 26, 3), (63, 27, 3), (63, 28, 3), (63, 29, 3), (63, 30, 3), (63, 31, 3), (63, 32, 3), (63, 33, 3), 
(63, 34, 3), (63, 35, 3), (63, 36, 3), (63, 37, 3), (63, 38, 3), (63, 39, 3), (63, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(63, 76, 7), (63, 77, 7), (63, 78, 7), (63, 79, 7), (63, 80, 7), (63, 81, 7), (63, 82, 7), (63, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Fabric
(63, 9, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(63, 139, 11), (63, 141, 11), (63, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office supplies
(63, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Toiletries
(63, 15, 1);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(64, "Pastors for Peace-Caravan to Cuba","","www.ccds.org","Corvallis","(541) 754-1858","OR",0.00,0.00,"contact Mike Beilstein");
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(64, 106, 9), (64, 107, 9), (64, 108, 9), (64, 109, 9), (64, 110, 9), (64, 111, 9), (64, 112, 9), (64, 113, 9), (64, 114, 9), (64, 115, 9), (64, 116, 9),
(64, 117, 9), (64, 118, 9), (64, 119, 9), (64, 120, 9), (64, 121, 9), (64, 122, 9), (64, 123, 9), (64, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Computers/Monitors
(64, 90, 8), (64, 96, 8), (64, 156, 13), (64, 159, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(64, 143, 12), (64, 144, 12), (64, 145, 12), (64, 146, 12), (64, 147, 12), (64, 148, 12), (64, 149, 12), (64, 150, 12), 
(64, 151, 12), (64, 152, 12), (64, 153, 12), (64, 154, 12);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(65, "Philomath Community Garden","","http://philomathcommunityservices.org/","Corvallis","(541) 929-3524","OR",0.00,0.00,"contact Chris Shonnard");
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(65, 125, 10), (65, 126, 10), (65, 127, 10), (65, 128, 10), (65, 129, 10), (65, 130, 10), (65, 131, 10), (65, 132, 10),
(65, 133, 10), (65, 134, 10), (65, 135, 10), (65, 136, 10), (65, 137, 10), (65, 138, 10);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(66, "Philomath Community Services","360 S 9th","http://philomathcommunityservices.org/","Philomath","(541) 929-2499","OR",0.00,0.00,"food & kids stuff");
insert into reuse_bus(bid, subcatID, reuseID) values -- Books
(66, 3, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(66, 23, 3), (66, 24, 3), (66, 25, 3), (66, 26, 3), (66, 27, 3), (66, 28, 3), (66, 29, 3), (66, 30, 3), (66, 31, 3), (66, 32, 3), (66, 33, 3), 
(66, 34, 3), (66, 35, 3), (66, 36, 3), (66, 37, 3), (66, 38, 3), (66, 39, 3), (66, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Firewood
(66, 170, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(66, 139, 11), (66, 140, 11), (66, 141, 11), (66, 142, 11);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(67, "Play It Again Sports","1422 NW 9th St","http://www.playitagainsportscorvallis.com/","Corvallis","(541) 754-7529","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(67, 106, 9), (67, 107, 9), (67, 108, 9), (67, 109, 9), (67, 110, 9), (67, 111, 9), (67, 112, 9), (67, 113, 9), (67, 114, 9), (67, 115, 9), (67, 116, 9),
(67, 117, 9), (67, 118, 9), (67, 119, 9), (67, 120, 9), (67, 121, 9), (67, 122, 9), (67, 123, 9), (67, 124, 9);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(68, "Presbyterian Piecemakers","114 SW 8th St","http://1stpres.org/","Corvallis","(541) 753-7516","OR",0.00,0.00,"cotton quilts");
insert into reuse_bus(bid, subcatID, reuseID) values -- Fabric
(68, 9, 1);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(69, "Friends of Public Library Corvallis","645 NW Monroe Ave","http://cbcpubliclibrary.net/","Corvallis","(541) 766-6928","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Books
(69, 3, 1), (69, 27, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(69, 88, 8);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(70, "Quilts From Caring Hands","1495 NW 20th St","http://www.quiltsfromcaringhands.com/","Corvallis","(541) 758-8161","OR",0.00,0.00,"cotton quilts");
insert into reuse_bus(bid, subcatID, reuseID) values -- Fabric
(70, 9, 1);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(71, "Rapid Refill Ink", "254 SW Madison Ave","http://www.rapidinkandtoner.com/oregon/corvallis-store-0107","Corvallis","(541) 758-8444","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Ink refills
(71, 162, 13);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(72, "re•volve", "103 SW 2nd St","http://www.revolveresale.com/","Corvallis","(541) 754-1154","OR",0.00,0.00,"women's resale boutique");
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(72, 174, 15), (72, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(72, 76, 7), (72, 77, 7), (72, 78, 7), (72, 79, 7), (72, 80, 7), (72, 81, 7), (72, 82, 7), (72, 83, 7);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(73, "Schools--Public, Private, Charter","","http://www.glanceagain.com/","Corvallis","","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Art supplies
(73, 1, 1), (73, 23, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Books
(73, 3, 1), (73, 27, 3);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(73, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- School Supplies
(73, 38, 3);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(74, "Second Glance","312 SW 3rd Street","http://www.glanceagain.com/","Corvallis","(541) 758-9099","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(74, 174, 15), (74, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(74, 76, 7), (74, 77, 7), (74, 78, 7), (74, 79, 7), (74, 80, 7), (74, 81, 7), (74, 82, 7), (74, 83, 7);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(75, "The Annex","214 SW Jefferson","http://www.glanceagain.com/","Corvallis","(541) 758-9099","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(75, 174, 15), (75, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(75, 76, 7), (75, 77, 7), (75, 78, 7), (75, 79, 7), (75, 80, 7), (75, 81, 7), (75, 82, 7), (75, 83, 7);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(76, "The Alley","312 SW Jefferson","http://www.glanceagain.com/2011/11/second-glance-alley/","Corvallis","(541) 753-4069","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(76, 174, 15), (76, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(76, 76, 7), (76, 77, 7), (76, 78, 7), (76, 79, 7), (76, 80, 7), (76, 81, 7), (76, 82, 7), (76, 83, 7);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(77, "Senior Center of Corvallis","2601 NW Tyler Ave","http://www.corvallisoregon.gov/index.aspx?page=257","Corvallis","(541) 766-6959","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(77, 88, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Cellphones
(77, 89, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(77, 140, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Medical Supplies
(77, 143, 12), (77, 144, 12), (77, 145, 12), (77, 146, 12), (77, 147, 12), (77, 148, 12), (77, 149, 12), (77, 150, 12), 
(77, 151, 12), (77, 152, 12), (77, 153, 12), (77, 154, 12);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(78, "South Corvallis Food Bank","1798 SW 3rd St","http://www.southcorvallisfoodbank.org/","Corvallis","(541) 753-4263","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(78, 139, 11), (78, 140, 11), (78, 141, 11), (78, 142, 11);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(79, "St. Vincent de Paul Food Bank","501 NW 25 th Street","","Corvallis","(541) 757-1988","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(79, 41, 4), (79, 42, 4), (79, 43, 4), (79, 44, 4), (79, 45, 4), (79, 46, 4), (79, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(79, 174, 15), (79, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(79, 88, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(79, 23, 3), (79, 24, 3), (79, 25, 3), (79, 26, 3), (79, 27, 3), (79, 28, 3), (79, 29, 3), (79, 30, 3), (79, 31, 3), (79, 32, 3), (79, 33, 3), 
(79, 34, 3), (79, 35, 3), (79, 36, 3), (79, 37, 3), (79, 38, 3), (79, 39, 3), (79, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(79, 76, 7), (79, 77, 7), (79, 78, 7), (79, 79, 7), (79, 80, 7), (79, 81, 7), (79, 82, 7), (79, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(79, 139, 11), (79, 140, 11), (79, 141, 11), (79, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(79, 1, 1), (79, 2, 1), (79, 3, 1), (79,4, 1), (79, 5, 1), (79, 6, 1), (79, 7, 1), (79, 8, 1), (79, 9, 1), (79, 10, 1), 
(79, 11, 1), (79, 12, 1), (79, 13, 1), (79, 14, 1), (79, 15, 1), (79, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(79, 155, 13), (79, 156, 13), (79, 157, 13), (79, 158, 13), (79, 159, 13), (79, 160, 13), (79, 161, 13), 
(79, 163, 13), (79, 164, 13), (79, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(79, 173, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(80, "Stone Soup","501 NW 25th Street","http://www.stonesoupcorvallis.org/about.html","Corvallis","(541) 757-1988","OR",0.00,0.00,"St. Mary's Church");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(80, 41, 4), (80, 42, 4), (80, 43, 4), (80, 44, 4), (80, 45, 4), (80, 46, 4), (80, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(80, 174, 15), (80, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- CDs
(80, 88, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(80, 23, 3), (80, 24, 3), (80, 25, 3), (80, 26, 3), (80, 27, 3), (80, 28, 3), (80, 29, 3), (80, 30, 3), (80, 31, 3), (80, 32, 3), (80, 33, 3), 
(80, 34, 3), (80, 35, 3), (80, 36, 3), (80, 37, 3), (80, 38, 3), (80, 39, 3), (80, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(80, 76, 7), (80, 77, 7), (80, 78, 7), (80, 79, 7), (80, 80, 7), (80, 81, 7), (80, 82, 7), (80, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(80, 139, 11), (80, 140, 11), (80, 141, 11), (80, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(80, 1, 1), (80, 2, 1), (80, 3, 1), (80,4, 1), (80, 5, 1), (80, 6, 1), (80, 7, 1), (80, 8, 1), (80, 9, 1), (80, 10, 1), 
(80, 11, 1), (80, 12, 1), (80, 13, 1), (80, 14, 1), (80, 15, 1), (80, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Equipment
(80, 155, 13), (80, 156, 13), (80, 157, 13), (80, 158, 13), (80, 159, 13), (80, 160, 13), (80, 161, 13), 
(80, 163, 13), (80, 164, 13), (80, 165, 13);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(80, 173, 15);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(81, "UPS Store - Philomath","5060 SW Philomath Blvd","https://corvallis-or-5088.theupsstorelocal.com/","Philomath","(541) 752-1830","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Packing Materials
(81, 166, 14), (81, 167, 14), (81, 168, 14);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(82, "UPS Store - Corvallis","922 NW Circle Blvd #160","https://corvallis-or-5088.theupsstorelocal.com/","Corvallis","(541) 752-0056","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Packing Materials
(82, 166, 14), (82, 167, 14), (82, 168, 14);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(83, "Vina Moses","968 NW Garfield Ave","http://www.vinamoses.org/","Corvallis","(541) 753-1420","OR",0.00,0.00,"for low income citizens");
insert into reuse_bus(bid, subcatID, reuseID) values -- Appliances - Small
(83, 41, 4), (83, 42, 4), (83, 43, 4), (83, 44, 4), (83, 45, 4), (83, 46, 4), (83, 47, 4);
insert into reuse_bus(bid, subcatID, reuseID) values -- Bedding/Bath
(83, 17, 2), (83, 18, 2), (83, 19, 2), (83, 20, 2), (83, 21, 2), (83, 22,2);
insert into reuse_bus(bid, subcatID, reuseID) values -- Sports Equipment
(83, 106, 9), (83, 107, 9), (83, 108, 9), (83, 109, 9), (83, 110, 9), (83, 111, 9), (83, 112, 9), (83, 113, 9), (83, 114, 9), (83, 115, 9), (83, 116, 9),
(83, 117, 9), (83, 118, 9), (83, 119, 9), (83, 120, 9), (83, 121, 9), (83, 122, 9), (83, 123, 9), (83, 124, 9);
insert into reuse_bus(bid, subcatID, reuseID) values -- Brown Paper/Bags
(83, 174, 15), (83, 178, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(83, 23, 3), (83, 24, 3), (83, 25, 3), (83, 26, 3), (83, 27, 3), (83, 28, 3), (83, 29, 3), (83, 30, 3), (83, 31, 3), (83, 32, 3), (83, 33, 3), 
(83, 34, 3), (83, 35, 3), (83, 36, 3), (83, 37, 3), (83, 38, 3), (83, 39, 3), (83, 40, 3);
insert into reuse_bus(bid, subcatID, reuseID) values  -- Wearable Items
(83, 76, 7), (83, 77, 7), (83, 78, 7), (83, 79, 7), (83, 80, 7), (83, 81, 7), (83, 82, 7), (83, 83, 7);
insert into reuse_bus(bid, subcatID, reuseID) values -- Food
(83, 139, 11), (83, 140, 11), (83, 141, 11), (83, 142, 11);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(83, 125, 10), (83, 126, 10), (83, 127, 10), (83, 128, 10), (83, 129, 10), (83, 130, 10), (83, 131, 10), (83, 132, 10),
(83, 133, 10), (83, 134, 10), (83, 135, 10), (83, 136, 10), (83, 137, 10), (83, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Useable Electronics
(83, 84, 8), (83, 85, 8), (83, 86, 8), (83, 87, 8), (83, 88, 8), (83, 89, 8), (83, 90, 8), (83, 91, 8), (83, 92, 8), (83, 93, 8), (83, 94, 8), 
(83, 95, 8), (83, 96, 8), (83, 97, 8), (83, 98, 8), (83, 99, 8), (83, 100, 8), (83, 101, 8), (83, 102, 8), (83, 103, 8), (83, 104, 8), (83, 105, 8);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(83, 1, 1), (83, 2, 1), (83, 3, 1), (83,4, 1), (83, 5, 1), (83, 6, 1), (83, 7, 1), (83, 8, 1), (83, 9, 1), (83, 10, 1), 
(83, 11, 1), (83, 12, 1), (83, 13, 1), (83, 14, 1), (83, 15, 1), (83, 16, 1);
insert into reuse_bus(bid, subcatID, reuseID) values -- Office Supplies
(83, 179, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Pets
(83, 173, 15);
insert into reuse_bus(bid, subcatID, reuseID) values -- Eyeglasses
(83, 147, 12);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(84, "Spaeth Heritage House","135 N 13th St","http://www.spaethlumber.com/main/home/main.aspx","Philomath","(541) 307-0349","OR",0.00,0.00,"");
insert into reuse_bus(bid, subcatID, reuseID) values -- Building/Home Improvmeent
(84, 53, 6), (84, 54, 6), (84, 55, 6), (84, 56, 6), (84, 57, 6), (84, 58, 6), (84, 59, 6), (84, 60, 6), (84, 61, 6), (84, 62, 6), (84, 63, 6), (84, 64, 6),
(84, 65, 6), (84, 66, 6), (84, 67, 6), (84, 68, 6), (84, 69, 6), (84, 70, 6), (84, 71, 6), (84, 72, 6), (84, 73, 6), (84, 74, 6), (84, 75, 6);
insert into reuse_bus(bid, subcatID, reuseID) values -- Garden
(84, 125, 10), (84, 126, 10), (84, 127, 10), (84, 128, 10), (84, 129, 10), (84, 130, 10), (84, 131, 10), (84, 132, 10),
(84, 133, 10), (84, 134, 10), (84, 135, 10), (84, 136, 10), (84, 137, 10), (84, 138, 10);
insert into reuse_bus(bid, subcatID, reuseID) values -- Household
(84, 1, 1), (84, 2, 1), (84, 3, 1), (84,4, 1), (84, 5, 1), (84, 6, 1), (84, 7, 1), (84, 8, 1), (84, 9, 1), (84, 10, 1), 
(84, 11, 1), (84, 12, 1), (84, 13, 1), (84, 14, 1), (84, 15, 1), (84, 16, 1);

insert into business(business_id, name, address, website, city, telephone, state, latitude, longitude, notes) values 
(85, "Replay Children's Wear", "250 NW 1st St", "", "Corvallis", "(541) 753-6903", "OR", 0.00, 0.00, "");
insert into reuse_bus(bid, subcatID, reuseID) values -- Children's Goods
(85, 23, 3), (85, 24, 3), (85, 25, 3), (85, 26, 3), (85, 27, 3), (85, 28, 3), (85, 29, 3), (85, 30, 3), (85, 31, 3), (85, 32, 3), (85, 33, 3), 
(85, 34, 3), (85, 35, 3), (85, 36, 3), (85, 37, 3), (85, 38, 3), (85, 39, 3), (85, 40, 3);
	