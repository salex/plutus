class Tenant < ActiveRecord::Base
	Plutus::Amount.acts_as_tenant(:tenant)
	Plutus::Transaction.acts_as_tenant(:tenant)
end
