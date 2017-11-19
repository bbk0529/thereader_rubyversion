class CreatePis < ActiveRecord::Migration[5.1]
  def change
    create_table :pis do |t|
        t.string :sender
        t.float :"개방성"
        t.float :"모험성"
        t.float :"예술적 흥미"
        t.float :"정서성"
        t.float :"상상력"
        t.float :"지력"
        t.float :"권력에 저항"
        t.float :"성실성"
        t.float :"성취 추구"
        t.float :"신중함"
        t.float :"순종성"
        t.float :"질서 정연함"
        t.float :"자기 훈련"
        t.float :"자기 효능감"
        t.float :"외향성"
        t.float :"활동 레벨"
        t.float :"자신만만함"
        t.float :"쾌활"
        t.float :"자극 탐색"
        t.float :"외향적"
        t.float :"사교적"
        t.float :"친화성"
        t.float :"이타성"
        t.float :"협동성"
        t.float :"겸손함"
        t.float :"비타협성"
        t.float :"동정"
        t.float :"신뢰"
        t.float :"감정의 기복"
        t.float :"급한"
        t.float :"걱정이 많은"
        t.float :"우울한"
        t.float :"극단적인"
        t.float :"자의식이 강한"
        t.float :"스트레스에 민감한"

      t.timestamps
    end
  end
end