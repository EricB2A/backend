class User < ApplicationRecord

    VALID_NAME_REGEX = /\A[^0-9`!@#\$%\^&*+_=]+\z/

    has_secure_password

    validates :email,
              format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalide"},
              presence: true,
              uniqueness: true

    # TODO: confirmation: true
    validates :password, presence: true, length: {within: 6..42}

    validates :firstname,
              format: { with: VALID_NAME_REGEX, message: "incorrect, évitez les caractères spéciaux et les chiffres" },
              presence: true

    validates :lastname,
              format: { with: VALID_NAME_REGEX, message: "incorrect, évitez les caractères spéciaux et les chiffres" },
              presence: true

    has_many :folders, dependent: :destroy
end
