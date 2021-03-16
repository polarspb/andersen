from flask import Flask, request
app = Flask(__name__)

@app.route('/post', methods=['POST'])
def post_route():
    if request.method == 'POST':

        data = request.get_json()

        print('Data Received: "{data}"')
        return data

if __name__ == "__main__":
<<<<<<< HEAD
    app.run()
=======
    app.run(host='127.0.0.1', port=80)
>>>>>>> ccbcde9... task4

