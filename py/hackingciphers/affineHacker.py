# Affine Cipher Hacker

import pyperclip
import affineCipher
import detectEnglish
import cryptomath

SILENT_MODE = False


def main():
#    myMessage = """U&'<3dJ^Gjx'-3^MS'Sj0jxuj'G3'%j'<mMMjS'g{GjMMg9j{G'g"'gG '<3^MS'Sj<jguj'm'P^dm{'g{G3'%jMgjug{9'GPmG'gG'-m0'P^dm{LU'5&Mm{'_^xg{9"""
    myMessage = """PyB{5p;_&LzBJ5_`qBqLULzoLB&5B(LB{W``LqBAK&L``A<LK&BA6BA&B{5_`qBqL{LAoLBWBf_pWKBAK&5B(L`ALoAK<B&fW&BA&BJWUBf_pWKiPB?y`WKBR_zAK<"""

    hackedMessage = hackAffine(myMessage)

    if hackedMessage is not None:
        print('Copying hacked message to clipboard:')
        print(hackedMessage)
        pyperclip.copy(hackedMessage)
    else:
        print('Failed to hack encryption.')


def hackAffine(message):
    print('Hacking...')

    print('Press Ctrl-C or Ctrl-D to quit at any time.')

    # brute-fore by looping through every possible key
    for key in range(len(affineCipher.SYMBOLS) ** 2):
        keyA = affineCipher.getKeyParts(key)[0]
        if cryptomath.gcd(keyA, len(affineCipher.SYMBOLS)) != 1:
            continue

        decryptedText = affineCipher.decryptMessage(key, message)
        if not SILENT_MODE:
            print('Tried key %s... (%s)' % (key, decryptedText[:40]))

        if detectEnglish.isEnglish(decryptedText):
            # Check with the user if the decrypt key was correct.
            print()
            print('Possible encryption hack:')
            print('Key: %s' % (key))
            print('Decrypted message: ' + decryptedText[:200])
            print()
            print('Enter D for done, or Enter to continue:')
            response = input('> ')

            if response.strip().upper().startswith('D'):
                return decryptedText
    return None

if __name__ == '__main__':
    main()
