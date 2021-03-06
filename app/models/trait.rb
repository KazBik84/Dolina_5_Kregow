class Trait < ActiveRecord::Base

  validates :kind, :sphere, :name, :name_pl, :value ,presence: true
  validates_inclusion_of :kind, in: %w(Zaleta Wada)
  validates_inclusion_of :sphere, in: %w(Fizyczna Społeczna Duchowa Materialna Umysłowa)
  def self.find_traits(kind, types, values)
     if kind.nil? && types.nil? && values.nil? 
     	Trait.all
     elsif kind.present? && types.nil? && values.nil?
     	Trait.where(kind: kind)
     elsif kind.nil? && types.present? && values.nil?
     	Trait.where(sphere: types)
     elsif kind.present? && types.present? && values.nil?
     	Trait.where(kind: kind, sphere: types)
     elsif kind.nil? && types.nil? && values.present? 
      Trait.where('value && ARRAY[?]', values)
     elsif kind.present? && types.nil? && values.present? 
     	Trait.where(kind: kind).where('value && ARRAY[?]', values)
     elsif kind.nil? && types.present? && values.present?
     	Trait.where(sphere: types).where('value && ARRAY[?]', values)
     elsif kind.present? && types.present? && values.present?
     	Trait.where(kind: kind, sphere: types).where('value && ARRAY[?]', values)
     end
  end
end
