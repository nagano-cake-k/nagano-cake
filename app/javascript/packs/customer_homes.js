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

// $(function() {
//   let i = 1;
//   setInterval(function() {
//     if(i > 23) i = 1;
//     $("#randomImg").css("background-image","url('images/cake"+i+".jpg')");
//     i++;
//     }, 4000
//   );
// });