# 🍔 Food Order Chatbot Backend with FastAPI

This is a backend project built using **FastAPI** to support a Dialogflow-based chatbot for food ordering. It enables users to add, remove, track, and complete food orders through natural language.

## 🚀 Features

- Add food items with quantity to an order
- Remove specific items from an ongoing order
- View current status of an existing order
- Complete the order and get order ID + total price
- Integrates with Dialogflow via webhook

## 💬 Example Interaction

1. **User:** "I want 2 burgers and a coke"
2. **Chatbot:** "So far you have: 2 burgers, 1 coke. Do you need anything else?"
3. **User:** "Remove the coke"
4. **Chatbot:** "Removed coke from your order!"
5. **User:** "That's all"
6. **Chatbot:** "Order placed! Your ID is #101. Total: $12. Pay on delivery."

## 🔧 Requirements

- Python 3.7+
- FastAPI
- Uvicorn
- mysql-connector-python

## 🏃 Running the App

uvicorn main:app --reload

## ngrok for https tunneling

1. To install ngrok, go to https://ngrok.com/download and install ngrok version that is suitable for your OS
2. Open windows command prompt, go to the location of ngrok.exe and run this command: ngrok http 80000
