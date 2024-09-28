class Domain < ApplicationRecord
    validates: :domain_url, presence: true, uniquess: true
end
