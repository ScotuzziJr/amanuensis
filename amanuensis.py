import os, json, lz4.block

f = open(os.environ['opentabs'], 'rb')
magic = f.read(8)
jdata = json.loads(lz4.block.decompress(f.read()).decode('utf-8'))
f.close()

with open('saved_urls.txt', 'w') as file:
    for win in jdata['windows']:
        for tab in win['tabs']:
            i = int(tab['index']) - 1
            urls = tab['entries'][i]['url']
            file.write(f'{urls}\n')
            print(urls)
