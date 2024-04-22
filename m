Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3038AC3DF
	for <lists+samba-technical@lfdr.de>; Mon, 22 Apr 2024 07:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JCSMl9gxv8xIZFJ+0VhoJtPvLsIDq0RBTsa9/l9Bym0=; b=T6rUUmZCQ6wKXbvLbyGeX6Q2K5
	dk2LSReSTa/El+7aVHG1gw2RBNVu5NKs0DFNPOoNbv+fUW1gZjgWKvKUGfUJJ3qWa83Zk2WQlsK0R
	pWCxnP1CZybSZpIC6G+pGYHV6elSZRFp2sgzL1eMtecrLcGLD5fNv/BtejJy4mueNMWLXSmnEYhiK
	HC+y3iraf6mJ/k91SmXBw08og/HJ0PqPQO8R83SyYUJqnAxcKqccbL8JuMoxXTwPRHfwNQixuFhDG
	aN58s5gvDhdGrf1cyx23ZED3sAHSw3xAElhuTV/t8QAfEegA5GAKUszRQFSNLgRlvMLWGBrxaiafd
	flYH//pg==;
Received: from ip6-localhost ([::1]:34062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rymTq-005LTc-K0; Mon, 22 Apr 2024 05:44:42 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:47218) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rymTk-005LTV-NV
 for samba-technical@lists.samba.org; Mon, 22 Apr 2024 05:44:40 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 71C583FD94; 
 Mon, 22 Apr 2024 17:26:42 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1713763603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCSMl9gxv8xIZFJ+0VhoJtPvLsIDq0RBTsa9/l9Bym0=;
 b=tC+O3LSViU5lRoNK1AU2/5PucF37x9pnF3R7kzGSZnJUmna1uhkc3yuubV10bz+2FjB00u
 0DUAfjgos2F5fqiWCKR/OR/Cg6uPFiM6GLtDkJjFcOOMq2YXifNdbmWXYwGqfkmI5K9W21
 stvD2RtJ6iosTzh20Db3LHQkz9Mgo4R5J9M4cjr0vO+KBLJgmvCAgl0TKg1t7nj1YyMDEQ
 VEvu3c4jEo0CPugniNh6/VMgtTkPFV/J9AY/ewWBbyEMEkD5tazf6uI6l+JEu7IaPMVw1Y
 jDo4KFmJI8QxFCXujCEa8LZ1f70yZ0vW7cwnlxAG+yC7soY483JahhkPJtcsEg==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
Message-ID: <8e5edd50-f29a-4bed-9878-2b1b293ff2e8@catalyst.net.nz>
Date: Mon, 22 Apr 2024 17:26:40 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Doubts about Samba's unicode translation tables
To: Xavi Hernandez <xhernandez@gmail.com>, samba-technical@lists.samba.org
References: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
Content-Language: en-NZ
In-Reply-To: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.09 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[gmail.com,lists.samba.org];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MIME_TRACE(0.00)[0:+]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Cc: Stefan Metzmacher <metze@samba.org>, gd@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 19/04/24 21:04, Xavi Hernandez via samba-technical wrote:
> The first question is why Samba uses two tables while Windows only requires
> one ?
> For what purpose is the lowercase translation table in Samba used ?
> Is the Samba's case-insensitive comparison method actually equal to Windows
> ?

I don't have real answers, but I think the current mappings date back to
this 2001 commit:

https://gitlab.com/samba-team/samba/-/commit/9bcd133e9e7b0cfe974f273fb23409d660af8358

The Windows sorting weight tables change often.
On https://www.microsoft.com/en-us/download/details.aspx?id=10921 we see:

   Windows Vista Sorting Weight Table.txt
   Windows 8 and Windows Server 2012 Sorting Weight Table.txt
   Windows Server 2008 Sorting Weight Table.txt
   Windows 7 and Windows server 2008 R2 Sorting Weight Table.txt
   Windows 8 Upper Case Mapping Table.txt
   Windows NT 4.0 through Windows Server 2003 Sorting Weight Table.txt
   Windows 10 Sorting Weight Table.txt

That is not exactly the same thing as case mapping (apart perhaps from
the one called "Windows 8 Upper Case Mapping Table"). It seems likely that
a lot of the changes are for new Unicode characters beyond the 16 bit plane.

"Windows 8 Upper Case Mapping Table.txt" has at least some of the changes in 
your differences.txt.

This Gitlab thread is related:

https://gitlab.com/samba-team/samba/-/merge_requests/3258#note_1576341163

I have never got to the bottom of why we do what we do and how it differs
from Windows, but I suspect the answer is it works well enough most of
the time. That's worrying, but not enough to make it a priority.

Thanks for looking and asking.

Douglas


