class ReimbursementService

	TRAVEL_DAY_LOW = 45
	TRAVEL_DAY_HIGH = 55
	TRAVEL_DAYS = 2
	FULL_DAY_LOW = 75
	FULL_DAY_HIGH = 85

	def self.reimburse_projects(projects)
		reimbursed_days = []
		low_days_pay = []
		high_days_pay = []

		# iterate through projects/ calculate
		projects.each do |project|
			if project.cost_type_low?
				low_days_pay << calculate_low_days(project, reimbursed_days)
			elsif project.cost_type_high?
				high_days_pay << calculate_high_days(project, reimbursed_days)
			end
			reimbursed_days << project.date_range.to_a
		end
		# sum of low days + sum of high days pay 
		[low_days_pay.sum, high_days_pay.sum].sum
	end

	def self.calculate_low_days(project, reimbursed_days)
		# find full days that have not been reimbursed
		full_days = (project.full_days - reimbursed_days).count
		# find travel days that have not been reimbursed
		travel_days = (project.travel_days - reimbursed_days).count
		# Calculate rate by days for reimbursement
		(full_days.to_i * FULL_DAY_LOW) + (travel_days.to_i * TRAVEL_DAY_LOW)
	end

	def self.calculate_high_days(project, reimbursed_days)
		# find full days that have not been reimbursed
		full_days = (project.full_days - reimbursed_days).count
		# find travel days that have not been reimbursed
		travel_days = (project.travel_days - reimbursed_days).count
		# Calculate rate by days for reimbursement
		(full_days.to_i * FULL_DAY_HIGH) + (travel_days.to_i * TRAVEL_DAY_HIGH)
	end

end