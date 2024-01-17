const pay = () => {
  const payjp = Payjp('pk_test_22a5df0a816dbb03f5c7573a')
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    console.log("フォーム送信時にイベント発火")
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);