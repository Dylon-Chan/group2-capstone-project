const { COLORS } = require('../public/main.js');

// test if the colours array exist

test('test', () => {
    expect(COLORS).toEqual([
        '#e21400', '#91580f', '#f8a700', '#f78b00',
        '#58dc00', '#287b00', '#a8f07a', '#4ae8c4',
        '#3b88eb', '#3824aa', '#a700ff', '#d300e7'
      ]);
});