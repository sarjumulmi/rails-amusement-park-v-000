class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    string = ""
    if self.user.tickets<self.attraction.tickets && self.user.height<self.attraction.min_height
      string = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets<self.attraction.tickets
      string = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.user.height<self.attraction.min_height
      string = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      # binding.pry
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
    end

    string
  end

end
