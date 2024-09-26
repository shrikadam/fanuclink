import socket
import numpy as np
import struct
import time

def calculate_sine_offset(i, cycle_freq, ampl):
    return ampl * np.sin(2 * np.pi * cycle_freq * i)

def main():
    # Parameter setup
    SERVER_HOST = '127.0.0.1'
    SERVER_PORT = 30000
    i = 0
    ctrl_freq = 125
    weave_freq = 1
    ampl = 10
    cycle_freq = weave_freq / ctrl_freq

    # Create a socket object
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((SERVER_HOST, SERVER_PORT))
    server_socket.listen()

    print(f"Listening for connection request on port {SERVER_PORT}...")

    client_socket = None

    try:
        # Accept Client request
        client_socket, client_address = server_socket.accept()
        print(f"Connection accepted from {client_address}")
        while True:
            data = client_socket.recv(4)
            if data:
                # Unpack the binary data to an integer
                trigger = struct.unpack('<I', data)[0]  # '!I' for big-endian unsigned int, '<I' otherwise
                if(trigger==42):
                    print("Starting DPM...")
                    while True:
                        dy = calculate_sine_offset(i, cycle_freq, ampl)
                        offs = struct.pack('<6f', 0.0, dy, 0.0, 0.0, 0.0, 0.0)
                        client_socket.sendall(offs)
                        i = i + 1
                        time.sleep(0.008)
            # msg = client_socket.recv(1024).decode()
            # if(msg=="capture"):
            #     print("Capturing...")
            # elif(msg=="start_dpm"):
            #     print("Starting DPM...")
            #     while True:
            #         dy = calculate_sine_offset(i, cycle_freq, ampl)
            #         offs = struct.pack('<6f', 0.0, dy, 0.0, 0.0, 0.0, 0.0)
            #         client_socket.sendall(offs)
            #         i = i + 1
            #         # print(f"Sent offset {offs}")
            #         time.sleep(0.008)
            # elif not msg: 
            #     print("Client has disconnected.")
            #     break
            # else:
            #     print(f"Message Received: {msg}")
    except ConnectionRefusedError:
        print("Connection failed. Make sure the server is running.")
    except KeyboardInterrupt:
        print("\nClient terminated by user")
    finally:
        # Close the client connection if it exists
        if client_socket:
            client_socket.close()
            print("Client connection closed.")
        # Close the connection
        server_socket.close()
        print("Connection closed")

if __name__ == "__main__":
    main()