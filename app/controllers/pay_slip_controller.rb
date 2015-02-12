class PaySlipController < ApplicationController
  def show

pdf = Prawn::Document.new
   

    pdf.text "Dear Irfan,"
    pdf.move_down 20
    pdf.text "Your salary for the month of January has been transferred to the bank account that your 
    shared with us at the time of joining. The amount of 7,500 INR should be credited to your account before 
    the end of the day. Do confirm when you receive the said amount by replying back to the email."

    pdf.move_down 10
    pdf.text "Thank you for the hard work you have put in so far. We expect you to continue improve
              yourself and continue to be a valuable asset to the team."

    pdf.move_down 10
    pdf.text "regards,"
    pdf.move_down 10
    pdf.text "Harisankar P. S.\n
              Founder and C.E.O,\n
              Red Panthers Software Solutions,"
    
    pdf.encrypt_document(
      :user_password  => 'user', 
      :owner_password => "test")
     
    
    respond_to do |format|
      format.html
      format.pdf do
        send_data pdf.render, :filename => "x.pdf", :type => "application/pdf", :disposition => 'inline'
      end
    end
  end
end
