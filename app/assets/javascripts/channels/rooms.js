jQuery(document).on('turbolinks:load', function() {
  const messages = $('#messages');
  if ($('#messages').length > 0) {
    const messages_to_bottom = () => messages.scrollTop(messages.prop("scrollHeight"));

    messages_to_bottom();

    return App.global_chat = App.cable.subscriptions.create({
        channel: "ChatRoomsChannel",
        chat_room_id: messages.data('chat-room-id')
      }, {
      connected() {},
        // Called when the subscription is ready for use on the server

      disconnected() {},
        // Called when the subscription has been terminated by the server

      received(data) {
        messages.append(data['message']);
        return messages_to_bottom();
      },

      send_message(message, chat_room_id) {
        return this.perform('send_message', {message, chat_room_id});
      }
    },

      $('#new_message').submit(function(e) {
        const $this = $(this);
        const textarea = $this.find('#message_body');
        if ($.trim(textarea.val()).length > 1) {
          App.global_chat.send_message(textarea.val(), messages.data('chat-room-id'));
          textarea.val('');
        }
        e.preventDefault();
        return false;
      })
    );
  }
});