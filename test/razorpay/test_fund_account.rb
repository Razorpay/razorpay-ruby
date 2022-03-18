require 'test_helper'

module Razorpay
  # Tests for Razorpay::FundAccount
  class RazorpayFundAccountTest < Minitest::Test
    def setup
      @customer_id = 'cust_J3oSNi1KgzqVEX'
      @fund_account_id = 'fa_J8B38pGr1Tfv8k'
     
      stub_get(/fund_accounts$/, 'fund_account_collection')
    end

    def test_customer_should_be_defined
      refute_nil Razorpay::FundAccount
    end

    def test_fund_account_should_be_created

      param_attr = {
        "customer_id": "cust_Aa000000000001",
        "account_type": "bank_account",
        "bank_account": {
          "name": "Gaurav Kumar",
          "account_number": "11214311215411",
          "ifsc": "HDFC0000053"
        }
      }   

      stub_post(/fund_accounts$/, 'fake_fund_account', param_attr.to_json)
      fund_account = Razorpay::FundAccount.create param_attr.to_json
      assert_equal @customer_id, fund_account.customer_id
      assert_equal @fund_account_id, fund_account.id
    end    
  end
end
