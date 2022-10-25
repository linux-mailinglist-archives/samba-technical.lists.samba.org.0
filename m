Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 855C260D599
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 22:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=cv80CEZPemWFdxbqYF9P9D4wF12kqM4HAHN7iNVOHHw=; b=5RdgawIOHpA0HB2oap8zLaJVk2
	ortNeR6hmX9+a4tFihelifDp6RkSMwhm9mylmVHEIi+hkFcnt7FM8UJ9D6fof/78MIK4l/uTH7OFH
	3MJLeqziRVN8cNji6O781Z+yIMHQEdUKxEh0CFc0vzh34YF7qsEGZPveCD3OWQhxpdhIY0WJZRNvs
	Plet+S/1awyeh+s+WSofWG3bMaAPO+0PkBG8EGQ+QLWnxuqn7xGFY1i+3WXP21g7SxmZaJ5DGaqZh
	1yyILRvIejVXWn/SlBs75/IcA/R3nFpjZmhn2/oCbkZwl+vQDGUAcR4Hu9EYb5wSH3wAbHBkgYSP5
	cfLZdGHQ==;
Received: from ip6-localhost ([::1]:62838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onQcx-0065nV-O2; Tue, 25 Oct 2022 20:34:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11934) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onQct-0065nM-Nh
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 20:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=cv80CEZPemWFdxbqYF9P9D4wF12kqM4HAHN7iNVOHHw=; b=N7WYxa3smPUobCeIA56pyM0Ob2
 x3idI9tPNk53ylCXO2YSHD9ffG/3Hvq2a3RoavAPXxqjQxLpMoQizv/CkrkU4Zn4AeT0oHL+RM69o
 2nHZ4VaPd96rDn2UEJE7CdTAdl55tp6oNAWOKtGszv9a3+uricjHxYJDL3lYDUagEHHm6f8TeLLGA
 HBtRs4FX08e+xJ2+X7vCglT9RcWnZIfwwROBw8L1dLNvVrFuOFbHEOG4CAhNOGWqXAZzqsb4c8Ae2
 oQSgTtoI0POhCF/gmBcIjd8gOSr4NnrHl5LBlN5jKsZPE9VheJUUZuaNEWMhjrzh9WVXj8dNguvDw
 quh3ULX998iFhZDFyoN3Wb0BeTHnHylmxZlP08DiAJKWoGf2Qq/1ZapOLzCIC5Lf0JUW6/iT+rEK+
 4qqtXFXK6c0rHQZdGhVYTfAkpW3WuH6kau+A5JGzxnHeKzvHobfypPufFhjQX3MaE5sOR4LSw6Zcf
 qiluk6NwsCgaEg/XcrxDjXF/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onQcs-005miS-6m; Tue, 25 Oct 2022 20:34:18 +0000
Date: Tue, 25 Oct 2022 13:34:15 -0700
To: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Subject: Re: smbclient --max-protocol=NT1: why it requres setting MIN
 protocol too?
Message-ID: <Y1hIR7BP/du669hz@jeremy-acer>
References: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
 <91404b18-9bfd-a9c8-dc5a-f18672933b6a@samba.org>
 <2040ec08-ecb3-9181-c46e-e8f9d5e3691f@msgid.tls.msk.ru>
 <e3b25688-93d1-ae69-47be-0d2db7020723@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e3b25688-93d1-ae69-47be-0d2db7020723@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 25, 2022 at 07:07:36PM +0100, Rowland Penny via samba-technical wrote:
>
>
>On 25/10/2022 19:00, Michael Tokarev wrote:
>>25.10.2022 20:57, Rowland Penny via samba-technical wrote
>>..
>>>I am just trying to understand this, from what I thought I knew. 
>>>SMB is a negotiating protocol, so shouldn't smbclient negotiate 
>>>the best version of SMB to use ? i.e. You shouldn't have to tell 
>>>it what version to use.
>>
>>Well, it does the right thing. NT1 or CORE are insecure protocols,
>>this is why they've been disabled. A bad m-i-m can force a negotiation
>>to be agreed upon an insecure protocol. So you have to explicitly
>>tell smbclient to use known-bad one.
>>
>>/mjt
>
>While you are technically correct, surely SMBv1 should only be used by 
>smbclient if the server is set up to use SMBv1 and will only be used 
>if none of the SMBv3 or SMBv2 versions are available on the server.
>
>Or am I misunderstanding something ?

SMB1 is only now used from our client if you deliberately specify it
in smb.conf or on the command line. Michael (correctly) complains
that if you set -mNT1 (meaning max client protocol is NT-SMB1 - i.e.
use SMB1) that it won't connect if you have "min client protocol"
set to be SMB2-only (as min-protocol is now less than max).

Michael suggested that if you explicitly set "max client protocol" lower
than "min client protocol" on the command line, that "min client
protocol" is then explicitly set to the same as "max client protocol"
rather than failing the connection, which makes sense to me.

