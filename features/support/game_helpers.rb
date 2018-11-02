module GameHelpers
  def set_rafflable_words(words)
    @raffable_words = words
  end

  def start_new_game
    set_rafflable_words(%w[hi mom game fruit]) if @raffable_words.nil?

    run("forca \"#{@raffable_words}\"")
  end
end

World(GameHelpers)
