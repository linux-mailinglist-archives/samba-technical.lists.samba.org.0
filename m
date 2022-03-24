Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 960114E68E4
	for <lists+samba-technical@lfdr.de>; Thu, 24 Mar 2022 19:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cnJg7cqXnZ2NM8qMLuDrdJylj4Q2t9t11dJUV7tyPVQ=; b=V5Jrdc9UiPgGjvzDU84O9lgFro
	UB83UL+JCj+f51ydmQlIa9HlAzCedQsOVXlDb/Lgy3QWQqjYT9yz917WnvHg57L9Za+8xY5l2cDcc
	l8ew+7SZYO4F5L1eVvIO7+W5JXJvgry8aFedZG2CP3/nsXNUl4tmh/YraS5kahEdPkKCi0nA6XRm1
	WarJUNqyXi4Ntk52iXmnFhwzuhkyQclhsluSQYW6Ty5BtlmGEk631wquCW388anhniBrG47yEGeVw
	JqqvqaHJge9Z/93eCYZ9kf0DJ13yjIiDU5JNF4lphtw0KtJgqX7WzU+WCosVdTcudzZateMv63vmV
	V6C5XZFA==;
Received: from ip6-localhost ([::1]:54556 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nXSZw-004zYO-TB; Thu, 24 Mar 2022 18:53:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37854) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nXSZs-004zYF-EH
 for samba-technical@lists.samba.org; Thu, 24 Mar 2022 18:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=cnJg7cqXnZ2NM8qMLuDrdJylj4Q2t9t11dJUV7tyPVQ=; b=tnTi0kvuFrFZGcXwGMQw7i9ibD
 s9K/0BruhhlidnX8O5voHPt/zPfmlw+AoEEkXTQGyB4N6gJNY7aEweS8BigUoYxc7XeX9Y1COstV1
 FDnJH7uE9p0t0AKlrsbug35aDb2bSmM4ts9lm/lgAOsuz/cGNgbDae+B4B2Ba/jatBUCgT0LiT7lF
 oOfy0d2WNJenCG63xXS4fgoh83V5XKlCEEuH1CpgiopABXOzNXLalSja9yT+dxG+7FlfBUEN/oamv
 fOiblX/Nqy5M+5MrjN7fuOcA+vw9bHcjvfsArCF4fRzWFJjQl8Q5t/raatpYKMXOl0S/lBfHbKoHd
 i0n/H5N/Lq4N+Z5Kyx0I/41LgzvE8MidEiUo9VDW+oIoDy5XaHgBn1vV+GuCIbsVPmj8nf1KtgAoN
 9gJWM55fCb5wLINlqmnXmYPVTVK4a4JEXRDcTy2idmaTbKcFcOjKABJcwaU3A+3apjKvW7x5cCWek
 e1c/efeD7sBv+xZ+fH7oVJkL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nXSZq-003IDw-AI; Thu, 24 Mar 2022 18:52:54 +0000
Date: Thu, 24 Mar 2022 11:52:51 -0700
To: Tom Talpey <tom@talpey.com>
Subject: Re: Signature check for LOGOFF response
Message-ID: <Yjy+Az4km5Tmrch/@jeremy-acer>
References: <20220319032012.46ezg2pxjlrsdlpq@cyberdelia>
 <a0972fb5-38d3-5990-7c8e-0b7dd61d1abb@talpey.com>
 <20220323172913.56cr2atzfcunv5kf@cyberdelia>
 <e23752b1-b610-98f9-c338-5faea047494c@talpey.com>
 <YjybF0CDEIkXmVov@jeremy-acer>
 <beaa2c31-96d3-7697-7dad-44585817ae46@talpey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <beaa2c31-96d3-7697-7dad-44585817ae46@talpey.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Enzo Matsumiya <ematsumiya@suse.de>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, smfrench@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Mar 24, 2022 at 02:48:22PM -0400, Tom Talpey wrote:
>On 3/24/2022 12:23 PM, Jeremy Allison wrote:
>>On Thu, Mar 24, 2022 at 11:04:30AM -0400, Tom Talpey wrote:
>>>On 3/23/2022 1:29 PM, Enzo Matsumiya wrote:
>>>>Hi Tom,
>>>>
>>>>On 03/19, Tom Talpey wrote:
>>>>>What server is returning this unsigned response? Assuming it's Windows,
>>>>>that is either a doc bug or (arguably) a server bug, and should be
>>>>>reported before deciding how to address it here.
>>>>
>>>>It's a NetApp ONTAP 9.5P13. We've identified it's also setting wrong
>>>>signatures on READ responses with STATUS_END_OF_FILE.
>>>>
>>>>Our tests against Windows Server 2019 showed it to behave ok, so it
>>>>looks like something on NetApp side.
>>>
>>>In this case I don't think it is appropriate to apply the suggested
>>>patch. Allowing unsigned or invalidly signed responses will greatly
>>>reduce security. I'll be interested if NetApp provides any information.
>>
>>Welcome to our world :-). Doing:
>>
>>git log|grep -i NetApp|wc -l
>>
>>shows 32 instances (some are commit messages with NetApp in
>>them two or more times so the number is probably a little
>>smaller than 32) of commits in Samba especially to
>>deal with NetApp bugs :-).
>>
>>That's a lot of client bugfixes :-).
>
>Well, it could be argued that this is prolonging the bad behavior.
>The NFS client maintainer's approach is the opposite - if the server
>is violating the protocol, he holds the line and will not change
>the client. I know, I know, it's all in how each person sees it. :)

It's all a question of leverage. A Microsoft behavior defines
the protocol, even if it's an inadvertant bug.

For NetApp, people using cifsfs, libsmbclient or our client tools just
want the damn thing to work. NetApp only (as far as I know)
test against a Microsoft client, so we have zero leverage here.

Sucks, but as I said, "Welcome to our world" :-).

