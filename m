Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F968B5F33
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 18:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zMxR+A2koUavQNh4I5bOCzAzxmXskWL8t7JgfYxOp5o=; b=vY+YGEseZHu2RP7mpedfRAsoCZ
	GEJIwe+k9ZPjG09k7++oNq+8IPgg/PPlWZe4qjRnWg3ePkf5i+bmfDcxTdhEwArks55Hgzvc2i2E6
	3SMTVULKTaW4S8UiJafWsi5r+mobM7a7N1bAfVQP4S097ivHuaNmCK8FMfelEn+jZrBiG6EGnjzkW
	SN9yR8CjimsA45PSSjC1ffv3n1OcH9+JUiCk8IBp3l+EDCaDofBK3fKjeobVunGQUIZB1PPYssl+M
	QLgz9+rwxKkKYz3hq2GQGT93pvNDCnBEDiwkhOt5KMjYMLWItsL7bKLHwi1oAwLiWyCTCiae4TSNr
	/9Mns1Ig==;
Received: from ip6-localhost ([::1]:61982 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1U0l-006180-Rl; Mon, 29 Apr 2024 16:37:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21324) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1U0i-00617t-IG
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 16:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=zMxR+A2koUavQNh4I5bOCzAzxmXskWL8t7JgfYxOp5o=; b=YApLYdmBNIVKCLW6dze9FoADVY
 zyXDjMIwoLQ1CIUee5sDungsxhlO0H/7K2S65C+LJHO+6x3fRoZA7R+2pJd+eHUli8zvPw+22k79g
 fla2T6dsue3LlGWeJuEKS/w9C67veNxMkXmdyti3TuATI9/kq3pS2QnjqbRb/U7pvBdPGtSrPE729
 IbT2N1J4bz+pL6QVfEf/9nvcDt7p5kDsv0EOqwIzplWF6g6LyVfDMjLKnNMW1uZSkaSPpaHvEasMR
 4xkeXSbUb2TdvGRLmdwqFrOb+VJCLclHbDxoos4rNSTB/1WdzCUrjTLAEQoh4gCRkRE72FgUzbEBA
 ACrb8spSWhoA48hnZ5HkgkmSrUQnDRnCRwpR8fFE/JhdFXtT2xnR1I1pbMnKQCxCQg7qjSohnJwtN
 GtLR8zCd4+K2ymt28Xb32iLo5hxrNa6PAf7ZKxAJFCgFnVsgvv7awjIHsurymkxyZLkpba1kZJ0rd
 wegVZqW0GJ/nuCR5GdOm6bE/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1U0h-008xxV-1z; Mon, 29 Apr 2024 16:37:47 +0000
Message-ID: <ba6a8bcd-ce81-4ca4-9d90-16955ee5508d@samba.org>
Date: Mon, 29 Apr 2024 18:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: query fs info level 0x100
To: Steve French <smfrench@gmail.com>, Ralph Boehme <slow@samba.org>
References: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
 <72ec968a-ac67-415f-8478-d1b9017c0326@samba.org>
 <CAH2r5muhcnf6iYaB25k+wZC50b5pNV+enrK=Ye_-9t2NCVdCJQ@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5muhcnf6iYaB25k+wZC50b5pNV+enrK=Ye_-9t2NCVdCJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 29.04.24 um 18:13 schrieb Steve French via samba-technical:
> On Mon, Apr 29, 2024 at 12:31 AM Ralph Boehme <slow@samba.org> wrote:
>>
>> On 4/29/24 1:27 AM, Steve French wrote:
>>> Trying some xfstests to current Samba (master branch, Samba 4.21),
>>> they fail because query fs info (level 0x100) is returning
>>> STATUS_INVALID_INFO_CLASS) - this works to ksmbd and I thought it used
>>> to work to Samba.   I do see the SMB3.1.1 opens with the POSIX open
>>> context works - but the query fs info failing causes xfstests to fail.
>>>
>>> Is that missing rom current mainline Samba?
>>
>> have you enabled SMB3 UNIX Extensions?
>>
>> smb3 unix extensions = yes
> 
> Yes - it is set to yes in the smb.conf for both the global section and
> the per share section
> 
> I also see that POSIX extensions in:
> 1) the server returns posix negotiation context in the SMB3.1.1
> negotiate protocol response
> 2) the server returns the level 100 (FILE_POSIX_INFO) query info responses
> 
> But the (current Samba) server fails the level 100 (level 0x64 in hex)
> FS_POSIX_INFO with "STATUS_INVALID_ERROR_CLASS"
> which causes all xfstests to break since they can't verify the mount
> (e.g. with "stat -f").
> Nothing related to this on the client has changed, and ksmbd has
> always supported this so works fine there.

I guess fsinfo_unix_valid_level() needs
fsp->posix_flags & FSP_POSIX_FLAGS_OPEN
instead of
fsp->posix_flags == FSP_POSIX_FLAGS_OPEN

In smbd_do_qfilepathinfo() we do the check with '&' instead of '=='.

metze

