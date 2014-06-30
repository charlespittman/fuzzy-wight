# Caesar Cipher Hacker

import pyperclip

message = 'GUVF VF ZL FRPERG ZRFFNTR.'
message = input('Enter message: ')

LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

for key in range(len(LETTERS)):
    translated = ''

    for symbol in message:
        if symbol in LETTERS:
            num = LETTERS.find(symbol)
            num -= key

            if num < 0:
                num += len(LETTERS)

            translated += LETTERS[num]
        else:
            # just add symbol without encrypting/decrypting
            translated += symbol

    print('Key #%s: %s' % (key, translated))
pyperclip.copy(translated)
