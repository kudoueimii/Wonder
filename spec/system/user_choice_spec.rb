require 'rails_helper'
RSpec.describe 'ウィザード形式の選択', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:dog) { FactoryBot.create(:dog) }
  describe do
    before do
      visit new_user_session_path
      fill_in "user_name", with: 'testuser'
      fill_in "user_email",	with: 'testuser@example.com'
      fill_in "user_password",	with: 'testuser'
      click_on "commit"
    end
    describe do
      context 'マッチング機能' do
        it '次のページへ移動' do
          visit first_user_steps_path
          choose('user_choice_vehicle_car')
          click_button "commit"
          expect(page).to have_content 'こまめなお掃除が'
        end
      end
      context 'マッチング機能' do
        it '次のページ移動しない' do
          visit first_user_steps_path
          click_button "commit"
          expect(page).to have_content 'ふだん'
        end
      end
    end
    describe do
      context 'マッチング機能' do
        it '選択し次のページへ移動、相性結果へ' do
          visit first_user_steps_path
          choose('user_choice_vehicle_car')
          click_button "commit"
          choose('user_choice_cleaning_like')
          click_button "commit"
          choose('user_choice_active_like')
          click_button "commit"
          choose('user_choice_exercise_like')
          click_button "commit"
          choose('user_choice_home_kids')
          click_button "commit"
          choose('user_choice_house_owned')
          click_button "commit"
          expect(page).to have_content '100'
        end
      end
    end
  end
end
