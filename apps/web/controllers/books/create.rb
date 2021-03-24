module Web
  module Controllers
    module Books
      class Create
        include Web::Action

        expose :book

        params do
          required(:book).schema do
            required(:title).filled(:str?)
            required(:author).filled(:str?)
          end
        end

        def initialize(interactor: AddBook.new)
          @interactor = interactor
        end

        def call(params)
          if params.valid?
            @book = @interactor.call(params[:book])

            redirect_to routes.books_path
          else
            self.status = 422
          end
        end
      end
    end
  end
end
