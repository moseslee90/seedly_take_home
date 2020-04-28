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
