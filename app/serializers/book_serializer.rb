class BookSerializer < ActiveModel::Serializer
    attributes :id, :title, :author, :summary, :img_url, :reviews

    def author
      author = "#{object.author.first_name} #{object.author.last_name}"
    end

  end
  