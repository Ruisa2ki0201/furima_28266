import consumer from "./consumer"
window.addEventListener('load',function(){
consumer.subscriptions.create(
  {
    channel:"MessageChannel", 
    item_id: document.getElementsByClassName("comment-box")[0].getAttribute('data-item-id')
  }, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    const html = `<p>${data.user.nickname}:${data.content.text}</p>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
})
});
