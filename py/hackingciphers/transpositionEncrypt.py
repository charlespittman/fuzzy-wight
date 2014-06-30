# Transposition Cipher Encryption

import pyperclip


def main():
    myMessage = 'Common sense is not so common.'
    myKey = 8

    ciphertext = encryptMessage(myKey, myMessage)

    # Print the encrypted string in ciphertext to the screen, with a |
    # after it in case there are spaces at the end of the encrypted
    # message.
    print(ciphertext + '|')

    pyperclip.copy(ciphertext)


def encryptMessage(key, message):
    # Each string in ciphertext represents a column in the grid.
    ciphertext = [''] * key

    for col in range(key):
        pointer = col

        while pointer < len(message):
            # Place the character at pointer in message at the end of
            # the current column in the ciphertext list.
            ciphertext[col] += message[pointer]

            pointer += key

    return ''.join(ciphertext)

if __name__ == '__main__':
    main()
