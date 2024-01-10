Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC10D8299C7
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jan 2024 12:51:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rQu8q+9LIu0hcVq22+KN0j/YIT/d6S1mR/ZlBP9HR+E=; b=WRH/zYjMoWF69JKTCpWs43YtmK
	FWhV5tnLkN3DW+/NpYi1rQtjviwCKQpJdr7sTtTkqJ/z6qWM1mkPNXRAUl+yVTuQbm572LXPFhWn0
	vNxRTp+tRstcZ1HgI8u1QIArPe+HtgRM6fWw9NQwBv/Sn2ju3LS6GLoQUYHZKw1wUBxzctzoYSCFZ
	3KobHxr2ysNVlPtvP0U7ETC4BCLKbPJxgWIMIjZmPLcBB9I3mMQ2+VGFgjGtcPRffQ65VspBgFlJw
	iVX2b0wf2ktGjHFBpf9xg72Bvt3rzwWSROUQSIvFkGTuJBCQ1WW7ylpONTDL2nOVVDfCTzPDhlOtN
	8NJHXo8w==;
Received: from ip6-localhost ([::1]:53534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rNX6r-002y5W-CM; Wed, 10 Jan 2024 11:51:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51826) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rNX6l-002y5P-VB
 for samba-technical@lists.samba.org; Wed, 10 Jan 2024 11:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=rQu8q+9LIu0hcVq22+KN0j/YIT/d6S1mR/ZlBP9HR+E=; b=D2j42pCrmBOIllkdtWWws5Tem0
 6nHTEhZViBVKuNU496rnOk+2RtRwPkd/hWGy2fAYmdKj5unVyeyu3beQemyMC9rCpzhQ2vjbN7VQT
 cL5TDYjt23l7utqjexDLE6wXX5vWGok4syeam6rdK2Mxwc6lxh2eUylkG1O9hw9pxTC4ZIMkwDQiX
 BSCKDVlvNLI/I7cbEmEw/7svTqsC3W5D3eXDBoZJO5J96RLBOB8HpMIPlDcDTGB1jyLJCZ0Q4GRVN
 jy7erPa5APqjb1BUUm1Rp+Qu8YtKiP5DwwbLWZe+hScafv79pkx9SYDaNdPexLEim3k8l+DOD9Cbe
 L8R2eOPKzOruyIGP5JVHolrEJDsa4g9+b09Bs8xaz9nCWoIZ1C+ekxKKOR47uGM8Avb3Okg7RSNfq
 +XYDs27EbaJ2QILQuHuOOGDkLO1PijQGM3Gu1GTDUhrDd5qW44H6+LDbxY2UD9epdHKCsDgQCKQ0n
 60LiSwl5+gOdc3AM66UzwSxJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rNX6k-007MJw-33; Wed, 10 Jan 2024 11:50:55 +0000
Message-ID: <927cca4b-0409-4999-ac1f-1966266e65aa@samba.org>
Date: Wed, 10 Jan 2024 12:50:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Some notes on "Implement 'update keytab' for winbind and tools"
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 Pavel Filipensky <pfilipensky@samba.org>
References: <731186894254eececaadb25c14ed49d1aee4a145.camel@samba.org>
In-Reply-To: <731186894254eececaadb25c14ed49d1aee4a145.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

> For some reason this felt better as a mailing list post than just a MR
> update.
> 
> I'm really sorry to give a chunky bit of feedback right as I go on
> leave, I'm sure is quite frustrating and you will probably want some
> clarification.
> 
> Sadly I hadn't been paying attention to
> https://gitlab.com/samba-team/samba/-/merge_requests/1999
> 
> As Christmas is next week, I'll be stepping away from Samba mail and
> GitLab.
> 
> I do trust metze to continue to give you good feedback if you want to
> push this through while I've stepped away - please don't write me down
> as blocking this - but I'm also keen to try and help get a good 'update
> keytab for other things' solution for all of Samba, using our keys or
> gMSA keys.

While this sounds very interesting we still need ways to
export keytabs for our things like sshd, that also needs
the 'host/' service principal.

And at least my main goal with MR 1999 is that
we no longer need to mess with 'kerberos method' and prevent
winbindd from changing the password every week.

Also all the magic that we sometimes implicitly create
a keytab, see
https://gitlab.com/samba-team/samba/-/merge_requests/2190
s3:lib: No implicit keytab update for 'net ads changetrustpw'


The real end goal would be some kind of gensec proxy,
that lets a server or client connect over a unix socket
and the proxy checks which client credentials or service principals
are allowed by the proxy "consumer". Basically it would
pass the whole gss blobs back and forth and on success
only get the result of gss_export_sec_context() + auth_session_info
so basically only key material for the specific session.
The proxy would check if the client provides service principal
really matches what the proxy consumer was allowed to verify.

But that would be a very long way to go.

So I'd say that we go on with MR 1999 and make sure the
documentation clearly describes the risks.

And usage of gMSA's could be added later, I'll make sure
we'll have a useful syntax that will make it explicit
which credentials will be put into the keytab and this
could include gMSA's or single managed accounts in future.

But the basic infrastructure for an admin to control
how keytabs are updated is a clear win over the mess
we currently have. My hope is also to remove quite
some old code...

metze

