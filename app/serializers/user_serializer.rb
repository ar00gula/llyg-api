class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :books, :reviews

  def books
    object.books.collect do |book|
      {:id => book.id, :title => book.title, :author => "#{book.author.first_name} #{book.author.last_name}", :summary => book.summary, :reviews => book.reviews}
    end
  end

end
