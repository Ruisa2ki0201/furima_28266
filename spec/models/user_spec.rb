require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての情報が存在していれば登録できる' do
        expect(@user).to be_valid
      end

      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailに＠が含まれていないと登録できない' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'emailが重複すると登録できない' do
        @user2 = FactoryBot.create(:user)
        @user.email = 'test@com'
        @user.valid?
        expect(@user.errors[:email]).to include("はすでに存在します")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません", "は半角英数字混合であること")
      end

      it 'passwordとpassword_confirmationが6文字以上で登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationは６文字以下だと登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors[:password]).to include("は6文字以上で入力してください")
      end

      it 'passwordは半角英数字混合でないと登録できない' do
        @user.password = '１１１１１１'
        @user.password_confirmation = '１１１１１１'
        @user.valid?
        expect(@user.errors[:password]).to include('は半角英数字混合であること')
        expect(@user.errors[:password_confirmation]).to include('は半角英数字混合であること')
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors[:birthday]).to include("を入力してください")
      end

      it 'surnameが空だと登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors[:surname]).to include("を入力してください")
      end

      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors[:name]).to include("を入力してください")
      end

      it 'phonetic_surnameが空だと登録できない' do
        @user.phonetic_surname = ''
        @user.valid?
        expect(@user.errors[:phonetic_surname]).to include("を入力してください")
      end

      it 'phonetic_nameが空だと登録できない' do
        @user.phonetic_name = ''
        @user.valid?
        expect(@user.errors[:phonetic_name]).to include("を入力してください")
      end

      it 'phonetic_surnameがカタカナでないと登録できない' do
        @user.phonetic_surname = 'やまだ'
        @user.valid?
        expect(@user.errors[:phonetic_surname]).to include('は全角カタカナのみで入力してください')
      end

      it 'phonetic_nameがカタカナでないと登録できない' do
        @user.phonetic_name = 'たろう'
        @user.valid?
        expect(@user.errors[:phonetic_name]).to include('は全角カタカナのみで入力してください')
      end
    end
  end
end
