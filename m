Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3FB23D902
	for <lists+samba-technical@lfdr.de>; Thu,  6 Aug 2020 11:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=izTJ+2yDI2w/6qKorO/6KnsWZxchqPWN+/LGG9dkdmY=; b=AJJsqmgDJsf7o79O+1mlyaz9v/
	pwImFfOWJgemtZr8GFdsOyi97spuLPmikOIB5XxTPbZC0rKmPoAk2mFUawCEDYo8UdZUSSSeYIT4y
	ukdZ3qCELjGPUMoRzdw8kdnKRqVhGbXzTrU+KZaPwU/7TbMuAs9z6asFSjSM4hjXCrRujuCeGJy9k
	rv+tM84zV1EAeF3v/4Gt4jRvyFDtdOfUQ4yNGY0FcSSBjAB15AzY34zaIptHJiteleCh+j7ZByDWu
	jzZAMVDW8Goixt/bMwAEiXLzjQLK23mMYLDKfv95W561SVDR5ID1Ky6CQdNWH9VdCNuZKXdGugfKD
	7en2F+3Q==;
Received: from localhost ([::1]:35434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k3cfC-00CaiN-WD; Thu, 06 Aug 2020 09:58:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10542) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k3cf6-00CaiG-DE
 for samba-technical@lists.samba.org; Thu, 06 Aug 2020 09:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=izTJ+2yDI2w/6qKorO/6KnsWZxchqPWN+/LGG9dkdmY=; b=ersClVw51MpNJkfozG+fxzem85
 kNfv6F77SG05DeY5x6NfFQRf03U7C38N0P/VEMqMiPkLteWBHuDKh64OphhVE6ol45ZJD9QsZSq7m
 +09DG9ymHsMPQb/uH0Z3qliAzz3/UEJYijrbPw4FOnTK6SVqQ4FnIILhgWMVQOrSX01cCAot2C1by
 8+Vf6KtdL0VzgZ0Bjut5RPKXldT7WxhFcsO26trmTLsNba5kG47jt+PDZM7tMddEPZwDFA8xS6qgE
 EXs5VYNh3sjd8nanD37tQVoMDCuflYZpXmmaiSN5H075TOS+KUDWoZDPAReQEbbgzpX7WzVUX6gwU
 gVBRQyX+uunm4Ikwo/+/IUpBYby4Fi4U2/GA0A1zAlKunnIRdqrDEcZRuIlgyfKe7hvHbku0r5gho
 bJbQKyD5gFkf6PYtiVfbwDtWgo9xa94e97RP6MjBoW8qhLdvWgzfSYWANt4ZZzUqDkM/EPEysXXXl
 we9EupEs7LLukVGEtfDHAEGZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k3cf2-0006PT-WB; Thu, 06 Aug 2020 09:58:09 +0000
Message-ID: <21f48f43524f5ee57ad39d5c0858eb9767fab4ae.camel@samba.org>
Subject: Re: socket-wrapper fd-passing
To: Stefan Metzmacher <metze@samba.org>
Date: Thu, 06 Aug 2020 15:28:04 +0530
In-Reply-To: <b77f985914dcacabf876f37851375b3f5436e77d.camel@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
 <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
 <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
 <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
 <b77f985914dcacabf876f37851375b3f5436e77d.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-07-03 at 11:36 +0530, Anoop C S via samba-technical wrote:
> On Tue, 2020-06-30 at 18:28 +0200, Stefan Metzmacher via samba-
> technical wrote:
> > Hi Anoop,
> > 
> > > > > I guess it means we would need to undo some of the changes we
> > > > > made
> > > > > to one array of socket_info structures.
> > > > > 
> > > > > I'll let you know if I get the basic passing of information
> > > > > via
> > > > > the
> > > > > tmp
> > > > > pipe working...
> > > > 
> > > > As Samba does not require that the socket is usable from two
> > > > processes
> > > > at the same time, I guess we can take a short cut and just pass
> > > > the socket_info structure (an array of them) through the pipe.
> > > > That would allow us to have multichannel tested in
> > > > gitlab/autobuild.
> > > 
> > > I am looking through your changes and will let you know in case I
> > > need
> > > more clarifications.
> > > 
> > > > I'll see if I can get this to work. Once we have these basics,
> > > > we can try to improve the design to be more generic with shared
> > > > structures, when we really need it.
> > 
> > I made good progress, see
> > https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing-unix
> > https://gitlab.com/metze/socket_wrapper/-/pipelines/161689331
> 
> Great. Those preparatory patches from fd-passing-prepare branch looks
> good to me.
> 
> As I look through the additional patch from fd-passing-unix
> implementing the real logic, I am getting to realize the mistake(a
> big
> one) I made earlier w.r.t catching SCM_RIGHTS at wrong place. Somehow
> things got mixed up in my mind :-/ Also I am still figuring out
> various
> details as we have fine grained checks for another set of arrays(of
> integers, socket_info structures) in addition to ones we already have
> with current code.
> 
> I will try to expand test_echo_tcp_sendmsg_recvmsg_fd_array added
> towards the end to have inet sockets passed and tested in selftest.

a small update:
I have a test named test_echo_tcp_sendmsg_recvmsg_fd to validate fd-
passing implementation as top commit here..
https://gitlab.com/anoopcs/socket_wrapper/-/tree/metze-fd-passing-unix

> altogether wonderful work !!
> 
> > And for Samba:
> > https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-multichannelhttps://gitlab.com/samba-team/devel/samba/-/pipelines/161691424
> > https://gitlab.com/samba-team/devel/samba/-/pipelines/161691541
> > 
> > I'll add some more tests tomorrow and debug why some samba tests
> > are
> > failing...
> > 
> > metze
> > 
> 


