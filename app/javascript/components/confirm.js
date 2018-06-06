
function confirmSent()
{
  const x = swal({
  title: "Well sent",
  text: "Please check your emails for updates and delivery",
  icon: "success",
  timer: 20000,
});

  setTimeout(function() {
    $('#myModal-message').modal('hide');
    swal.close();
  }, 2000)

}

global.confirmSent = confirmSent;
