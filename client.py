import socket

def main():
    # Server details
    SERVER_HOST = '127.0.0.1'
    SERVER_PORT = 10000

    # Create a socket object
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    print(f"Attempting to connect to {SERVER_HOST}:{SERVER_PORT}")

    try:
        # Connect to the server
        client_socket.connect((SERVER_HOST, SERVER_PORT))
        print("Connected to server successfully")
        resp = client_socket.recv(1024).decode('utf-8')
        print("Received message: " + resp)
        while True:
            resp = client_socket.recv(1024).decode('utf-8')
            print("Received message: " + resp)
    except ConnectionRefusedError:
        print("Connection failed. Make sure the server is running.")
    except KeyboardInterrupt:
        print("\nClient terminated by user")
    finally:
        # Close the connection
        client_socket.close()
        print("Connection closed")

if __name__ == "__main__":
    main()