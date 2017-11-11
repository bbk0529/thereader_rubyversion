class ReaderController < ApplicationController
  def index
  end

  def detail
    @email = Email.find_by(id: params['id'])
  end

  def insert
  end

  def searchdata
    if params['keyword']
      @keyword=params['keyword']
      @emails=Email.where(["date LIKE ? OR sender LIKE ? OR subject LIKE ? OR text LIKE ?", "%#{@keyword}%", "%#{@keyword}%","%#{@keyword}%","%#{@keyword}%"])
    else
      @emails=Email.all
    end
  end

  def multidetail
    @ids=params['param'].split(',').to_a
    @emails=Email.where(id: @ids)
    @emails.each do |email|
      p email

    end
  end


  def summary
  end

  def insert_email
    @sender=params['sender']
    @date=params['date']
    @subject=params['subject']
    @text=params['text']
    @wordcount = @text.split.size
    Email.create(
      sender: @sender,
      date: @date,
      subject: @subject,
      text: @text,
      wordcount: @wordcount
    )
    redirect_to "/"
  end
end
