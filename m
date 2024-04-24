Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD528AFDE1
	for <lists+samba-technical@lfdr.de>; Wed, 24 Apr 2024 03:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/knYYhSGvWpb2zY89wxMIfXwHxKMotVN42dmr8XUaqI=; b=14QujJlA4hMAMkbgHqNi08ctpg
	E9cEJlehQSJ2Oz4W9iOjLVhY3K3k+N5eHRyiA26+MOgRrqSYIfxSuEeeX/cxvMRVjJDMlsBxrqC2t
	WxiJjhKm2x+24ugxq3wXwYIBBt+qi7ll94xV4y6xaDkdMOnaBCZ/D3YVfSUMtmN1I+yy1IvOO3HzC
	qifZu0uNhkOiqdyUPpjTWxF8GZPABsy3y4LPWWipTMZB8rNwmyx3WgmGyYc+zZww+zXpgsnanR1tJ
	jeuqSxKaw/yNS+g8ttC9802vHOaEO8iXFgXNzGPOK19NO01pTfPquWlQzdcG8OGObrt8YXxW4hYeC
	b0Q9tXmg==;
Received: from ip6-localhost ([::1]:50772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzRWX-005U4V-N4; Wed, 24 Apr 2024 01:34:13 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:59002) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzRWR-005U4O-CM
 for samba-technical@lists.samba.org; Wed, 24 Apr 2024 01:34:11 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id A5E3A41E06; 
 Wed, 24 Apr 2024 13:33:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1713922439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/knYYhSGvWpb2zY89wxMIfXwHxKMotVN42dmr8XUaqI=;
 b=apKlTXdQ2MtxOrCTNRpXzULYqciVc97bVgBYFt36SK0SJ0yIUi+VrTH8a76jOVuLnu0mb9
 Q1t4+5CoUN/yHbkpZNm/7TGWcX3Ts2XNFJR4YOSbXPSJzB/DPwgk9jP3UTC0QtevMIfp0Q
 49dAI5mAWsmU+nSMVZb02aY4hdWXY1bm3SIgaAIATWY9ZwErKthv4nxWtosekWtprKXbcc
 Z0DtpEGw5XadjwdmNdrkzvq4tJEQWn7f5ngOd3Qz1Kxrs2CWVanIw86tXO2oCykbmJsYGS
 X1LbASYGvV0WYBGVimm+eq+3Zy4lBxblJcBvkYnJtQPR95QTODXSIW4WCJwv3Q==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
Message-ID: <09fbc00d-50c2-4ec1-b4db-9e80576650a2@catalyst.net.nz>
Date: Wed, 24 Apr 2024 13:33:56 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Doubts about Samba's unicode translation tables
To: Xavi Hernandez <xhernandez@gmail.com>
References: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
 <8e5edd50-f29a-4bed-9878-2b1b293ff2e8@catalyst.net.nz>
 <CAO9H7P-7XyuptwYrftk1Sm+uiYWN0h+K1kGTKFBk5YdQqK2XDA@mail.gmail.com>
 <2c0bcd14-b0eb-4226-97d0-f141b6c20e4f@catalyst.net.nz>
 <CAO9H7P8-EyJWwGyYpehrcgkAaZ7j1KA=_bF9JYFMHyRmRuDypA@mail.gmail.com>
Content-Language: en-NZ
In-Reply-To: <CAO9H7P8-EyJWwGyYpehrcgkAaZ7j1KA=_bF9JYFMHyRmRuDypA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 23/04/24 20:39, Xavi Hernandez wrote:

>     I am curious whether "Windows 8 Upper Case Mapping Table.txt" from
> 
>      >>     On https://www.microsoft.com/en-us/download/details.aspx?id=10921
>     <https://www.microsoft.com/en-us/download/details.aspx?id=10921>
> 
>     matches the $UpCase table you find, and whether that means we just have an old
>     one from win2k days. I don't see a change in Linux's fs/ntfs/upcase.c though, so
>     I suspect not.
> 
> 
> I've done a bit more research. Actually, the kernel ntfs driver doesn't generate 
> the upcase table, it just loads it from the $UpCase file in the NTFS filesystem 
> and uses it for filename comparisons. The comparison function uses the table to 
> convert both strings to uppercase (maybe not strictly uppercase, but a canonical 
> value) and compares it. Nothing else.

Right. It turns out I was looking at the old fs/ntfs/, not the current fs/ntfs3/.

> I've looked at the code that creates NTFS filesystems (mkfs.ntfs in ntfsprogs 
> package) and I've seen that it supports 3 different upcase tables for 3 
> different Windows versions. I've extracted all 3 tables from ntfsprogs (winxp, 
> vista, win7), the table from the "Windows 8 Upper Case Mapping Table.txt" file 
> (win8), the table from Samba code (samba), and the table from a Windows 11 
> machine (win11).
> 
> What I've seen is that win7, win8 and win11 are identical, vista is different 
> from all the others, and winxp and samba are equal.
> 
> The ntfsprogs package also has code to generate a lowcase table. I generated the 
> lowcase table for winxp and compared it to the lowcase_table from Samba. They 
> are equal.
> 
> So it seems that Samba is using Windows XP tables.
> 
> Some questions:
> 
> Should we update the table to the latest Win8 ?

This is complicated, and I'm not the best person to answer.

As I understand it, you can mount an XP volume with a Windows 11 kernel (or 
current Linux), and nothing will go wrong.

But if we change this table, upgrading Samba from 4.20 to 4.21 would cause 
"ȩ.txt" to collide with "Ȩ.txt". That could be very bad for a few users, and 
somewhere between irrelevant and good for everyone else.

If we do update the table, I think it would be best to generate a upcase-table.c 
dynamically during build using either a copy of "Windows 8 Upper Case Mapping 
Table.txt" (if we can work out the license, about which we are picky), or using 
declarative ranges as ntfsprogs and the old kernel do.

> Should we support different tables and make it configurable ?
> Should we dynamically load the table from the shared filesystem itself (similar 
> to accessing an existing NTFS) ?
> 
> Should we differentiate regular case-insensitive comparison from filename 
> comparison ?

For now, I will just say they are reasonable questions.

Douglas


