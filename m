Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4041EA84738
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 17:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=UwLvtdGW0+sL/zbgtCjIPaBj4FugKsVwphwbmdxGHtE=; b=pmTV8TLGJodi/NBHip0Sa5RwLh
	g4Clmwx2JcXzOmVKK+BxBzV/Xare9gamxgjgvXqQS75N1Gbuyok75w+ovbyY7Jgn5CdEPUoOsFsWX
	i91CnZm5zDqrprOZdPddDdVm6LwuDD83QMUdGOoOnsTzCIxMUK7oSgA7kRuJEItUrE+MoK0oVczmn
	dJCCWPzNoSe/nNxKzxOb6GzxevuW/6rePGcMMXdGC1mogAiQoPB6YBYVFIBY3nIIVzwS7ZNRQlW98
	/15rT0C1Nf1ozDGad+Rg83uYjJwjVv8mmEXOC80N3MFRJvWUYRsPnwGPgVGJ9jezxcP0P0N3dKGHa
	I/JHIhgw==;
Received: from ip6-localhost ([::1]:30884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2tQT-002AEh-3C; Thu, 10 Apr 2025 15:02:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46218) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2tQN-002AEa-E6
 for samba-technical@lists.samba.org; Thu, 10 Apr 2025 15:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=UwLvtdGW0+sL/zbgtCjIPaBj4FugKsVwphwbmdxGHtE=; b=1ufWrTx78bPwf3jKa0YdRu8GRl
 HicTdbiqeViH3i+ZiDXYymJL5aHDE5lOA0J/6COzwW7/ajsUIABtJ4CYH035vrMgEbnwU4QLcUosv
 qffkTpA9jQ0I3jTLWXQRG51B3XrIDvu4dw4dBArLtFt3vP3oZLd1j0JSaQ6LMq3ccOE2M6stE3iRF
 ZAzicV7O+TOgPXtp0Dbx/HslbBQ3PKM7NFPo9MYv0V3rCGhYnTwtCpTf2JKapbQWPXxXAm0isqY4d
 10tfIyLPdcJ67v8UY5q7He97hBEChLaPBZRzSEURqkfYYJ9BB39mBwF6thCIpaF3O/OvHBuzt1r7I
 1hQvw6oo/ZQLKPEvXsIrn3dZetIRYARPCe/C+8iWE3gwVvOqW74GQvLDBXiGcQ9Ro8Pknaax3YUK0
 gOOLoHMZj2CeFFLQ1K6IHA2447irkgXQc7pHiN9iOpwiiTysNTkT9Ny3W9tdgOODOsWaO+urUaGU+
 h+ob2Ey28p1Z8bzb5Fr4LEEO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2tQ9-0098HC-1s; Thu, 10 Apr 2025 15:02:26 +0000
Date: Thu, 10 Apr 2025 08:02:22 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
Message-ID: <Z_fdfszysLKt4Xij@jeremy-HP-Z840-Workstation>
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <Z_b4DS3kOpbCI4pG@jeremy-HP-Z840-Workstation>
 <9f7da486-5d85-4ef3-8fcf-14b408d78700@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <9f7da486-5d85-4ef3-8fcf-14b408d78700@samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>, Tom Talpey <tom@talpey.com>,
 "vl@samba.org" <vl@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Apr 10, 2025 at 10:33:54AM +0200, Ralph Boehme wrote:
>On 4/10/25 12:43 AM, Jeremy Allison wrote:
>>Does Windows ever send FILE_DISPOSITION_IGNORE_READONLY_ATTRIBUTE over
>>the wire ?
>
>No, it's local only, cf MS-FSCC and the thread "SMB2 DELETE vs UNLINK" 
>on the Linux cifs mailing list.
>
><https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/4718fc40-e539-4014-8e33-b675af74e3e1>

OK, but does the Windows SMB3 server filter it out ?

Can a Linux client send it over the wire and does
it have the desired effect ?

