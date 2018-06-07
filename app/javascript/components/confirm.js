
function confirmSent()
{
  const x = swal({
  title: "Message envoyé",
  text: "Merci et à bientôt sur Radicl",
  icon: "success",
  timer: 20000,
});

  setTimeout(function() {
    $('#myModal-message').modal('hide');
    swal.close();
  }, 2000)

}

global.confirmSent = confirmSent;
