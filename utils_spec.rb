require './utils'

RSpec.describe '#Utils.read_file' do
  let(:file_name) { 'notifications-test.json' }
  let(:file) do
    "[{\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 2,\n  \"sender_id\": \"makerchorse\",\n  \"sender_type\": \"User\",\n  \"target_id\": 46,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574325866040\n}, {\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 1,\n  \"sender_id\": \"gratuitystopper\",\n  \"sender_type\": \"User\",\n  \"target_id\": 37,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574325903935\n}, {\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 3,\n  \"sender_id\": \"funeralpierce\",\n  \"sender_type\": \"User\",\n  \"target_id\": 36,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574325917276\n}, {\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 2,\n  \"sender_id\": \"hackamorevisiting\",\n  \"sender_type\": \"User\",\n  \"target_id\": 46,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574325959410\n}, {\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 2,\n  \"sender_id\": \"backwarddusty\",\n  \"sender_type\": \"User\",\n  \"target_id\": 46,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574325959410\n}, {\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 2,\n  \"sender_id\": \"makerchorse\",\n  \"sender_type\": \"User\",\n  \"target_id\": 95,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574326028535\n}]\n"
  end
  it 'reads a file' do
    expect(Utils.read_file(file_name)).to eq(
      file
    )
  end
end

RSpec.describe '#Utils.get_date_string' do
  let(:date) { 1574325866040 }
  let(:date_string) { "2019-11-21 08:44:26" }
  it 'gets formatted date string from date' do
    expect(Utils.get_date_string(date)).to eq(
      date_string
    )
  end
end

RSpec.describe '#Utils.parse_json' do
  let(:file) do
    "[{\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 2,\n  \"sender_id\": \"makerchorse\",\n  \"sender_type\": \"User\",\n  \"target_id\": 46,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574325866040\n}, {\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 1,\n  \"sender_id\": \"gratuitystopper\",\n  \"sender_type\": \"User\",\n  \"target_id\": 37,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574325903935\n}, {\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 3,\n  \"sender_id\": \"funeralpierce\",\n  \"sender_type\": \"User\",\n  \"target_id\": 36,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574325917276\n}, {\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 2,\n  \"sender_id\": \"hackamorevisiting\",\n  \"sender_type\": \"User\",\n  \"target_id\": 46,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574325959410\n}, {\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 2,\n  \"sender_id\": \"backwarddusty\",\n  \"sender_type\": \"User\",\n  \"target_id\": 46,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574325959410\n}, {\n  \"user_id\": \"hackamorevisiting\",\n  \"notification_type_id\": 2,\n  \"sender_id\": \"makerchorse\",\n  \"sender_type\": \"User\",\n  \"target_id\": 95,\n  \"target_type\": \"Question\",\n  \"created_at\": 1574326028535\n}]\n"
  end
  let(:notifications_json) do
    [
      {
        user_id: 'hackamorevisiting',
        notification_type_id: 2,
        sender_id: 'makerchorse',
        sender_type: 'User',
        target_id: 46,
        target_type: 'Question',
        created_at: 1574325866040
      }, {
        user_id: 'hackamorevisiting',
        notification_type_id: 1,
        sender_id: 'gratuitystopper',
        sender_type: 'User',
        target_id: 37,
        target_type: 'Question',
        created_at: 1574325903935
      }, {
        user_id: 'hackamorevisiting',
        notification_type_id: 3,
        sender_id: 'funeralpierce',
        sender_type: 'User',
        target_id: 36,
        target_type: 'Question',
        created_at: 1574325917276
      }, {
        user_id: 'hackamorevisiting',
        notification_type_id: 2,
        sender_id: 'hackamorevisiting',
        sender_type: 'User',
        target_id: 46,
        target_type: 'Question',
        created_at: 1574325959410
      }, {
        user_id: 'hackamorevisiting',
        notification_type_id: 2,
        sender_id: 'backwarddusty',
        sender_type: 'User',
        target_id: 46,
        target_type: 'Question',
        created_at: 1574325959410
      }, {
        user_id: 'hackamorevisiting',
        notification_type_id: 2,
        sender_id: 'makerchorse',
        sender_type: 'User',
        target_id: 95,
        target_type: 'Question',
        created_at: 1574326028535
      }
    ]
  end
  it 'returns a hash with hashed keys' do
    expect(Utils.parse_json(file)).to eq(
      notifications_json
    )
  end
end
