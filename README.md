# 🍔 Food Order Chatbot

This is a full-stack food ordering chatbot powered by Dialogflow, a FastAPI backend, and a frontend HTML page for integration. The chatbot helps users order food using natural language, with backend logic to manage orders, connect to a MySQL database, and respond dynamically to user inputs.
## 🚀 Features

- Add food items with quantity to an order
- Remove specific items from an ongoing order
- Track order status by order ID
- Complete the order and calculate total cost
- Stores data in a MySQL database
- Integrates with Dialogflow via webhook

## 💬 Example Interaction

1. **User:** "New Order"
2. **Chatbot:** "Order time! Tell me what you’d like, like ‘3 fries and a burger’. Don’t forget to mention how many! Today’s menu: Burger, Fries, Pizza, Sandwich, Donut, Coke, Sprite."
3. **User:** "I want 2 burgers and a coke"
4. **Chatbot:** "So far you have: 2 burgers, 1 coke. Do you need anything else?"
5. **User:** "Remove the coke"
6. **Chatbot:** "Removed coke from your order!"
7. **User:** "That's all"
8. **Chatbot:** "Order placed! Your ID is #101. Total: $12. Pay on delivery."

## 🔧 Requirements

- Python 3.7+
- FastAPI
- Uvicorn
- mysql-connector-python
- Ngrok (for HTTPS tunneling to Dialogflow)
- Apache server
- 
## 🏃 Running the App

1. Clone the repository
2. Install dependencies
3. Start your backend server :**uvicorn main:app --reload**
4. Launch ngrok for HTTPS tunneling :**ngrok http 8000**
5. Update the Dialogflow webhook URL to use the HTTPS link from ngrok
6. Open the frontend to interact with the chatbot
   
## ngrok for https tunneling

1. To install ngrok, go to https://ngrok.com/download and install ngrok version that is suitable for your OS
2. Open windows command prompt, go to the location of ngrok.exe and run this command: ngrok http 80000

![Screenshot 2025-06-16 184848](https://github.com/user-attachments/assets/31bcc2cf-629b-4e47-8df2-60640e336729)
![Screenshot 2025-06-16 185705](https://github.com/user-attachments/assets/a4e123e7-a9b1-4a97-ad21-d34c66b42a61)
![Screenshot 2025-06-16 185714](https://github.com/user-attachments/assets/eb59cd7f-e7d0-42d8-9956-8871c26769ff)
