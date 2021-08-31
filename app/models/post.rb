class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"] }
    validate :clickbait

    def clickbait
        cb = ["Won't Believe", "Secret", "Top", "Guess"]
        unless title.match? ("Won't Believe" )
            errors.add(:title, 'must be clickbait')
        end
    end
end
