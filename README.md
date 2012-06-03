auspol-smarts
=============

Are you smarter than an X grade - but this time versus the politicians in Australia!

Schema
- Constituency
	- has many Politicians
	- has many Postcodes
- Politician
	- has many Constituencies
	- Note: timeframed
- Postcode
	- belongs_to Constituency
- Bill
	- has many Speeches
	- has many Votes
- Speech
	- belongs_to Politician
	- belongs_to 

*Optional*
- Vote
	- belongs_to Politician
	- belongs_to Bill
	
	
