import requests

# API = https://pastebin.com/doc_api#1

URL_API = "https://pastebin.com/api/api_post.php"
API_KEY = "0e5UgXF0crTdl9ceA0xrj-Lm75L8E-DY"

code = '''
pi = 3.14159
valor = float(input())
area = pi * (valor**2)
print('A={:.4f}'.format(area))
'''

data = {'api_dev_key':API_KEY, 
        'api_option':'paste',
        'api_paste_code':code,
        'api_paste_format':'python'}

r = requests.post(url = URL_API, data = data)

print(r.text)
