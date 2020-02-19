window.addEventListener("turbolinks:load", function() {
  // タブのDOM要素を取得し、変数で定義する。
  let tabs = document.getElementsByClassName("contents__right__1__middle__left");
  let btns = document.getElementsByClassName("contents__right__2__middle__left");
  tabsAry = Array.prototype.slice.call(tabs);
  btnsAry = Array.prototype.slice.call(btns);

  // クラスの切り替えをtabswitch関数で定義
  function tabSwitch() {
    document.getElementsByClassName("active")[0].classList.remove("active");
    this.classList.add("active");
    document.getE 
     lementsByClassName("show")[0].classList.remove("show");
    const index = tabsAry.indexOf(this);
    document.getElementsByClassName("contents__right__1__under")[index].classList.add("show");
  }

  function btnSwitch() {
    document.getElementsByClassName("move")[0].classList.remove("move");
    this.classList.add("move");
    document.getElementsByClassName("see")[0].classList.remove("see");
    const index = btnsAry.indexOf(this);
    document.getElementsByClassName("contents__right__2__under")[index].classList.add("see");
  }

  tabsAry.forEach(function(value) {
    // ①`value.`の後に、イベントリスナーでクリックイベントが発生した時に、tabSwitch関数を呼び出す処理を書きましょう。
    value.addEventListener("click", tabSwitch);
  });
  btnsAry.forEach(function(value) {
    // ①`value.`の後に、イベントリスナーでクリックイベントが発生した時に、tabSwitch関数を呼び出す処理を書きましょう。
    value.addEventListener("click", btnSwitch);
  });

});

//

