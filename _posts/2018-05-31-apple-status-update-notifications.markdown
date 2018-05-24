# Working with Apple Status Update Notifications

## The Problem

Apple's documentation for status update notifications leaves much to be desired. Statements are
vague or confusing at times, but when they _are_ clear they reveal how unfriendly their requests and
responses are to functional programming. They don't provide any official sample JSON for any of
their requests or responses. But no big deal, you can put in some logging, run through various
scenarios (purchase, renew, lapse, etc) right? Wrong. You can't simulate a cancelation or failed
payment, and if you can't simulate a failed payment you can't simulate a lapsed subscription, which
also means you can't test what Apple calls an 'interactive renewal.'

## The Solution

Start with the data structure, and how the JSON changes based on the notification type, and how
vague their docs are on this.

If only we had sample JSON for each possible request and response, we would've saved a lot of time.
Why can't they just send the same JSON?

Also needed to see the shape of the data, which necessistated testing, which took a long time to
setup

clarify iOS6 and 7 style receipts

<!-- apple in app purchase what does apple send if renewal is unsuccessful. latest_receipt_info says `The JSON representation of the receipt for the most recent renewal. Posted only if renewal is successful. Not posted for notification_type CANCEL.` This indicates Apple sends _something_ on an unsuccessful renewal/lapse, but why would they?

How to handle a cancel? latest_expired_receipt_info. That means the body is going to be one of two different types, either StatusUpdateNotification or LatestExpiredReceiptInfo, which is annoying.

What to do with web_order_line_item_id?

 -->
