import re

def get_str_from_food_dict(food_dict: dict):
    result = ", ".join([f"{int(value)} {key}" for key, value in food_dict.items()])
    return result


def extract_session_id(session_str: str):
    match = re.search(r"/sessions/(.*?)/contexts/", session_str)
    if match:
        extracted_string = match.group(1)
        return extracted_string

    return ""

# if __name__=="__main__":
#     print(get_str_from_food_dict({"pizza":2,"sprite":1}))
#     print(extract_session_id("projects/bmo-chatbot-xnla/agent/sessions/ee34a8d5-0672-f946-e8d1-83974dc9090a/contexts/ongoing-order"))