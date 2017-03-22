require_relative 'bank_account'

RSpec.describe BankAccount do
    before (:each) do
    end
        it 'has a getter method for retrieving the checking account balance' do
            account=BankAccount.new
            expect(account.disp_chk_bal).to eq(0)
        end

        it 'has the function to allow user withdraw cash' do
            account=BankAccount.new
            expect{account.withdraw_chk}.to_not raise_error(NoMethodError)
        end

        it 'raise an error if try to withdraw more money that the balance' do
            account=BankAccount.new
            expect{account.withdraw_chk()}.to raise_error(ArgumentError)
        end

        it 'raise an error if attempts to call the getter method for the number of bank account' do
            account=BankAccount.new
            expect{account.acct}.to raise_error(NoMethodError)
        end

        it 'raise an error if attempts to set the interests rate' do
            account=BankAccount.new
            expect{account.rate=0.02}.to raise_error(NoMethodError)
        end
    end
