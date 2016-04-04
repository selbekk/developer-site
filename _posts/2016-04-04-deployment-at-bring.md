---
layout: post
title:  Deployment at bring
date:   2016-04-04 00:51:43 01:00
category: Engineering
author: robinkh
---


Fix the introduction it sucks
====

The past few years, a plethora of blog posts and stories about the importance of
deploying often has cropped up. For most people who have been part of a
deploying-once-a-month regime and later come to a place with deployment many
times a day, I don't think there's a doubt about why this comes up all the
time. Getting to the point where you can deploy whenever you want to requires
setting up some good tooling and I feel like writing a bit about how we do this
at Bring and where we want to go in the future.

We've got a pretty common architecture and built some tooling to deploy to that:

- We have a development environment, a qa environment and a production environment
- We have a load balancer in front of multiple instances of the same application
- We reach application servers via gateway servers
- We need to be connected to VPN to reach the gateway servers

What we use
===

We use a deploy-script written in Python and rely on the excellent
(fabric)[fabfile.org] utility. Fabric gives us ssh connection pooling, parallel
task running, shell escaping and many other features that are neat when you need
to talk to a server. Fabric is configured to automatically go via the
appropriate gateways to reach application servers, much like using ProxyCommand
in ssh configs. The advantage of doing it like that is that the appropriate
proxy configuration can live in one place, instead of in everyones ssh config.

One thing I think is really important when you start deploying all the time is
to make sure you can trust your deploy script. It's very easy to think of it as
"just a script", but I think that one should approach scripts that run commands
on servers with the same rigor as applications, if not more. It doesn't matter
how well-tested, how well-architectured your app is, if your deploy-script can
(delete /usr)[https://github.com/MrMEEE/bumblebee-Old-and-abbandoned/issues/123]
while deploying, it won't do you any good. So I consider it really important to
make deploy-scripts safe. To me, that means one should follow some known
best-practices from application development while writing scripts:

- Avoiding global state
- Isolate side-effects from branching
- Try to work at an appropriate level of abstraction
- Automated tests
- Tests should be fast

Our deploy-script has very good test-coverage and it will refuse to deploy on
any test failure. Tests are run on every deployment. Having isolated
side-effects from branching enables us to write fast test-cases for for the code
that does a lot of logic. In my experience, this is where bugs tend to show up,
so it's definitely a confidence boost to have good test coverage of that.
