
import requests
import brotli
import json

url = "https://app.myjotbot.com/api/transcribe/youtube"
headers = {
    "Accept": "*/*",
    "Accept-Encoding": "gzip, deflate, br",
    "Accept-Language": "en-us",
    "Connection": "keep-alive",
    "Content-Length": "45",
    "Content-Type": "application/json",
    "Cookie": "_fbp=fb.1.1722224834476.61224286083055097; _ga_87RPPM7GRR=GS1.1.1722224834.1.1.1722225343.0.0.0; ph_phc_xBosngPE8Wjb81LQK1tXIiiK8NU3CwMnBU3i0qX9Tjh_posthog=%7B%22distinct_id%22%3A%22AA69PcwgABbb7A0yWxZpweERcf42%22%2C%22%24sesid%22%3A%5B1722225338148%2C%220190fc99-73d4-7c59-b0a7-3ea9860f3511%22%2C1722224833492%5D%2C%22%24session_is_sampled%22%3Atrue%7D; _scid=77dcca42-8666-4edc-b9a0-e7f6b2a8168d; _scid_r=77dcca42-8666-4edc-b9a0-e7f6b2a8168d; _screload=; _gcl_au=1.1.2124503867.1722224834; __stripe_mid=6fa1550e-491b-40fd-b246-55c00650f06f063927; __stripe_sid=71976d2b-8b6e-4c0a-8b4b-9eca8f85790cd3ee9b; _ga=GA1.1.897733537.1722224834; _tt_enable_cookie=1; _ttp=NbfAa9UIOIdLibE5EUYM9h6E67p",
    "Host": "app.myjotbot.com",
    "Origin": "https://app.myjotbot.com",
    "Referer": "https://app.myjotbot.com/?_gl=1*5g8pb1*_gcl_au*MjEyNDUwMzg2Ny4xNzIyMjI0ODM0",
    "Sec-Fetch-Dest": "empty",
    "Sec-Fetch-Mode": "cors",
    "Sec-Fetch-Site": "same-origin",
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6.1 Safari/605.1.15"
}

data = {
    "videoId": "eJkTipFkKnQ",
    "languageCode": "en"
}

response = requests.post(url, headers=headers, json=data, ensure_ascii=False)


print(response.content)



