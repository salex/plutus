module Plutus
	# The Tenantable class allows Plutus to have multiple customers and keeps accounts
	# separated but using a simple implementation of multi-tenantcy.

	# To use it you must use the gem acts_as_tenant in your main application and set ActsAsTenant.current_tenant
	# to whatever model you are using by whatever means that is documented in acts_as_tenant. Subdomain was used
	# in the test/guide application.

	# Changes to Plutus models

	# 	A tenant_id was added to Account, Amount, Transaction
	# 		The Account tenant_id is not used at this point. An option to have different chart of accounts for
	# 		different customers may be added later, but for this initial release, each tenant is assumed to have
	# 		a common set of accounts.

	# 	A default scope is added to Amount and Transaction that does most of the heavy lifting
	# 		default_scope {where(tenant_id:Tenantable.tenant)}

	# 		Tenantable.tenant returns nil if ActsAsTenant is not installed or no current tenant is set, or else 
	# 		it returns the tenant instance you set.

	# 	A before_create filter was added to Amount and Transaction that sets the tenant_id if it is present
	# 		before_create :set_tenantable
	# 		def set_tenantable
	# 		  Tenantable.set_tenant(self)
	# 		end

	class Tenantable
		# Returns the current tenant instance is set in main application
		# Returns nil if ActsAsTenant is not installed or no current tenant set
		def self.tenant
			if defined?(ActsAsTenant)
				ActsAsTenant.current_tenant
			end
		end

		# Sets the tenant_id of Account or Transaction if current_tenant is set.
		# Used by the before_create filter.
		def self.set_tenant(instance)
			current_tenant = self.tenant
			if current_tenant.present?
				instance.tenant_id = current_tenant.id
			end
		end

		# A true/false method
		def self.is?
			self.tenant.present?
		end

		# Used by default_scope to set tenant_id to current_tenant instance or nil
		def self.filter_on_tenant(relation)
			relation = relation.where(tenant_id:self.tenant.id)			
		end
	end
end