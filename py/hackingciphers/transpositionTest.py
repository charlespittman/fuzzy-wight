# Transposition Cipher Test

import random, sys, transpositionEncrypt, transpositionDecrypt

def main():
    random.seed(42) # set the random seed to a static value

    count = 0

    for i in range(20): # run 20 tests
        # Generate random messages to test

        # The message will have a random length:
        message = 'ABCDEFGHIJKLMNOPQRSTUVWXY' * random.randint(4, 40)

        # Convert string to list to shuffle
        message = list(message)
        random.shuffle(message)
        # Change it back to a string
        message = ''.join(message)

        print('Test #%s: "%s..."' % (i+1, message[:50]))

        # Check all possible keys for each message.
        for key in range(1, len(message)):
            count += 1
            encrypted = transpositionEncrypt.encryptMessage(key, message)
            decrypted = transpositionDecrypt.decryptMessage(key, encrypted)

            # If the decryption doesn't match original message,
            # display and error and quit.
            if message != decrypted:
                print('Mismatch with key %s and message %s.' % (key, message))
                print(decrypted)
                sys.exit()

    print('Transposition cipher test passed.')
    print('Ran %d times.' % count)

if __name__ == '__main__':
    main()
