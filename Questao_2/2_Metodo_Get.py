import requests


URL_API = "https://api.giphy.com/v1/gifs/trending?api_key={API_KEY}"

search = input("PESQUISAR GIF: ")

url_search = "https://api.giphy.com/v1/gifs/trending?api_key=JS5DZKyuEx4mE0lYyVnDHbU949YjNGP7&q={search}&limit=5&offset=$_offset&rating=G&lang=en"

r = requests.get(url_search)

print(r.json)
print(r.url)
print(r.status_code)
