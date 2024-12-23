Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFFE9FABB7
	for <lists+samba-technical@lfdr.de>; Mon, 23 Dec 2024 10:00:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=g5V4xS0OBFfUGGJMmP9jqXv7nSuVVcrxRRkLHl77lP8=; b=ZBJ7QZYh6bw5wywkO6GY2zjlIQ
	9H7NRHRflv+eqHWKM46togy5qSJ4mDc90wyYPLune6ofTjHAyjbg5YzR/VnS5HU/VYWQthviY/8UZ
	UlodhfWCqlywXZKqKjw/NoCyAW3pVzeDiYdLTEeVhkZC2r1KKH0wRfEA6fLbCgbf0GrHVWnFLcP5H
	wMsxmXgGZd9dG+AylBUzZIGi5qwr3Hz6LinfG+YYr30vN4QZycQJklhZ1hec1Mel83Eal4GnVJ4oo
	8phMLgyDtxrEDiXeYGb5OITMpEYgbaFnjyxj4RBGecwzI2onpSvWxc7MLZxTmv7n3zwE2OEdAbtcr
	1Jn6U6tw==;
Received: from ip6-localhost ([::1]:34060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tPeHk-004lsz-Bk; Mon, 23 Dec 2024 08:59:32 +0000
Received: from vps.smedley.id.au ([2607:f130:0:ee:ff:ff:4980:9538]:45432) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tPeHe-004lss-U5
 for samba-technical@lists.samba.org; Mon, 23 Dec 2024 08:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smedley.id.au;
 s=default; t=1734942891;
 bh=NHXkKcrRFLdFxtqyw8SoX2zxXWiI06n7/Kmg3vmBwfs=;
 h=Date:To:From:Subject:From;
 b=iuWW8wzQOdPuyvukyVp32uvYJYyCecqpeYLWRsukq5PhqY2v0z+V3RKUUwUCWJsEQ
 4X0wIw2UTzdZ0WV3tnVw6tU0WFadGJrmGUSlmTxmWlclVMVFA3kT/GdAFthMgb3NUI
 bIxvhL4NMGgVt/FuAYi1bwNr5DZCdHMD5xHSN8UpzbtjnB81DtkGz5mDLHwX6CikwT
 YIC/Mlnsr+E9pPNLKtrum62TInB8mz2M2YfYdwFiKkFSS2OZANErL2u2lgMLUxwRld
 AdyvwuvRWCWK3UE+F1ymsfn4HSbrnl2VRetGmzYhjcBg317TkEfg9ylocd8VAihASE
 4PceXc4o+qdQA==
Received: from [IPV6:2400:a848:4041:0:ddee:5b8a:a17a:3ca0] (unknown
 [IPv6:2400:a848:4041:0:ddee:5b8a:a17a:3ca0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by vps.smedley.id.au (Postfix) with ESMTPSA id 22E642014C
 for <samba-technical@lists.samba.org>; Mon, 23 Dec 2024 19:04:50 +1030 (ACDT)
Message-ID: <a5e738a0-7e3f-4fda-bb69-8027016bb5ac@smedley.id.au>
Date: Mon, 23 Dec 2024 19:04:40 +1030
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: Problems on OS/2 since 4.20
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
From: Paul Smedley via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paul Smedley <paul@smedley.id.au>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi All,

As I've posted previously, I'm maintaining a port of Samba for an OS/2 
derivative (ArcaOS) for some years now, predominantly for the client, 
but I'm also trying to get the current server running.

Versions of the server up to 4.19 are working ok, but 4.20+ break during 
protocol negotiation, and I'm struggling to see why.

A pastebin log of a login attempt is at https://pastebin.com/FNxUpuK7

Looking at previous logs (from 4.19) the problem appears to be at line 
3570 where NT_STATUS_INVALID_PARAMETER is reported. However at line 3568 
NT_STATUS_OK is reported. Tracking through the code, I can't see how/why 
the return code changes from NT_STATUS_OK to 
NT_STATUS_INVALID_PARAMETER. Any suggestions?

My source is at https://github.com/psmedley/samba-os2/tree/samba-os2-4.21.x

Cheers,

Paul


