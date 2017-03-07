class BankAccount
    @@NumofAccounts = 0
    private
    def gen_acct
        acct = rand(10000..99999)
        return acct
    end

    def initialize chk_bal = 0, sav_bal = 0
        @chk_bal = chk_bal
        @sav_bal = sav_bal
        @acct_num = gen_acct
        @rate = 0.01
        @total = @chk_bal + @sav_bal
        @@NumofAccounts += 2
    end

    public
    def disp_chk_bal
        puts @chk_bal
        self
    end

    def disp_sav_bal
        puts @sav_bal
        self
    end

    def deposit_chk num
        @chk_bal += num
        @total = @chk_bal + @sav_bal
        self
    end

    def deposit_sav num
        @sav_bal += num
        @total = @chk_bal + @sav_bal
        self
    end

    def withdraw_chk num
        if num > @chk_bal
            puts "Broke ass bitcch! Don't have enough balance."
        else
            @chk_bal -= num
            @total = @chk_bal + @sav_bal
        end
        self
    end

    def withdraw_sav num
        if num > @sav_bal
            puts "Broke ass bitcch! Don't have enough balance."
        else
            @sav_bal -= num
            @total = @chk_bal + @sav_bal
        end
        self
    end

    def view_total
        @total = @chk_bal + @sav_bal
        puts @total
        self
    end

    def acct_info
        puts "The #{@acct_num} has combined balance of $#{@total}, checking account balance: $#{@chk_bal}, saving account balance: $#{@sav_bal}, and interet rate: #{@rate}"
        self
    end
end

myAcct = BankAccount.new
myAcct.deposit_sav(100).withdraw_chk(10)
myAcct.acct_info
