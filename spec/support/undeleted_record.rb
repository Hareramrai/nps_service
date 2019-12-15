shared_examples 'undeleted record not visible' do
  let(:klass_key) { described_class.to_s.underscore }
  
  describe '#delete!' do 
    let(:record) { create(klass_key) }

    it 'updates marked_as_deleted to true' do 
      record.delete! 
      expect(record.marked_as_deleted).to be_truthy
    end
  end

  describe '.undeleted' do 
    let(:record) { create(klass_key) }

    it 'does not include the deleted record' do 
      record.delete!

      expect(described_class.undeleted).not_to include(record)
    end
  end
end