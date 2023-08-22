import { useEffect, useState } from "react"
import { useParams } from "react-router-dom/cjs/react-router-dom.min"

const Chat = ({ consumer }) => {
  const { teaName } = useParams()
  const [message, setMessage] = useState("")
  const [messages, setMessages] = useState([])

  useEffect(() => {
    const fn = async () => {
      const res = await fetch(`/api/messages?tea=${teaName}`)
      const data = await res.json()
      setMessages(data)
    }
    if (teaName) {
      fn()
    }
  }, [teaName])

  useEffect(() => {
    if (teaName) {
      const subscription = consumer.subscriptions.create(
        {
          channel: 'ChatsChannel',
          teaName
        },
        {
          received: payload => {
            switch(payload.type) {
              case 'RECEIVE_MESSAGE':
                setMessages(prev => [...prev, payload.message])
            }
          }
        }
      )
  
      return () => subscription.unsubscribe()
    }
  }, [teaName])

  const handleSubmit = async e => {
    e.preventDefault()
    const res = await fetch(`/api/messages?tea=${teaName}`, {
      method: 'POST',
      body: JSON.stringify({ body: message }),
      headers: { 'Content-Type': 'application/json' }
    })
    setMessage('')
  }

  return (
    <>
      <h2>Chat</h2>
      {messages.map(msg => <p key={msg.id}>{msg.body}</p>)}
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={message}
          onChange={e => setMessage(e.target.value)}
        />
        <input type="submit" value={'Send'} />
      </form>
    </>
  )
}

export default Chat