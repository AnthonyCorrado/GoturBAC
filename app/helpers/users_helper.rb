module UsersHelper

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
            bac_message = "Slightly buzzed. Keep going until life stops hurting!"
        elsif (0.03  >= current_user.current_bac)
            bac_message = "Drink up, you dumb sober baby."
        else (current_user.current_bac == 0)
            bac_message = "Oh boy. Sobriety."
        end

  end

def bac_calculate
 @drinktime =  (Time.now - $starttime)/ 60

if @drinktime > 720

current_user.user_drinks.clear

end

$total_alcohol = 0

current_user.user_drinks.each do |d|

$total_alcohol = $total_alcohol + d.drink.alcohol

end

current_user.current_bac = ($total_alcohol * 7.5 / current_user.weight) - (@drinktime * 0.00025)

if current_user.current_bac < 0

current_user.current_bac = 0

end

end

end
