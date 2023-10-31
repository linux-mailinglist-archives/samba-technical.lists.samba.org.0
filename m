Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 498DF7DD25B
	for <lists+samba-technical@lfdr.de>; Tue, 31 Oct 2023 17:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WgIHfQVO0bMIpy3e7h5nbf9256l07d44KcrPN3u8KP0=; b=fNBMd0ZipqE/JRIn7QI1/OfYFF
	X7IdhIGxVjL44C26MTuX4tPtd87wxJ8JXjZkk5p7wYdPw2k/Db3SG02GHn9NLR4V+DEQVzIQAy2W3
	EK1SoV/Npif47wNUqaEb0P1gRIohGECf7ZScEzZ3ydPXc2lD7OkyONZar4R9QPbUhiK/Q5wfiidK2
	BB4zSn3VaAKkzp6YNQ5LW8kIwTewGK2SnH7v0HuOPssFsrTvUxbj9QoaDBd9vlLr4DVl2akbEmQuc
	EgHMvdz6OlZ3wEUF7Op2yyecvUmzaSvdGj4FiCRKMhSc1O3BZn7DW2l2IiWNrCodeG7EOVNT2ZiyG
	FBhPy4vw==;
Received: from ip6-localhost ([::1]:47820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxrnw-003i1L-Gh; Tue, 31 Oct 2023 16:41:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxrnr-003i1B-5i
 for samba-technical@lists.samba.org; Tue, 31 Oct 2023 16:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=WgIHfQVO0bMIpy3e7h5nbf9256l07d44KcrPN3u8KP0=; b=G6PrrMi0vIrWfvKdwrINjySzmx
 X1C3XIxrQr2ioGgbDqkAYiJk3KCHjVVh24OaXpdO97Hb2dZKsu2KrBs0hGJI1qp7KmR/e4z9vknsP
 +x9gikmTk4PJnsedn0fGQ9feQf2bRkMzpfvv7sGFTb67pS0eABWNoFgOh8c2VPv+ljMWq3kNpr+WV
 C/vvR31rjZEtwBQ7E6Dcf3kZfkfWMR+t7oikyVN/b3hVzFOnkWCENe3/Q0R/fo/ZCJD50S0k2jm2I
 B2ndP2JYS2s3od7jG+g1jzjZOcceR6ZEDMGOYGW7g2/pN/sU0oTj4JMOi8bCKEtQtz0x8vgO+Hu9e
 uQ66l4sGWknI3foSlBLdUgcfPiioPhSXsiAYChJpQUcP93oyOYa9pPFuTjjcmrInNDIapXca1HNui
 RAKbyjv6mAhs/8jXtjg03ZzN92O4i6haYxpqWdyWvhROmDu9j5Aj6zetLlhdzNeyAjoq42ZL+njXD
 P9wVZRLeXYLKmS+kWP9iAG0Q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxrnn-003XWo-1j; Tue, 31 Oct 2023 16:41:16 +0000
Date: Tue, 31 Oct 2023 09:41:11 -0700
To: Tom Talpey <tom@talpey.com>
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Message-ID: <ZUEuJ06OejtbYkAy@jeremy-HP-Z840-Workstation>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
 <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
 <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>
 <64ddbbd2-9499-4f6d-ae64-19fccd924220@samba.org>
 <6b020b4b-9c7d-431a-86d7-fe4ee01a0df6@talpey.com>
 <4b0104db-9a80-4288-96b9-fdcd6a37fd1e@samba.org>
 <4e2895ca-feb0-4086-b478-2dd8be83d442@talpey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4e2895ca-feb0-4086-b478-2dd8be83d442@talpey.com>
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 31, 2023 at 10:29:29AM -0400, Tom Talpey via samba-technical wrote:
>On 10/31/2023 9:28 AM, Ralph Boehme wrote:
>>Hi Tom,
>>
>>On 10/31/23 13:48, Tom Talpey wrote:
>>>On 10/30/2023 2:53 PM, Ralph Boehme wrote:
>>>>Otoh, in the case of Samba, storing the DOS attrs in an xattr in 
>>>>the filesystem is an extra IO syscall.
>>>
>>>Isn't it even higher overhead for the client to be setting this?
>>
>>it's not about client initiated setting of DOS attributes, but 
>>implicitly setting them as part of SMB2-CREATE (and similar protocol 
>>entry points) processing.
>
>Oops, I forgot to context switch from client to server. :)
>
>I still agree that managing the archive attribute is best left to
>the filesystem. Should this be a VFS behavior, perhaps?

No (IMHO). This NTFS-Windows emulation behavior. The VFS calls
don't really do that, in Samba this is in the layer above
where we use the underlying VFS to emulate NTFS-Windows.

