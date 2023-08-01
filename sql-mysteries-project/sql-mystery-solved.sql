/* Murder mystery Project
You must retrieve the corresponding crime scene report from the police department’s database.
You vaguely remember that the crime was a murder that occurred sometime on Jan.15, 2018 and that it took place in SQL City. 
*/

/* Find murder report in SQL City on Jan 15, 2018 */
SELECT description FROM crime_scene_report
WHERE city='SQL City' and type='murder' AND date='20180115' ;
/* Result : Security footage shows that there were 2 witnesses. 
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave". */

-- Find first witness's statement --
SELECT id,name,address_street_name,address_number,interview.transcript FROM person
JOIN interview
	ON person.id = interview.person_id
WHERE address_street_name='Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;
/* 1 - I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
The membership number on the bag started with "48Z". Only gold members have those bags. 
The man got into a car with a plate that included "H42W" */

-- Find second witness's statement -
SELECT id,name,address_street_name,address_number,interview.transcript FROM person
JOIN interview
	ON person.id = interview.person_id
WHERE address_street_name='Franklin Ave' AND name LIKE 'Annabel%';
/* 2 - I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.*/


/*Now we need to find a person who
- gym membership number started with "48Z" and membership status is "gold" 
- has a car with plate that included "H42W"
- checked in at gym on january 9th
*/
SELECT 
	membership_id,
    check_in_date,
    get_fit_now_member.person_id,
    get_fit_now_member.name, 
    get_fit_now_member.membership_status 
FROM get_fit_now_check_in
JOIN get_fit_now_member
	ON get_fit_now_check_in.membership_id = get_fit_now_member.id
where check_in_date='20180109' AND membership_status='gold' AND membership_id LIKE '48Z%';
/* There are 2 person who checked in at gym on jan 9th, gym membership started with 48Z, and membership status is gold
1. Joe Germuska, person_id:28819	
2. Jeremy Bowers, person_id:67318 */

/*Next we will check plate number of the car*/
SELECT 
	person.id, 
    person.name,
    person.license_id,
    drivers_license.plate_number
FROM person
JOIN drivers_license ON person.license_id = drivers_license.id 
WHERE person.id = 28819  or person.id = 67318;
/* The result appeared that Jeremy Bowers's plate number is 0H42W2 
which matches with the statement from first witness (have 'H42W')*/

/* Check Answer - Is Jeremy Bowers the culprit? */
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
SELECT value FROM solution;
/*Result : Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, 
try querying the interview transcript of the murderer to find the real villain behind this crime. 
If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. 
Use this same INSERT statement with your new suspect to check your answer.*/

/* Check Jeremy's statement */
SELECT * FROM interview
WHERE person_id = 67318 ;
/*Result: I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5 (65) or 5'7 (67). 
She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.*/

/*Find real culprit of this crime*/
SELECT 
	facebook_event_checkin.event_name,
    facebook_event_checkin.person_id,
    facebook_event_checkin.date,
    person.name,
    drivers_license.car_make,
    drivers_license.car_model,
    drivers_license.gender
FROM facebook_event_checkin
JOIN person ON facebook_event_checkin.person_id = person.id
JOIN drivers_license ON person.license_id = drivers_license.id
WHERE gender='female' 
	AND car_make='Tesla' 
    AND car_model='Model S' 
    and facebook_event_checkin.date LIKE '2017%'
    AND event_name LIKE 'SQL Symphony%'
 /*The result shows that Miranda Priestly matches with Jeremy's statement. She's must be the real culprit!*/
    
/* Check real villian */   
INSERT INTO solution VALUES (1, 'Miranda Priestly');
SELECT value FROM solution;
/* Congrats, you found the brains behind the murder! 
Everyone in SQL City hails you as the greatest SQL detective of all time. 
Time to break out the champagne! */
