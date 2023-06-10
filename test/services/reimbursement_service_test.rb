require "test_helper"

class ReimbursementServiceTest < ActiveSupport::TestCase

  setup do
  	@set_tokens = Project.all.map(&:set_token).uniq.compact
  end

	test 'calculate projects in set 1' do
 		projects = Project.where(set_token: @set_tokens[0])
 		reimbursement = ReimbursementService.reimburse_projects(projects)
 		assert_equal(555, reimbursement)
 	end

	test 'calculate projects in set 2' do
 		projects = Project.where(set_token: @set_tokens[1])
 		reimbursement = ReimbursementService.reimburse_projects(projects)
 		assert_equal(620, reimbursement)
 	end

	test 'calculate projects in set 3' do
 		projects = Project.where(set_token: @set_tokens[2])
 		reimbursement = ReimbursementService.reimburse_projects(projects)
 		assert_equal(400, reimbursement)
 	end

	test 'calculate projects in set 4' do
 		projects = Project.where(set_token: @set_tokens[3])
 		reimbursement = ReimbursementService.reimburse_projects(projects)
 		assert_equal(165, reimbursement)
 	end
end