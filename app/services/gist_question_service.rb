class GistQuestionService
  def initialize(question)
    @question = question
    @test = @question.test
    @client = setup_http_client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def setup_http_client
    @client = Octokit::Client.new(access_token: ENV['GITHUB_GIST_ACCESS_TOKEN'])
  end
end
