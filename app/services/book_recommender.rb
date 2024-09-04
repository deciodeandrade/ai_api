class BookRecommender
  def self.call(user:, books:)
    prompt = generate_prompt(user, books)
    response = ChatgptClient.call(prompt)
    parse_response(response, books)
  end

  private

  def self.generate_prompt(user, books)
    user_info = "User info: #{user[:name]}, Age: #{user[:age]}, Preferences: #{user[:preferences].join(', ')}."
    
    books_info = books.map do |book|
      "Book ID: #{book[:id]}, Title: '#{book[:title]}', Authors: #{book[:authors].join(', ')}, Genres: #{book[:genres].join(', ')}, Description: #{book[:description]}."
    end.join("\n")

    <<~PROMPT
      Based on the user information:
      #{user_info}

      And the following list of books:
      #{books_info}

      Please select exactly 3 books from the list that would be the best fit for the user. For each selected book, provide a brief explanation of why it was chosen for this user. Make sure to choose exactly 3 books.

      Your response should be in the following format:
      - Book ID: <book_id>
      - Recommendation: <reason for recommendation>
    PROMPT
  end

  def self.parse_response(response, books)
    # Divide a resposta por linhas e extraia o ID do livro e a recomendação associada
    lines = response.split("\n").reject(&:empty?)
    recommendations = []

    lines.each_slice(2) do |book_id_line, recommendation_line|
      if book_id_line&.start_with?("- Book ID:")
        book_id = book_id_line.split(":").last.strip.to_i
        recommendation = recommendation_line&.split(":")&.last&.strip || "No recommendation found."
        recommendations << { id: book_id, recommendation: recommendation }
      end
    end

    # Garantir que o número de recomendações seja exatamente 3
    if recommendations.size < 3
      recommendations += Array.new(3 - recommendations.size) { |i| { id: nil, recommendation: "No additional recommendations found." } }
    end

    { recommendations: recommendations }
  end
end
