class NodeBase
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  def self.upkeep(instance)
    raise 'Cannot call upkeep on base class' if instance.class == NodeBase
    raise 'Cannot upkeep if nothing_id is missing' if attrs['uuid'].blank?
    attrs = instance.attributes.compact
    entity = find_or_create(id: attrs['id'])
    entity.assign_attributes(attrs)
    entity.save if entity.changed?
    entity
  end
  
  def upkeep
    self.class.upkeep(self)
  end
end
