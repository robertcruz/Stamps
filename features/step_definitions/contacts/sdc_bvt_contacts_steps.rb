Then /^temp$/ do
  us_states = data_for(:us_states, {})
  state_values = us_states.values
  state_abbr = us_states.keys
  state_value = us_states['OH']
  state_key = us_states.key('Ohio')
end
