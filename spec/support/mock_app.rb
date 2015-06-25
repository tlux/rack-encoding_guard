class MockApp
  def initialize(*args)
    @status, @headers, @body = args
    @status = 200
    @headers ||= {}
    @body = Array(@body)
  end

  def call(env)
    [@status, @headers, @body]
  end
end
