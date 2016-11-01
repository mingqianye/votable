class ResponseFactory
  def self.build(payload_hash, status = 'ok')
    {
      data: payload_hash,
      status: status
    }
  end
end
