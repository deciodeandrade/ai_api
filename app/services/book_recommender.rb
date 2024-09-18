class BookRecommender
  def self.call(genres:)
    prompt = generate_prompt(genres)
    ChatgptClient.call(prompt)
  end

  private

  def self.generate_prompt(genres)
    info = "Genres: #{genres.join(', ')}."
    
    <<~PROMPT
      Based on these genres:
      #{info}
      
      Please list exactly 5 different books from any book available worldwide that fit within these genres. You should include a diverse range of books, not limited to the most popular or previously recommended ones. 
  
      **Make sure to provide new recommendations that have not been suggested before**.
  
      **Your response should include only the titles of the books, without the author names**.
  
      Your response should be in the following format:
    
      {
        "recommendations": [
          {
            "name": "<book title>"
          },
          {
            "name": "<book title>"
          },
          {
            "name": "<book title>"
          },
          {
            "name": "<book title>"
          },
          {
            "name": "<book title>"
          }
        ]
      }
    PROMPT
  end
end
