require 'spec_helper'

module RubySMB
class Field
RSpec.describe LeafField do

  describe 'INHERITANCE' do
    let(:leaf_field) { LeafField.new }
    describe '#kind_of?' do
      it 'is a Field' do
        expect(leaf_field.kind_of? Field).to eql true
      end
    end
  end

  describe 'CONSTRUCTION' do
    context '#new() DEFAULTS' do
      let(:leaf_field) { LeafField.new }

      it 'sets n_bytes' do
        expect(leaf_field.n_bytes).to eql 0
      end

      it 'sets value to an empty string' do
        expect(leaf_field.value).to eql ''
      end
    end

    context '#new(args)' do
      let(:leaf_field) { LeafField.new(name: :of_glory,
                           n_bytes: 8,
                                       value: "\x02HOOrah\x00") }
      it 'sets name' do
        expect(leaf_field.name).to eql :of_glory
      end

      it 'sets n_bytes' do
        expect(leaf_field.n_bytes).to eql 8
      end

      it 'sets value' do
        expect(leaf_field.value).to eql "\x02HOOrah\x00"
      end
    end
  end

  describe 'WRITERS' do
    let(:leaf_field) { LeafField.new(n_bytes: 4) }

    describe '#n_bytes=' do

      it 'sets n_bytes' do
        # ap leaf_field
        # expect{leaf_field.n_bytes = 2}.to change{leaf_field.n_bytes}.from(4).to(2)
      end

      it 'updates value'
    end

    describe '#value=' do
      it 'sets value'
      it 'updates n_bytes'
    end
  end


  describe 'READERS' do
    describe '#binary_s' do
      context 'allocated > value' do
        let(:leaf_field) { LeafField.new(n_bytes: 8,
                                                      value: "\x02YOLO\x00") }
        it 'adds NULL padding'
      end

      context 'allocated = value' do
        let(:leaf_field) { LeafField(n_bytes: 6,
                                                      value: "\x02YOLO\x00") }
        it 'does NOT add NULL padding'
      end

      context 'allocated < value' do
         let(:leaf_field) { LeafField(n_bytes: 4,
                                                      value: "\x02YOLO\x00") }

         it 'truncates the value'
      end
    end
  end




end
end
end
