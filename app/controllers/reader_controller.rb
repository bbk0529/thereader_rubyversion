class ReaderController < ApplicationController
    protect_from_forgery

  def index
  end

  def import
  end

  def readPI
    sender=Metapi.find_by(sender: params['sender'])
    p sender.id
    @PI=Pi.find(sender.id)
    render :json => @PI
  end

  def destroy
      Email.find(params[:id]).destroy
      redirect_to '/reader/searchdata'


  end

  def detail
    @email = Email.find(params['id'])
  end

  def watson
       @url="https://gateway.watsonplatform.net/personality-insights/api"
       @username="67b30adf-0dfd-4fcb-a80d-8b6c26813a26"
       @password="5WBfpVJag0Co"
       @input = params['text']
       @language =params['language']

      response = Excon.post(@url + "/v3/profile",
      :body     => @input,
      :headers  => {
        "Content-Type"            => "text/plain",
        "Content-Language"        =>  @language,
        "Accept-Language"         => "ko"
      },
      :query    => {
        "raw_scores"              => true,
        "consumption_preferences" => true,
        "version"                 => "10-20-2016"
      },
      :user                       => @username,
      :password                   => @password)
    @PI={"sender" => params['sender']}
    @result=(JSON.parse(response.body))['personality']
    @result.each do |arr|
      @PI[arr['name']] = arr['percentile'].round(4)
       arr['children'].each do |feat|
         @PI[feat['name']] = feat['percentile'].round(4)
       end
    end
    p @PI
    Pi.create(@PI)
    Metapi.create(
      sender: params['sender'],
      date: params['date']
              )
    render :json => @PI

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
    @email=Email.find(@ids[0])
    @emails=Email.where(id: @ids)
    @emails.each do |email|
      p email

    end
  end


  def summary
    @senders=[]
    result=Metapi.select('sender').distinct
    result.each do |row|
      p row.sender
      @senders.push(row.sender)
    end
  end

  def insert_email
    @sender=params['sender']
    @date=params['date']
    @subject=params['subject']
    @text=params['text']
    @wordcount = @text.split.size
    @language=params['langauge']
    Email.create(
      sender: @sender,
      date: @date,
      subject: @subject,
      text: @text,
      wordcount: @wordcount,
      language: @language
    )
    redirect_to "/"
  end
end
