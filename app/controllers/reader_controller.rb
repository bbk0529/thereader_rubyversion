class ReaderController < ApplicationController


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

  def detail
    @email = Email.find_by(id: params['id'])
  end

  def watson
        p '==========WATSON IN READER_CONTROLLER.RB================'
       @url="https://gateway.watsonplatform.net/personality-insights/api"
       @username="67b30adf-0dfd-4fcb-a80d-8b6c26813a26"
       @password="5WBfpVJag0Co"
       @input="한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다.한글 왓슨을 하하하 이거 정말 왜 이런지 모르겠네요. 테스트 중입니다."
       #@input = params['text']
       p @input

      response = Excon.post(@url + "/v3/profile",
      :body     => @input,
      :headers  => {
        "Content-Type"            => "text/plain",
        "Content-Language"        => "ko",
        "Accept-Language"         => "en"
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

    p '====================='
    p @senders
    p '====================='
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
