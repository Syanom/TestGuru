module GistsHelper
  def gist_question(gist)
    gist.question.body[0, 25]
  end

  def gist_hash(gist)
    gist.url.split('/').last
  end
end
