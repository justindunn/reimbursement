class Api::V1::ProjectSetsController < ApplicationController
	helper_method :number_to_currency
	# SET EXAMPLE

	# {
	# 	project_set: [
	# 		"cost_type": 'high',
	# 		"start_date": '01/09/2015',
	# 		"end_date": '03/09/2015'
	# 	],
	# 	[
	# 		"cost_type": 'low',
	# 		"start_date": '10/09/2015',
	# 		"end_date": '30/09/2015'
	# 	]
	# }

	def create
		@set_token = Project.generate_unique_token
		project_set_params['project_set'].each { |project_params| Project.create(project_params.merge(set_token: @set_token)) }
		projects = Project.where(set_token: @set_token)
		render json: projects ? project_set_as_json(projects) : []
	end

	protected

	def parse_set_type(set_type)
		case set_type
		when 'low'
			0
		when 'high'
			1
		end
	end

	def project_set_params
		params[:project_set].each { |project| project['cost_type'] = parse_set_type(project[:cost_type]) }
		params.permit(project_set: [:cost_type, :start_date, :end_date])
	end

	def project_set_as_json(set)
		{
			results: set.map { |project| project_as_json(project) }
		}.merge(reimbursement: calculated_reimbursement)
	end

	def calculated_reimbursement
		ActionController::Base.helpers.number_to_currency(Project.process_set(@set_token))
	end

	def project_as_json(project)
		{
			set_token: project.set_token,
			cost_type: project.cost_type,
			start_date: project.start_date,
			end_date: project.end_date
		}
	end

end
