#ifdef _WIN32
    #define _WINSOCK_DEPRECATED_NO_WARNINGS
    #include <winsock2.h>
    #include <ws2tcpip.h>
    #pragma comment(lib, "Ws2_32.lib")
    #define ISVALIDSOCKET(s) ((s) != INVALID_SOCKET)
    #define CLOSESOCKET(s) closesocket(s)
    #define GETSOCKETERRNO() (WSAGetLastError())
#else
    #include <sys/types.h>
    #include <sys/socket.h>
    #include <netinet/in.h>
    #include <arpa/inet.h>
    #include <netdb.h>
    #include <unistd.h>
    #include <errno.h>
    #define SOCKET int
    #define ISVALIDSOCKET(s) ((s) >= 0)
    #define CLOSESOCKET(s) close(s)
    #define GETSOCKETERRNO() (errno)
#endif

#include <stdio.h>
#include <string.h>

#define SERV_TCP_PORT 10000
#define SERV_HOST_ADDR "127.0.0.1"
#define MAXLINE 512

char *pname;

int written(SOCKET fd, char *ptr, int nbytes)
{
    int nleft, nwritten;
    nleft = nbytes;
    while (nleft > 0)
    {
        #ifdef _WIN32
            nwritten = send(fd, ptr, nleft, 0);
        #else
            nwritten = write(fd, ptr, nleft);
        #endif
        if (nwritten <= 0)
        {
            return (nwritten);
        }
        nleft -= nwritten;
        ptr += nwritten;
    }
    return (nbytes - nleft);
}

int readline(SOCKET fd, char *ptr, int maxlen)
{
    int n, rc;
    char c;
    for (n = 0; n < maxlen; n++)
    {
        #ifdef _WIN32
            rc = recv(fd, &c, 1, 0);
        #else
            rc = read(fd, &c, 1);
        #endif
        if (rc == 1)
        {
            *ptr++ = c;
            if (c == '\n')
            {
                break;
            }
        }
        else if (rc == 0)
        {
            if (n == 0)
            {
                return (0);
            }
            else
            {
                break;
            }
        }
        else
        {
            return (-1);
        }
    }
    *ptr = 0;
    return (n);
}

void str_cli(SOCKET sockfd)
{
    int i;
    char sendline[MAXLINE], recvline[MAXLINE + 1];
    while (1)
    {
        memset(sendline, 2, 128);
        if (written(sockfd, sendline, 126) != 126)
        {
            printf("strcli: Can't write over Socket\n");
        }
        i = readline(sockfd, recvline, 126);
    }
}

int main(int argc, char *argv[])
{
    SOCKET sockfd;
    struct sockaddr_in serv_addr;

    pname = argv[0];

    #ifdef _WIN32
        WSADATA wsaData;
        if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
        {
            printf("WSAStartup failed\n");
            return 1;
        }
    #endif

    memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = inet_addr(SERV_HOST_ADDR);
    serv_addr.sin_port = htons(SERV_TCP_PORT);

    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (!ISVALIDSOCKET(sockfd))
    {
        printf("Client: Can't Open Stream Socket\n");
        return 1;
    }

    printf("Client: Connecting...\n");

    if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) == 0)
    {
        printf("Client: Can't Connect to the Server\n");
        CLOSESOCKET(sockfd);
        #ifdef _WIN32
            WSACleanup();
        #endif
        return 1;
    }
    else
    {
        printf("Client: Successfully conneted to the Server\n");
        str_cli(sockfd);
    }

    CLOSESOCKET(sockfd);
    #ifdef _WIN32
        WSACleanup();
    #endif
    return 0;
}