WarSMS
======

Carrier Determination by Email-to-SMS Gateway Probing
-----------------------------------------------------

*Please don't use this program to do anything illegal, or creepy, or*
*even unduly inconvenience an incumbent telecom. That would be wrong.*
*Don't stalk anyone, don't use it to send spam or mass texts or spend*
*people's minutes or whatever. Be considerate dammit, and don't get me*
*in trouble. This tool is intended only for educational and legitimate*
*security assessments/research only. Depending on what I can get an email*
*to SMS gatway to do in the future this could get creepy kinda fast.*

*I am most concerned about the implications of the Email-to-SMS gateway terms*
*of use violations. Anyone with an idea whether this program constitutes misuse*
*should contact me so I can make a release.*

Basically, what this does is takes a phone number and a country and tests that
phone number against all the Email-to-SMS gateways in that country to determine
which carrier administers that phone number. There will be a response that the
address was not found if the carrier does not hold the phone number, and there
will be either no response or a response from the owner of the number. Either
way, the messages will be different enough to determine automatically. A sort of
skeleton "warsms-fake-daemon" is provided to run fetchmail periodically and
output the response to a folder where it will be stored, finally cacheing the
correct gateway which will reveal the carrier and provide a channel for sending
SMS and MMS messages to the device.

To learn to use it, for now, read the code. It's pretty self explanatory. Most
of the options are the same as for /usr/bin/mail. There are ways to use rc
config files too.

**THIS IS ENTIRELY UNTESTED** Given that all the laws are so fuzzy surrounding
how these things can be used and the fact that I don't want to be a spammer, or
you know, jail. Jail sounds really shitty. And a stupid way to respond to 
legitimate experimentation, I might add. Until it's tested, this is just a
mildly elaborate hypothesis. I've never run this script, not once, because I'm
not a lawyer and I'm not sure who I'd annoy if I did. I'm poor and I don't want
to spend time away from my cat so I'm playing it safe.

**THIS VERSION IS DELIBERATELY DISABLED** A cursory reading of the code will
allow you to enable it. It will remain so until I'm clear on the legal issues.
