require 'rails_helper'

describe Card do
  let!(:user) { create(:user) }
  let!(:block) { create(:block, user_id: user.id) }
  let(:card) do
    build(:card,
          original_text: 'дом',
          translated_text: 'house',
          user_id: user.id,
          block_id: block.id)
  end

  context '#create' do
    context 'without' do
      it 'original text' do
        card.original_text = ''
        card.save
        expect(card.errors[:original_text]).to include('Необходимо заполнить поле.')
      end

      it 'translated text' do
        card.translated_text = ''
        card.save
        expect(card.errors[:translated_text]).to include('Необходимо заполнить поле.')
      end

      it 'texts' do
        card.original_text, card.translated_text = '', ''
        card.save
        expect(card.errors[:original_text]).to include('Вводимые значения должны отличаться.')
      end

      it 'user_id' do
        card.user_id = nil
        card.save
        expect(card.errors[:user_id]).to include('Ошибка ассоциации.')
      end

      it 'block_id' do
        card.block_id = nil
        card.save
        expect(card.errors[:block_id]).to include('Выберите колоду из выпадающего списка.')
      end
    end

    context 'with equel text' do
      it 'gives an error' do
        card.translated_text = 'дом'
        card.save
        expect(card.errors[:original_text]).to include('Вводимые значения должны отличаться.')
      end

      it 'no case sensitive, and gives error' do
        card.original_text, card.translated_text = 'Дом', 'доМ'
        card.save
        expect(card.errors[:original_text]).to include('Вводимые значения должны отличаться.')
      end
    end

    context 'with valid' do
      before { card.save }

      it 'original_text' do
        expect(card.original_text).to eq('дом')
      end

      it 'translated_text' do
        expect(card.translated_text).to eq('house')
      end

      it 'params, no errors' do
        expect(card.errors.any?).to be false
      end

      it '#set_review_date' do
        expect(card.review_date.strftime('%Y-%m-%d %H:%M')).to eq(Time.zone.now.strftime('%Y-%m-%d %H:%M'))
      end
    end
  end

  context '#check_translation' do
    it 'OK' do
      card.save
      check_result = card.check_translation('house')
      expect(check_result[:state]).to be true
    end

    it 'NOT' do
      card.save
      check_result = card.check_translation('RoR')
      expect(check_result[:state]).to be false
    end

    context '#full_downcase' do
      before do
        card.original_text, card.translated_text = 'ДоМ', 'hOuSe'
        card.save
      end

      it 'OK' do
        check_result = card.check_translation('HousE')
        expect(check_result[:state]).to be true
      end

      it 'NOT' do
        check_result = card.check_translation('RoR')
        expect(check_result[:state]).to be false
      end
    end

    context '#levenshtein_distance' do
      before { card.save }

      it 'OK' do
        check_result = card.check_translation('hous')
        expect(check_result[:state]).to be true
      end

      it '=1 OK' do
        check_result = card.check_translation('hous')
        expect(check_result[:distance]).to be 1
      end

      it '=2 NOT' do
        check_result = card.check_translation('RoR')
        expect(check_result[:state]).to be false
      end
    end
  end
end