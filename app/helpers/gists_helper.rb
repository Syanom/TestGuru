module GistsHelper
  def gist_question(gist)
    gist.question.body.turncate(25)
  end

  def gist_hash(gist)
    gist.url.split('/').last
  end
end
