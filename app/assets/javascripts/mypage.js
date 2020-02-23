window.addEventListener("turbolinks:load", function() {
  // タブのDOM要素を取得し、変数で定義する。
  let tabs = $(".hako__right__1__middle__left");
  let btns = $(".hako__right__2__middle__left");
  function tabSwitch() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".hako__right__1__under").removeClass("show").eq(index).addClass("show");
  }
  function btnSwitch() {
    $(".move").removeClass("move");
    $(this).addClass("move");
    const index = btns.index(this);
    $(".hako__right__2__under").removeClass("see").eq(index).addClass("see");
  }

  tabs.click(tabSwitch);
  btns.click(btnSwitch);
});