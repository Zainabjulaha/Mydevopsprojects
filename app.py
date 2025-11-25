from flask import Flask   # <-- correct import

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from CI/CD Pipeline - Zainab!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000)

