class Project < ApplicationRecord

	enum :cost_type, { low: 0, high: 1 }, prefix: true

	def self.process_set(token)
		set = where(set_token: token)
		ReimbursementService.reimburse_projects(set)
	end

	def date_range
		(start_date.to_date..end_date.to_date)
	end

	def full_days
		(start_date.tomorrow.to_date..end_date.yesterday.to_date).to_a
	end

	def travel_days
		[start_date.to_date, end_date.to_date]
	end

	def self.generate_unique_token(attempts = 5)
		retries ||= 0
		used_tokens = self.all.pluck(:set_token)
		begin
			set_token = SecureRandom.base64(8)
		rescue used_tokens.includes?(set_token)
			raise if (retries += 1) > attempts
			set_token = SecureRandom.base64(8)
			retry
		end
	end

	def self.process_all_sets
		reimbursement = []
		Project.all.map(&:set_token).compact.uniq.each do |token|
			reimbursement << Project.process_set(token)
		end
		(reimbursement.flatten.sum.to_f).round(2)
	end

end
