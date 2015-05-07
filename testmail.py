import transaction

from pyramid_mailer.mailer import Mailer
from pyramid_mailer.message import Message

mailer = Mailer()
message = Message(subject="hello arthur",
                  sender="bhanubodagala@gmail.com",
                  recipients=['bhanubodagala@gmail.com'],
                  body="hello from ford")


mailer.send(message)
transaction.commit()
