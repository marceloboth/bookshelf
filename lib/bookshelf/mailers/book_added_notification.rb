module Mailers
  class BookAddedNotification
    include Hanami::Mailer

    from    'no-reply@example.com'
    to      'admin@example.com'
    subject 'Book added!'
  end
end
