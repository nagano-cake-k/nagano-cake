$(window).on('load', function () {
  //テキストごとにspanタグを生成する
  let element = $(".typing");
  let thisChild = ""
  element.each(function () {
    let text = $(this).html();
    let textbox = "";
    text.split('').forEach(function (target) {
      if (target !== " ") {
        textbox += '<span>' + target + '</span>';
      } else {
        textbox += target;
      }
    });
    $(this).html(textbox);
  });
  
  // タイピングアニメーション
   $(element).each(function () {
      thisChild = $(this).children(); //生成したspanタグを取得
      thisChild.each(function (i) {
        let time = 150;
        $(this).delay(time * i).fadeIn(time);
      });
  });
});

// let images = [ 'url(aseets/images/cake.image/cake1.jpg)', 'url(aseets/images/cake.image/cake2.jpg)', 'url(aseets/images/cake.image/cake3.jpg)' ];  // ランダム表示させたい画像のパス
// // // let images = [ 'url(<%= image_tag "cake1.jpg" %>)', 'url(<%= image_tag "cake2.jpg" %>)', 'url(<%= image_tag "cake3.jpg" %>)'];  // ランダム表示させたい画像のパス

//     $(function(){
//       let backgroundRandom = function(){
//         let number = Math.floor(Math.random() * images.length); // 0~3の数値を算出 
//         let selectedImg = images[number]; // 算出された数値を元に、1行目の配列から取り出す
//         $('#randomImg').css('background-image',selectedImg); // cssにランダムに選ばれた画像を背景設定する
//       };
//       setInterval(backgroundRandom, 5000);  // 1000msごとにランダム切り替えを繰り返す
//     });