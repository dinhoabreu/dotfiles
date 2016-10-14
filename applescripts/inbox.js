const app = Application('Mail')
const inbox = app.inbox()

'✉ ' + inbox.unreadCount()
