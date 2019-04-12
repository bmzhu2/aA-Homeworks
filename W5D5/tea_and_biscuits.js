const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function teaAndBiscuits() {
    let tea, biscuits;

    reader.question('Care for some tea?', (res1) => {
        reader.question('Care for some biscuits?', (res2) => {
            tea = res1;
            console.log(`You replied ${res1}.`);

            biscuits = res2;
            console.log(`You replied ${res2}.`);

            const teaRes = (tea === 'yes') ? 'do' : 'don\'t';
            const biscuitRes = (biscuits === 'yes') ? 'do' : 'don\'t';
            console.log(`So you ${teaRes} want tea and you ${biscuitRes} want biscuits.`);
        });
    });

    reader.close();
}