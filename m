Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 065EA25505D
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 23:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=1ypO3zfSKxUvar/gya+XibAExz8Yl3+bBxpkn9ydZUg=; b=EBXx4YWfwlLONK36kP9UKTrH0h
	iLMyiNeE6k5Sf+36VSMsGHur/b8Tm5vop3TXL2iDkWIxurunT+75x6PSKGxufotlBRKQ0QXMal0hw
	CtpPiih7aNrmdM6CFO+4T8DgTaXeuk4ax2N2KeVxf9YKWt2gleWqCs6svBHKjwFI15zzQjMm8bjc4
	y/lAEZfPZukYMMH30hilBoxm2764joCZ/jEkC09EZXKEn6nINCgvc7369H8zmdSkQK9UOjcdEMsJJ
	cR74c4EU0m3yyg5UdiKZR4y8AST/NKTn93rmdFIQiDk8U4yF/I/eq1H9flRBgdVAWlsI7cEau3XhI
	5mNOSP+w==;
Received: from localhost ([::1]:56788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBPAu-000zsO-V5; Thu, 27 Aug 2020 21:11:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29614) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPAo-000zr7-AL
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=DPdXksPBAJ2aQtGevPnWqMnS3RX/Dc9lShclEyKdxvg=; b=UhLCZc96jxn+s0IZJ/thOIxdp8
 +/vloSjF6nIfh5/18xZv0NQss1mI0FnuyWUhu2BWK4Zukxgnxt1BcpP9defsc+w8mTClulp6CHBBG
 OJy6SmvXPusezAZ3R2Kpa6e7m2/P8eq1X2pSWbzJszfkpn+MxpODL3J+tkK0rrnvPfL6bBa7Dokfj
 3Q0nPRd4I4Oo+5kifDPKnyruzWTQemKGbx9xpF0GXBj5qsw93uZfuPFqu6gGr+coNk4ezNPb7NIX7
 pt3wi7W4DSMFoI2AvsUIRdkDILPgcGKhGRwDdyQ6UNneYR1A9mpymW/Yprty1OyqxtbscEN4ukUmm
 2L+TMya6es6dM9MrUToMzktdI/8DCNa3MLTkNBxRlvTXcqfbNOZo7zBn6ua+XSrtC1kq6TkXGVVSq
 LKRfd0pJ3ENFKwCcejX7eAOBYPx6jCDjuZwsTVIlbbA7dYsAQeOiVhQbYawwOsyn0OJy20r7MJZDX
 pH+u3u5aq8duPlO5+Q54Klip;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPAn-000431-JI
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:11:05 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBPAn-006i10-FO
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:11:05 +0000
MIME-Version: 1.0
Subject: Re: vfs_retention: add this module to make a share read only with a
 special time period.
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-98@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-98@samba.org>
Date: Thu, 27 Aug 2020 21:11:05 +0000
Message-Id: <E1kBPAn-006i10-FO@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TmV3IGNvbW1lbnQgYnkgZG91Z2xhc2JhZ25hbGwgb24gU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkK
Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvOTgjaXNzdWVjb21tZW50
LTY4MjE5Mjg1NApDb21tZW50OgpQbGVhc2UgdXNlIGh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10
ZWFtL3NhbWJhLyBvciB0aGUgc2FtYmEtdGVjaG5pY2FsIGxpc3QuCg==
