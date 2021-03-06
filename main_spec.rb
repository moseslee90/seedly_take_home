require './main'

RSpec.describe Main do
  let(:file_name) { 'notifications-test.json' }
  let(:user_id) { 'hackamorevisiting' }
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

  let(:notifications_map) do
    {46=>{2=>{"makerchorse"=>1574325866040, "backwarddusty"=>1574325959410}}, 37=>{1=>{"gratuitystopper"=>1574325903935}}, 36=>{3=>{"funeralpierce"=>1574325917276}}, 95=>{2=>{"makerchorse"=>1574326028535}}}
  end

  let(:grouped_notifications) do
    [{:to_print=>"[2019-11-21 08:44:26] makerchorse commented on a question", :date=>1574325866040}, {:to_print=>"[2019-11-21 08:45:59] backwarddusty commented on a question", :date=>1574325959410}, {:to_print=>"[2019-11-21 08:45:03] gratuitystopper answered a question", :date=>1574325903935}, {:to_print=>"[2019-11-21 08:45:17] funeralpierce upvoted a question", :date=>1574325917276}, {:to_print=>"[2019-11-21 08:47:08] makerchorse commented on a question", :date=>1574326028535}]
  end

  let(:sorted_notifications) do
    [{:to_print=>"[2019-11-21 08:44:26] makerchorse commented on a question", :date=>1574325866040}, {:to_print=>"[2019-11-21 08:45:03] gratuitystopper answered a question", :date=>1574325903935}, {:to_print=>"[2019-11-21 08:45:17] funeralpierce upvoted a question", :date=>1574325917276}, {:to_print=>"[2019-11-21 08:45:59] backwarddusty commented on a question", :date=>1574325959410}, {:to_print=>"[2019-11-21 08:47:08] makerchorse commented on a question", :date=>1574326028535}]
  end

  describe '#get_notifications_for_user' do
    it 'runs as expected' do
      expect(Utils).to receive(:read_file).with(
        file_name
      ).and_return(file)
      expect(Utils).to receive(:parse_json).with(
        file
      ).and_return(notifications_json)
      expect(subject).to receive(:generate_notifications_map).with(
        notifications_json, user_id
      ).and_return(notifications_map)
      expect(subject).to receive(:group_notifications).with(
        notifications_map
      ).and_return(grouped_notifications)
      expect(subject).to receive(:sort_notifications_by_date).with(
        grouped_notifications
      ).and_return(sorted_notifications)
      expect(subject).to receive(:print_notifications).with(
        sorted_notifications
      )
      subject.send(:get_notifications_for_user, file_name, user_id)
    end
  end

  describe '#generate_notifications_map' do
    it 'generates a map of notifications from array of notifications' do
      expect(Main.new.generate_notifications_map(notifications_json, user_id)).to eq(
        notifications_map
      )
    end
  end

  describe '#group_notifications' do
    it 'groups notifications responding to the same question in the same type together if they are less than 30s apart' do
      expect(Main.new.group_notifications(notifications_map)).to eq(
        grouped_notifications
      )
    end
  end

  describe 'sort_notifications_by_date' do
    it 'sorts grouped notifications by date from earliest to latest' do
      expect(Main.new.sort_notifications_by_date(grouped_notifications)).to eq(
        sorted_notifications
      )
    end
  end
end
