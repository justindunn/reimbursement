SET_ONE_TOKEN = ENV['SET_ONE_TOKEN'].presence || Project.generate_unique_token
SET_TWO_TOKEN = ENV['SET_TWO_TOKEN'].presence || Project.generate_unique_token
SET_THREE_TOKEN = ENV['SET_THREE_TOKEN'].presence || Project.generate_unique_token
SET_FOUR_TOKEN = ENV['SET_FOUR_TOKEN'].presence || Project.generate_unique_token

Project.create(set_token: SET_ONE_TOKEN, cost_type: :low, start_date: ('01/09/2015').to_datetime, end_date: ('03/09/2015').to_datetime.end_of_day)

Project.create(set_token: SET_TWO_TOKEN, cost_type: :low, start_date: ('01/09/2015').to_datetime, end_date: ('01/09/2015').to_datetime.end_of_day)
Project.create(set_token: SET_TWO_TOKEN, cost_type: :high, start_date: ('02/09/2015').to_datetime, end_date: ('06/09/2015').to_datetime.end_of_day)
Project.create(set_token: SET_TWO_TOKEN, cost_type: :low, start_date: ('06/09/2015').to_datetime, end_date: ('08/09/2015').to_datetime.end_of_day)

Project.create(set_token: SET_THREE_TOKEN, cost_type: :low, start_date: ('01/09/2015').to_datetime, end_date: ('03/09/2015').to_datetime.end_of_day)
Project.create(set_token: SET_THREE_TOKEN, cost_type: :high, start_date: ('05/09/2015').to_datetime, end_date: ('07/09/2015').to_datetime.end_of_day)
Project.create(set_token: SET_THREE_TOKEN, cost_type: :high, start_date: ('08/09/2015').to_datetime, end_date: ('08/09/2015').to_datetime.end_of_day)

Project.create(set_token: SET_FOUR_TOKEN, cost_type: :low, start_date: ('01/09/2015').to_datetime, end_date: ('01/09/2015').to_datetime.end_of_day)
Project.create(set_token: SET_FOUR_TOKEN, cost_type: :low, start_date: ('01/09/2015').to_datetime, end_date: ('01/09/2015').to_datetime.end_of_day)
Project.create(set_token: SET_FOUR_TOKEN, cost_type: :high, start_date: ('02/09/2015').to_datetime, end_date: ('02/09/2015').to_datetime.end_of_day)
Project.create(set_token: SET_FOUR_TOKEN, cost_type: :high, start_date: ('02/09/2015').to_datetime, end_date: ('03/09/2015').to_datetime.end_of_day)