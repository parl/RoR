class SendEmailJob
  include Sidekiq::Job

  def perform(user_id, book_id)
    user = User.find(user_id)
    book = Book.find(book_id)

    UserMailer.book_created_notification(user, book).deliver_now
  end
  # def perform(*args)
    # Do something
  # end
end
