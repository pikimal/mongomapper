class Address
  include MongoMapper::EmbeddedDocument
  key :address, String
  key :city,    String
  key :state,   String
  key :zip,     Integer
end

class Project
  include MongoMapper::Document
  key :name, String
  many :statuses
  many :addresses
end

class Status
  include MongoMapper::Document
  belongs_to :project
  belongs_to :target, :polymorphic => true
  key :name, String
end

class RealPerson
  include MongoMapper::Document
  many :pets  
  key :name, String
end

class Person
  include MongoMapper::EmbeddedDocument
  key :name, String
  key :child, Person
  many :pets
end

class Pet
  include MongoMapper::EmbeddedDocument
  key :name, String
  key :species, String
end

class Media
  include MongoMapper::EmbeddedDocument
  key :file, String
end

class Video < Media
  key :length, Integer
end

class Image < Media
  key :width, Integer
  key :height, Integer
end

class Music < Media
  key :bitrate, String
end

class Catalog
  include MongoMapper::Document
  many :medias, :polymorphic => true
end

module TrModels
  class Transport
    include MongoMapper::EmbeddedDocument
    key :license_plate, String
  end
  
  class Car < TrModels::Transport
    include MongoMapper::EmbeddedDocument
    key :model, String
    key :year, Integer
  end
  
  class Bus < TrModels::Transport
    include MongoMapper::EmbeddedDocument
    key :max_passengers, Integer
  end
  
  class Ambulance < TrModels::Transport
    include MongoMapper::EmbeddedDocument
    key :icu, Boolean
  end
  
  class Fleet
    include MongoMapper::Document
    many :transports, :polymorphic => true, :class_name => "TrModels::Transport"
    key :name, String    
  end
end