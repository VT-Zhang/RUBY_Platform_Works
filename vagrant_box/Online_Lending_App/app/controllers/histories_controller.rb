class HistoriesController < ApplicationController
  before_action :require_login
  def create
        history = History.new(lender: current_lender, borrower_id: params[:id], amount: params[:amount])
        borrower = Borrower.find(params[:id])
        new_balance = current_lender.money.to_i - params[:amount].to_i
        new_raised = borrower.raised + params[:amount].to_i

        if history.valid? && new_balance > 0
            history.save
            current_lender.update(money: new_balance)
            borrower.update(raised: new_raised)
            redirect_to "/lender/#{current_lender.id}"
        elsif history.valid? && new_balance < 0
            flash[:errors] = ["Insufficient fund to lend.."]
            redirect_to "/lender/#{current_lender.id}"
        elsif history.valid? == false
            flash[:errors] = history.errors.full_messages
            redirect_to "/lender/#{current_lender.id}"
        end
  end
end
