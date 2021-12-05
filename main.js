/* Moralis init code */
const serverUrl = "https://atxvbmxxhq0b.usemoralis.com:2053/server";
const appId = "T58RX7iHQYRNArdaZaO1yWPwcqXOXVrKMyivP272";
Moralis.start({ serverUrl, appId });

let abi = [{"inputs":[],"name":"getSus","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bool","name":"sus","type":"bool"}],"name":"kindaSusBro","outputs":[],"stateMutability":"nonpayable","type":"function"}];
let contract = '0x5b05a3bCC194d91B3e84e44C15f91751ae2F4Fb2';

/* Authentication code */
async function login() {
    let user = Moralis.User.current();
    if (!user) {
      user = await Moralis.authenticate({ signingMessage: "Log in using Moralis" })
        .then(function (user) {
          console.log("logged in user:", user);
          console.log(user.get("ethAddress"));
        })
        .catch(function (error) {
          console(error);
        });
    }
  }
  async function logOut() {
    await Moralis.User.logOut();
    console.log("logged out");
  }

async function loadContract() {
  window.web3 = await Moralis.enableWeb3();
  return new web3.eth.Contract(abi, contract);
}

async function getCurrentAccount() {
  window.web3 = await Moralis.enableWeb3();
  const accounts = await web3.eth.getAccounts();
  return accounts[0];
}

async function getSus() {
  let contract = await loadContract();
  docment.getElementById("output") = contract.methods.kindaSusBro().call();
}

  document.getElementById("btn-login").onclick = login;
  document.getElementById("btn-logout").onclick = logOut;
