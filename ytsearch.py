from youtubesearchpython import Search
import sys

text = ''
for i in range(1, len(sys.argv)):
    text = text + sys.argv[i] + ' '
#text = input("Song: ")
results = Search(text, limit = 1)
print(results.result()['result'][0]['link'])
# returns a dictionary
