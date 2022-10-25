Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5460360D5E1
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 22:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=M7r6w0P2h9351eSUcZnscqXHk72mBQrpQCzHOviNNsg=; b=o2yvaHdufdGj6Z+XIHfIynBRn1
	kAVU69GJdRlSNJ+58G6PSFPlS9xl61a91KblA4xPVxIOrL7XjjhAczEfwCp+GyadbHTFEvfIR3fas
	zlrf0ebN3ihu7XV82urXSKbmEsDUWgMsqls0a39PxRfkqoYfnxDU5yb894+entWLh4WIIk2VjEBSo
	Ns6dq3wNBY4Xvuu93PgVg5UmCA2gexxjRi7pWKApVbEZ7gQbyobpJFDYwFdqdXBr20sGyCXnwvGLO
	S/veKpKdBkAOxICsVOFbiL77FEQGBoK6QHY4XEOkVr5F2JSbYVrGRpktAIhC1BeGuEcZ4EsUCoZOI
	99MbloOA==;
Received: from ip6-localhost ([::1]:24056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onQuv-0066mh-62; Tue, 25 Oct 2022 20:52:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34786) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onQup-0066m1-CD
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 20:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=M7r6w0P2h9351eSUcZnscqXHk72mBQrpQCzHOviNNsg=; b=hGyNB0ptCEPbQMp0ZbWa0T0MYP
 3fGgISrg+jFEe95kwDH2RcBubTuxQcifxP2NGcIa0z1HOzdVim8WaCEmiQZhqbIq11GJVEURNFBc2
 opXKdbvevUoFC4mdUbtHAA9/NdTXapImwfgce4BASb1//MU2NxWrXTgjM2h7zOEGxmDYHXWb+iF5m
 DIGbX60CxQ5wu1i6qgoe83J7uVA2+KO1ZVKfO8nOYbX1omdo8fe9IKQuwQ3lYpaI1nlt/BS0u0x4y
 QROHUQgrjHEFF/Fu+QIL6W6lPj8TDFFGdYyytPppmAF+ngwR0/9Kt8SkXhGHj3XDRyvVsaJNnj3pS
 jAYG17hDyCpwChsY7ebUjqb0EbtBURF0bwJ0LXu1NbVjuHtRxDzIXwJofjsl5cFfzntA3N5LAxgkV
 q+HOSSb9lYK9bhyxjlMP5c8xO75ZmDM4KoyGIxJvdUwhZdcrkCz4v/I0koMtjkBR5QjHJlO47nwb8
 08elHo6n2oqTim7pCfZNAurr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onQuo-005mqU-Qw
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 20:52:50 +0000
Message-ID: <bd9d4cac-3058-2e2b-7331-07e1be6dc056@samba.org>
Date: Tue, 25 Oct 2022 21:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: smbclient --max-protocol=NT1: why it requres setting MIN protocol
 too?
Content-Language: en-GB
References: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
 <91404b18-9bfd-a9c8-dc5a-f18672933b6a@samba.org>
 <2040ec08-ecb3-9181-c46e-e8f9d5e3691f@msgid.tls.msk.ru>
 <e3b25688-93d1-ae69-47be-0d2db7020723@samba.org>
 <Y1hIR7BP/du669hz@jeremy-acer>
To: samba-technical@lists.samba.org
In-Reply-To: <Y1hIR7BP/du669hz@jeremy-acer>
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 25/10/2022 21:34, Jeremy Allison wrote:
> On Tue, Oct 25, 2022 at 07:07:36PM +0100, Rowland Penny via 
> samba-technical wrote:
>>
>>
>> On 25/10/2022 19:00, Michael Tokarev wrote:
>>> 25.10.2022 20:57, Rowland Penny via samba-technical wrote
>>> ..
>>>> I am just trying to understand this, from what I thought I knew. SMB 
>>>> is a negotiating protocol, so shouldn't smbclient negotiate the best 
>>>> version of SMB to use ? i.e. You shouldn't have to tell it what 
>>>> version to use.
>>>
>>> Well, it does the right thing. NT1 or CORE are insecure protocols,
>>> this is why they've been disabled. A bad m-i-m can force a negotiation
>>> to be agreed upon an insecure protocol. So you have to explicitly
>>> tell smbclient to use known-bad one.
>>>
>>> /mjt
>>
>> While you are technically correct, surely SMBv1 should only be used by 
>> smbclient if the server is set up to use SMBv1 and will only be used 
>> if none of the SMBv3 or SMBv2 versions are available on the server.
>>
>> Or am I misunderstanding something ?
> 
> SMB1 is only now used from our client if you deliberately specify it
> in smb.conf or on the command line. Michael (correctly) complains
> that if you set -mNT1 (meaning max client protocol is NT-SMB1 - i.e.
> use SMB1) that it won't connect if you have "min client protocol"
> set to be SMB2-only (as min-protocol is now less than max).
> 
> Michael suggested that if you explicitly set "max client protocol" lower
> than "min client protocol" on the command line, that "min client
> protocol" is then explicitly set to the same as "max client protocol"
> rather than failing the connection, which makes sense to me.

Ah, that is what I misunderstood, by default smbclient has SMBv1 turned 
off, but it only has a max protocol switch (which by definition sets the 
maximum protocol to use and this defaults to SMBv3), when it probably 
should have been a min protocol switch i.e. turn SMBv1 back on again.

The problem with all this is, the user has to know that the server only 
uses SMBv1 before using smbclient and this isn't always possible to know.

Rowland


