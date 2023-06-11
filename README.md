# README

* Ruby version
	Ruby 3.1.3

* Rails version
  Rails 7.0.5

* System dependencies
	- works out of box
	  - sqlite database for ease of use

* Configuration
	
	after pulling down app:
		1. rails db:setup && rails db:seed
		2. now should be ready to go


* Design

	There are 2 ways to work with this app:

	Rails Console:
	
			rails c
			Project.process_all_sets # processes all projects
			Project.process_set(set_token) # pass the set_token to process a project set

	or

			the service class has all the goodies, so you can just use this instead:

			Project.where(set_token: 'tokentouse')
			ReimbursementService.reimburse_projects(projects) # pass a collection of projects 

	API:

		you could also submit a project set using the api like so:

		POST localhost:3000/api/v1/project_sets
		request:
			{
	      "project_set": [
	        {
	          "cost_type": "low",
	          "start_date": "01/09/2015",
	          "end_date": "03/09/2015"
	        },
	        {
	          "cost_type": "low",
	          "start_date": "01/09/2015",
	          "end_date": "01/09/2015"
	        }
	      ]
	    }

	    response:
	    {
		    "results": [
		        {
		            "set_token": "v5MSZnz/O4g=",
		            "cost_type": "low",
		            "start_date": "2015-09-01T00:00:00.000Z",
		            "end_date": "2015-09-03T00:00:00.000Z"
		        },
		        {
		            "set_token": "v5MSZnz/O4g=",
		            "cost_type": "low",
		            "start_date": "2015-09-01T00:00:00.000Z",
		            "end_date": "2015-09-01T00:00:00.000Z"
		        }
		    ],
		    "reimbursement": "$255.00"
			}

	the server will show a table of your projects and results


