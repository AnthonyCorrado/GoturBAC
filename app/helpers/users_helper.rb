module UsersHelper


# Different messages for different levels of drunkeness
  def bac_message
    if (0.25 <= current_user.current_bac)
        bac_message = "Ya done good kiddo, but now it's time to stop before you go into a coma."
    elsif  (current_user.current_bac >= 0.18)
        bac_message = "Puke! Puke! Puke! Puke! Puke! Puke! Puke! Puke! Puke!"
    elsif (current_user.current_bac >= 0.12)
        bac_message = "You know what sounds fun right now? Sprinting with your eyes closed."
    elsif (current_user.current_bac >= 0.08)
        bac_message = "You are technically drunk, and that makes you sexy."
    elsif (current_user.current_bac >= 0.06)
        bac_message = "Almost drunk! Reach for that ethanol rainbow!"
    elsif (current_user.current_bac >= 0.03)
        bac_message = "Slightly buzzed. Keep going til the voices stop!"
    elsif ( current_user.current_bac >= 0.01)
        bac_message = "Drink up, you dumb sober baby."
    else
        bac_message = "Oh boy. Sobriety."
    end

  end

# How BAC is calculated
def bac_calculate

  # Time at user show page load minus global variable start time set at new session load,
  # divided by 60 so units are in minutes

if current_user.user_drinks == 0
current_user.start_time = Time.now
current_user.start_time.save
# Props to Eric!!!!
end


current_user.drink_time =  (Time.now - $starttime)/ 60




# Add alcohol content of every user_drink to be used in BAC calc
current_user.total_alcohol = 0

current_user.user_drinks.each do |d|

current_user.total_alcohol = current_user.total_alcohol + d.drink.alcohol

end

# current_users BAC is set by multiplying alcohol by the density of alcohol compared to water,
# and then dividing that amount by the users weight. You then find the product of time spent
# drinking and the average amount of alcohol a person can process in a minute, and subtract
#it
current_user.current_bac = (current_user.total_alcohol * 7.5 / current_user.weight) - (current_user.drink_time * 0.00025)

# Prevent BAC from displaying negative
if current_user.current_bac < 0

  current_user.current_bac = 0

end

end

end
