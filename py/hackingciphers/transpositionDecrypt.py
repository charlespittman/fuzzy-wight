# Transposition Cipher Decryption

import math
import pyperclip


def main():
    myMessage = 'Cenoonommstmme oo snnio. s s c'
    myKey = 8

    plaintext = decryptMessage(myKey, myMessage)

    # Print with a | after it in case there are spaces at the end of the
    # decrypted message.
    print(plaintext + '|')

    pyperclip.copy(plaintext)


def decryptMessage(key, message):
    # The transposition decrypt function will simulate he "columns" and "rows"
    # of the grid that the plaintext is written on by using a list of strings.

    numOfColumns = math.ceil(len(message) / key)
    numOfRows = key
    numOfShadedBoxes = (numOfColumns * numOfRows) - len(message)
    plaintext = [''] * numOfColumns

    col = 0
    row = 0

    for symbol in message:
        plaintext[col] += symbol
        col += 1

        # If there are no more columns OR we're at a shaded box, go back to the
        # first column and the next row.
        if (col == numOfColumns) or (col == numOfColumns - 1 and row >=
                                     numOfRows - numOfShadedBoxes):
            col = 0
            row += 1

    return ''.join(plaintext)

if __name__ == '__main__':
    main()
