const http = require('http');
const ioClient = require('socket.io-client');
const { app, server, io } = require('../index');  // Assuming your file is named index.js

const PORT = 4000;  // Use a different port than the main app for testing
const SOCKET_URL = `http://localhost:${PORT}`;

let clientSocket;
let isServerRunning = false;

beforeAll((done) => {
  if (!isServerRunning) {
    server.listen(PORT, () => {
      isServerRunning = true;
      done();
    });
  } else {
    done();
  }
});

afterAll((done) => {
  if (clientSocket) {
    clientSocket.disconnect();
  }
  if (isServerRunning) {
    io.close();
    server.close(() => {
      isServerRunning = false;
      done();
    });
  } else {
    done();
  }
});

beforeEach((done) => {
  clientSocket = ioClient.connect(SOCKET_URL, {
    'reconnection delay': 0,
    'reopen delay': 0,
    'force new connection': true
  });
  clientSocket.on('connect', done);
});

afterEach(() => {
  if (clientSocket && clientSocket.connected) {
    clientSocket.disconnect();
  }
});

describe('Socket.io Tests', () => {
  it('should increase number of users when "add user" is emitted', (done) => {
    clientSocket.emit('add user', 'John');

    clientSocket.on('login', (data) => {
      expect(data.numUsers).toBe(1);
      done();
    });
  });

  it('should decrease number of users when user disconnects', (done) => {
    clientSocket.emit('add user', 'John');

    clientSocket.on('login', () => {
      clientSocket.disconnect();
    });

    clientSocket.on('disconnect', () => {
      // To test that a user has left, another client should listen for the 'user left' event
      const anotherClient = ioClient.connect(SOCKET_URL);

      anotherClient.on('user left', (data) => {
        expect(data.numUsers).toBe(0);
        anotherClient.disconnect();
        done();
      });
    });
  }, 10000);
});

it('should decrease number of users when user disconnects', (done) => {
    clientSocket.emit('add user', 'John');

    clientSocket.on('login', () => {
        console.log('John logged in');
        
        // Another client to check for the 'user left' event
        const anotherClient = ioClient.connect(SOCKET_URL);
        
        anotherClient.emit('add user', 'Jane');  // Make sure this client is also recognized as a user
        
        anotherClient.on('login', () => {
            console.log('Jane logged in');
            clientSocket.disconnect();
        });

        anotherClient.on('user left', (data) => {
            console.log('Received user left event', data);
            expect(data.username).toBe('John');
            expect(data.numUsers).toBe(1);  // Only Jane remains
            anotherClient.disconnect();
            done();
        });
    });
}, 15000);  // Increased timeout
