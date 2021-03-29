class BookSerializer < ActiveModel::Serializer
    attributes :id, :title, :author, :summary, :img_url, :reviews

    def author
      author = "#{object.author.first_name} #{object.author.last_name}"
    end

    def reviews
      object.reviews.collect do |review|
        {:id => review.id, :title => review.title, :username => review.user.username, :content => review.content, :user_id => review.user_id, :date => review.date}
      end
    end

  end
  