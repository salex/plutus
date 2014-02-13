Tenant.create(name:"Customer 1", subdomain:"cust1")
Tenant.create(name:"Customer 2", subdomain:"cust2")

Plutus::Asset.create(:name => "Accounts Receivable")
Plutus::Revenue.create(:name => "Sales Revenue")
Plutus::Liability.create(:name => "Sales Tax Payable")
Plutus::Equity.create(:name => "Drawing", :contra => true)
Plutus::Asset.create(:name => "Cash")

ActsAsTenant.current_tenant = Tenant.first

transaction = Plutus::Transaction.build(
                :description => "cust1 Sold some widgets",
                :debits => [
                  {:account => "Accounts Receivable", :amount => 50}], 
                :credits => [
                  {:account => "Sales Revenue", :amount => 45},
                  {:account => "Sales Tax Payable", :amount => 5}])
transaction.save
               
transaction = Plutus::Transaction.build(
                :description => "cust1 Owner withdrawing cash",
                :debits => [
                  {:account => "Drawing", :amount => 1000}], 
                :credits => [
                  {:account => "Cash", :amount => 1000}])
transaction.save                  

ActsAsTenant.current_tenant = Tenant.last

transaction = Plutus::Transaction.build(
                :description => "cust2 Sold some widgets",
                :debits => [
                  {:account => "Accounts Receivable", :amount => 100}], 
                :credits => [
                  {:account => "Sales Revenue", :amount => 90},
                  {:account => "Sales Tax Payable", :amount => 10}])
transaction.save
                  
transaction = Plutus::Transaction.build(
                :description => "cust2 Owner withdrawing cash",
                :debits => [
                  {:account => "Drawing", :amount => 500}], 
                :credits => [
                  {:account => "Cash", :amount => 500}])
transaction.save

