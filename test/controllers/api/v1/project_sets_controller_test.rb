require "test_helper"

class Api::V1::ProjectSetsControllerTest < ActionController::TestCase

  setup do
    @payload_1 = {
      project_set: [
        {
          cost_type: 'low',
          start_date: '01/09/2015',
          end_date: '03/09/2015'
        },
        {
          cost_type: 'low',
          start_date: '01/09/2015',
          end_date: '01/09/2015'
        }
      ]
    }
  end

  test "#create creates a project set based on set_token and calculates result" do
    post :create, params: @payload_1
    parsed_body = JSON.parse(response.body)
    assert_equal('$165.00', parsed_body['reimbursement'])
  end
end
