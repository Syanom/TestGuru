class GistQuestionService
  ACCESS_TOKEN = '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'.freeze

  def initialize(question)
    @question = question
    @test = @question.test
    @client = setup_http_client
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    true
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
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
    @client = Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
