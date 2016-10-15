class NodeBase
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  def data_attributes
    attributes.except('updated_at', 'created_at')
  end
end
