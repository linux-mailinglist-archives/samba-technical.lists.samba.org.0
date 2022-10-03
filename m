Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D55F35AC
	for <lists+samba-technical@lfdr.de>; Mon,  3 Oct 2022 20:32:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ybJ5/05uMbfDY+7dLPwBEsjWWl13eGQvoZVPd6RUqq8=; b=Hg15z7ibGspYDZZEVQ+61pNWOZ
	eoerLZa4z/WeKiIxVMUCjO5PrigKXCz02lmHjAPHlrdh3AkAmEKO1F89IQ/dDBvvfs/81SBGj8TES
	63XMoZ0U3VkAmrXntzJjJrYHzfxiRi5ozxHM3vh3/67h8QPOxuXrDXiPbAvnL+6uEfxVA/j1IiW3P
	sCVSyXeWhzUHmbqbVk6fav28M32j8Jz1IYpHjROGnLDnVGab+nigCWalTpYNiBbAZBgPzHcD1eFR7
	uDgewqW9mRvDNchuqzlajIWedOPi0kV5PDw2APPvXiGbtV23z2ChNTj1TT7Phla1HllleaVhGNEwq
	x/9s5iaA==;
Received: from ip6-localhost ([::1]:26414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofQFA-007b1s-7F; Mon, 03 Oct 2022 18:32:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofQF5-007b1i-KE
 for samba-technical@lists.samba.org; Mon, 03 Oct 2022 18:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=ybJ5/05uMbfDY+7dLPwBEsjWWl13eGQvoZVPd6RUqq8=; b=CXqWfKlJFSIXnlmGTilGe2jr9b
 pwSX+/cRfUGbYjBlABvARlBtRZV+Oml63PU+xrnBQ9UOXZFBjH9GwaL0yAcM5NrEO7QWzMNGTB2dU
 wJcLFboBWpkDryojKZ26PL3tv2Tx7ROo3wRN7Ts9IwH23qW+Po+0hlv3bIQA9S+0F0OEfAxryneH+
 dI/nv6Mc1ZCjPIc3jwZnHrNGDGzqwPhUPOdRSNbeKwAmRQj8PUyDHoOLOUBJi5ZGjYkTXdL3v7Uh4
 Y7yVFDx6mPf9Zfq6eAKWdB8MHqFh3AtK8l6tIpK8p7kt+21HAnXMOwaSr2kPb8vS2Lsr39EkIwhlE
 +iVk9J8Mn2XX4xjbdIEYDCHbbfmU4CUQH2KlE7QLx+SLG1RjWnFDy7m4O1OFusXNkk/WVapT9r/zw
 QqIf9qAFQDpxqskmNQD/jgk8rGiEpqZaWNMBgVHJSkgkAFC/zTNyawdt9by5jJXCKMlueyniK6hNy
 7lSPCZURb18y+kcBE8cjcR6F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ofQF4-002rcO-Sq; Mon, 03 Oct 2022 18:32:39 +0000
Date: Mon, 3 Oct 2022 11:32:34 -0700
To: Ralph Boehme <slow@samba.org>, Daniel Kobras <kobras@puzzle-itc.de>,
 samba-technical@lists.samba.org
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Message-ID: <YzsqwptGoGijMcib@jeremy-acer>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
 <Yzsp/U5itUs486Ic@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Yzsp/U5itUs486Ic@jeremy-acer>
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

On Mon, Oct 03, 2022 at 11:29:17AM -0700, Jeremy Allison via samba-technical wrote:
>On Thu, Sep 29, 2022 at 02:17:57PM +0200, Ralph Boehme wrote:
>>On 9/27/22 13:10, Daniel Kobras via samba-technical wrote:
>>>The issues can be avoided with a consistent mapping between Windows EAs
>>>and the 'user' namespace in both directions, ie. no longer present EAs
>>>outside of 'user' as Windows EAs in SMB_INFO_QUERY_ALL_EAS and friends.
>>>Do you agree with this approach? Are there applications that rely on
>>>the current mapping of non-user EAs? Please let me know if I should
>>>submit the patch as a proper MR.
>>before jumping to action can we also please briefly consider the 
>>Linux kernel mount case with SMB3 Unix Extensions and mount over 
>>SMB?
>>
>>The proposed approach makes sense for Windows clients, maybe be 
>>should incorporate exposing the raw namespace when UNIX extensions 
>>are negotiated. In the end this is likely going to be a made via a 
>>later MR in the future, but I'd like to see both cases considered 
>>now that we're making changes.
>
>The SMB3 Unix Extensions can be fixed later via a new MR.
>
>The behavior for SMB3 Unix Extensions should be that GetEA/SetEA
>calls on a SMB3 Unix Extensions file handle should not hide the
>namespace from the client. From my experiments as root on Linux,
>the ListEA call only ever returns names from the user. namespace

Ah, that's not the case :-). I now checked with strace getfattr,
not just looking at it's output, and the listxattr() call on
Linux does return non user. namespace names, it's just the
getfattr tool that doesn't print them.

Still, that doesn't change the underlying fix for now.

