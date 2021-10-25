require 'pry'
require 'csv'
require 'open-uri'

require_relative './controller'


class Gossip

  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  # pour enregistrer le formulaire dans un CSV  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  # Pour lire un CSV
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  # Pour indentifier l'ID des ligne du CSV
  def self.find(id)
    return Gossip.all[id.to_i]
  end 


end