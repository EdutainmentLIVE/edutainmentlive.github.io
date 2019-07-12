# LTI and SAML for Developers

by Cameron Gera (@gera-cameron)

LTI and SAML single sign on strategies are incredibly useful, but they are some of the hardest things to grok so I am going to attempt to put it in the terms of which I understand it.
These two standards have full fledged specs out there on the internet and if you work well with those standardized papers I would you encourage you to check those out.
Sadly, every time I read those I left more confused and lost, so I am going to take a different route.
What was most useful for me were diagrams so as I get into the details about each I will provide diagrams to explain what I am saying.
So if you are looking for a simplified version of what these two standards are then stick around.

## LTI Standard

The LTI standard is very common in the academic space and somewhat in the business space.
LTI standard stands for Learning Tools Interoperability.
Knowing this name isn't super useful besides letting you know that a learning management system (LMS) tends to integrate via this strategy.
Tools like Canvas, Moodle, and Blackboard are examples of LMS.

### How it works

So for those of you who are junkies for knowing how every little thing about how stuff works, this is for you.
Although I am not an expert on LTI, I will give my best effort for you.

>> PICTURE HERE

Okay, so we have two entities that will be communicating with each other.
One is the LTI Consumer and the LTI Tool Provider.
The LTI Consumer is the LMS.
The LTI Tool Provider is the external service that the LMS is trying to access.
The authentication works through a key and secret system with some other configurable pieces on the LMS side.

Talk about the following for LTI
Consumer Key
Shared Secret
Launch URL
Domain
Privacy

## SAML Standard

### How it works

>> PICTURE HERE
