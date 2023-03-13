$(function(){ 
  // ボタンをクリックしたら
  $(".modal_btn").on('click',function () {
    // モーダルウィンドウとオーバーレイをフェードインさせる
    $(".modal").fadeIn();
    $(".overlay").fadeIn();
  });

  // モーダルウィンドウ内の×ボタンかオーバーレイをクリックしたら
  $(".close, .overlay").on('click', function () {
    // モーダルウィンドウとオーバーレイをフェードアウトさせる
    $(".modal").fadeOut();
    $(".overlay").fadeOut();
   });
});