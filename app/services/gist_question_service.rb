class GistQuestionService
  Result = Struct.new(:url) do
    def success?
      !url.nil?
    end
  end

  def initialize(question)
    @question = question
    @test = @question.test
    @client = setup_http_client
  end

  def call
    Result.new(@client.create_gist(gist_params).html_url)
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
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def setup_http_client
    @client = Octokit::Client.new(access_token: ENV.fetch('GITHUB_GIST_ACCESS_TOKEN'))
  end
end
