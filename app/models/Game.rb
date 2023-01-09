class Game < ActiveRecord::Base
    has_many :reviews

    def average_score 
        scores = self.reviews.map(&:score)
        avg_score = scores.sum / scores.length
        avg_score
    end

end

