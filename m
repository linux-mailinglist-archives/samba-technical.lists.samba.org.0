Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B58ADBB7
	for <lists+samba-technical@lfdr.de>; Tue, 23 Apr 2024 03:57:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GVY+wPHkc7pfuGKTqnpxRDhEPTjtxriF7PpGtO6iGb8=; b=Z+4Zvyn0cHWc4CF/4fTAAWNzBc
	yYFjX2biD6fvjmN6iy2Em1p9gL38yzZJRAoinhR+hoqrSYPYshxRFo1+31TpFUAs4kMwH1KwkhOS7
	lUvwZrwHEglFIDKLHQDkzQVQRUaOAOJ6OWtqYX/NYc/JamQ/J/FhPy3mPZLhPabX/Xl4eBJjlmrcG
	kV4tX0C3JPOepvO6PBN+zhV7SSS2qAIvf5RadU0P79fKMaHS8r06ftNA31bVPkJeitl+Wyy6ioItG
	uUEuPo5w1zyx7ssAXKEzJKxX0fZoVIPrv4rsHqHCTE2H67/wFvSjo/0c6gVCs/vALtKQhslfqjgRp
	1bbv2v1g==;
Received: from ip6-localhost ([::1]:42740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rz5Oz-005P24-Dc; Tue, 23 Apr 2024 01:56:57 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:51100) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rz5Ot-005P1x-2M
 for samba-technical@lists.samba.org; Tue, 23 Apr 2024 01:56:55 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 04DB03FD14; 
 Tue, 23 Apr 2024 13:56:42 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1713837404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GVY+wPHkc7pfuGKTqnpxRDhEPTjtxriF7PpGtO6iGb8=;
 b=MuFpmPeq2WPZvGZsuyV+AQIkd2F44dzIFrlZ1a+tHu5Psth7f1JONnVCho+1Vd+f+e7FPM
 Tem5rn5MfYtaDoxp2FUBlRvQcYzMrMy16AW2s8XXOBWtCDyUWRNJtv2BCdbK0wdWqR9hJz
 YtYzwWX2sgJFKVGqIMhMurpgOI9IuLgt/i8tfX6qTzfQLwoTUd9LY+PmAf/iA8xMUtBeX9
 9Su5MCsyzQMwl1Q/xR2rGuS7+nHheup7357WWqR5EYHStJKswHAiYz11tSo2ieCAo7/G29
 LL+g26qL9F2i+pofCLuNig7r6MDcpSnh+CC5bu9dQbFIl/rKVS0tMEpphSquMw==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
Message-ID: <2c0bcd14-b0eb-4226-97d0-f141b6c20e4f@catalyst.net.nz>
Date: Tue, 23 Apr 2024 13:56:41 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Doubts about Samba's unicode translation tables
To: Xavi Hernandez <xhernandez@gmail.com>
References: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
 <8e5edd50-f29a-4bed-9878-2b1b293ff2e8@catalyst.net.nz>
 <CAO9H7P-7XyuptwYrftk1Sm+uiYWN0h+K1kGTKFBk5YdQqK2XDA@mail.gmail.com>
Content-Language: en-NZ
In-Reply-To: <CAO9H7P-7XyuptwYrftk1Sm+uiYWN0h+K1kGTKFBk5YdQqK2XDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.09 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[gmail.com];
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
Cc: Stefan Metzmacher <metze@samba.org>, gd@samba.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 22/04/24 21:01, Xavi Hernandez wrote:

> I think we are dealing with two different things here. On one side we have 
> locale-based case-insensitive comparisons. This is the most common situation for 
> applications where they need to be able to compare two strings based on the 
> specific rules for the user location, so that the result of the comparison 
> yields what the user would expect. The same exact strings for another user in 
> another location (with another locale) may have different rules for comparison 
> and return a different result.
> 
> On the other side we have case-insensitive NTFS file accesses. In this case the 
> rules need to be a bit different. I see 2 major things to consider:
> 
> 1. The comparison cannot be locale-related
> 
> When a file is saved to the filesystem, it cannot depend on the locale of the 
> user (or even the server) whether a file name is "equivalent" to another or not, 
> because changing the locale can cause the appearance of duplicated files in a 
> directory.
> 
> 2. Only comparison for equality is required
> 
> To find a file by name in a directory we just need to compare case-insentitively 
> for equality (normally a hash is used to find the bucket where the file resides 
> and then a case-insensitive comparison for equality is enough). We don't care 
> about the relative order of the existing name and the name we are looking for. 
> Another very different thing is, after having listed all directory entries, to 
> sort them by name to show them to the user. This later comparison depends on the 
> locale and is made on the client side.
> 
> I think that NTFS implements the $UpCase table just for this purpose: It's 
> locale-independent and it's used just for equality, and this is independent of 
> the generic NLS-aware functions that Windows provides.
> 
>  From what I understand (though I may be wrong), it seems like Samba is using a 
> mix of both things: it uses fixed tables to convert the string case, which is 
> locale-independent, but then it does relative comparisons (i.e. greater/less 
> than, instead of just equality). I don't know how NTFS works exactly, and most 
> of the information I've found is quite old, so maybe I'm completely wrong here, 
> but I think it makes sense to do case-insensitive comparisons for a filesystem 
> in the way I've explained, and it would also explain why NTFS still has the 
> $UpCase file.
> 
> Does this make any sense ?

Yes. A sorting compare will give you equality (in a given locale), but it won't
give you a canonical version for hashing.

In Samba we may conflate things because we are not just a remote NTFS, we are
also Active Directory and RPCs.

I am curious whether "Windows 8 Upper Case Mapping Table.txt" from

>>     On https://www.microsoft.com/en-us/download/details.aspx?id=10921

matches the $UpCase table you find, and whether that means we just have an old
one from win2k days. I don't see a change in Linux's fs/ntfs/upcase.c though, so
I suspect not.

Douglas


