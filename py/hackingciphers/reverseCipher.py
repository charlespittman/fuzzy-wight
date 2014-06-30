# Reverse Cipher

#message = 'Three can keep a secret, iff two of them are dead.'
message = input('Enter message: ')
translated = ''

i = len(message) - 1
while  i >= 0:
    translated += message[i]
    i -= 1

print(translated)
