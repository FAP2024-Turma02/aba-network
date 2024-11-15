class DomainSerializer < ApplicationSerializer
    def self.call(domain) 
      base_data = {
        domain_url: domain.domain_url
      }
  
      base_data.merge(serialize_timestamps(domain))
    end
  end
  