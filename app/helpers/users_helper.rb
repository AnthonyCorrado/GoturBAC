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
  @drinktime =  (Time.now - $starttime)/ 60

# user_drinks are reset if drinktime hits 12 hours. Easy if not elegant fix until I can get drinks to
# clear on session destroy. Beginning to think drinks should have been tied to sessions rather
# than users (DRINKING SESSIONS!!!!)
if @drinktime > 720

  current_user.user_drinks.clear

end
# Add alcohol content of every user_drink to be used in BAC calc
$total_alcohol = 0

current_user.user_drinks.each do |d|

  $total_alcohol = $total_alcohol + d.drink.alcohol

end

# current_users BAC is set by multiplying alcohol by the density of alcohol compared to water,
# and then dividing that amount by the users weight. You then find the product of time spent
# drinking and the average amount of alcohol a person can process in a minute, and subtract
#it
current_user.current_bac = ($total_alcohol * 7.5 / current_user.weight) - (@drinktime * 0.00025)

# Prevent BAC from displaying negative
if current_user.current_bac < 0

  current_user.current_bac = 0

end

end

end
