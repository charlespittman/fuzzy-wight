# Caesar Cipher

import pyperclip

message = 'This is my secret message.'

key = 13

mode = 'encrypt' # set to encrypt or decrypt

# Every possible symbol that can be encrypted
LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

translated = ''

message = message.upper()

for symbol in message:
    if symbol in LETTERS:
        num = LETTERS.find(symbol)
        if mode == 'encrypt':
            num += key
        elif mode == 'decrypt':
            num -= key

        if num >= len(LETTERS):
            num -= len(LETTERS)
        elif num < 0:
            num += len(LETTERS)

        # add encrypted/decrypted number's symbol at the end of translated
        translated += LETTERS[num]
    else:
        # just add symbol without encrypting/decrypting
        translated += symbol

print(translated)
pyperclip.copy(translated)
