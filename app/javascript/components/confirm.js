
function confirmSent()
{
  const x = swal({
  title: "Well sent",
  text: "Check your emails, you'll receive an answer soon.",
  icon: "success",
  button: "Got it!",
  timer: 20000,
});

}

global.confirmSent = confirmSent;
