# frozen_string_literal: true

every 5.day, at: '6:30 am' do
  runner 'Store.create_daily_payrolls'
end
