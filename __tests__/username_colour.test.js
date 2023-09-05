const { COLORS, getUsernameColor } = require('../public/main.js');

// check if the hash colour exist in colours array

describe('check for hash colour', () => {

    test('should return a color from COLORS array', () => {
        const color = getUsernameColor('Alice');
        expect(COLORS).toContain(color);
    });

    test('should return the same color for the same username', () => {
        const color1 = getUsernameColor('Bob');
        const color2 = getUsernameColor('Bob');
        expect(color1).toBe(color2);
    });

    test('should return different colors for different usernames if possible', () => {
        if (COLORS.length > 1) {
            const color1 = getUsernameColor('Charlie');
            const color2 = getUsernameColor('David');
            expect(color1).not.toBe(color2);
        }
    });
});