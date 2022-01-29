Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E324A2E60
	for <lists+samba-technical@lfdr.de>; Sat, 29 Jan 2022 12:50:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=sA9H7inmOiNV6JEU7oynZszclkiXOxqsN5J70gPUXKY=; b=ii/1SoxmJUhoeUVSOq/oj2c2J6
	taq1jhKKjHUNFE4UXBrScX962qudm79IBhGJnLdwoFNKhDZtW/vTT0EJdfo0+npvRlH7MEi5JSIH8
	VgqkZk2FKDJxTdpdPB+9IfgaO1onS9AfcMapysvx6Leh7+HOIaRi8U9C2YJA/ybmfXUU2xrmHtvr3
	TQq/nb6Mr7T7x3jg58thMzBDzBO8IktUGmkYuG3lQkDC00U1oH9xAOOcwuMtiad4+rPnWMZa2rZMS
	w9/vUXa0ICZjSPrMbHnvJ6qytyV//u38+uBGuqQTAlA02C11gDfiYgeN9ZBOBsRMEGtvPjL0EB6tE
	sn9L6VWA==;
Received: from ip6-localhost ([::1]:27102 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nDmF7-002N4X-HU; Sat, 29 Jan 2022 11:50:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48492) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nDmF0-002N4O-TZ
 for samba-technical@lists.samba.org; Sat, 29 Jan 2022 11:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=sA9H7inmOiNV6JEU7oynZszclkiXOxqsN5J70gPUXKY=; b=n2Gjqyq6G4NIXVeWZqjWSLLy73
 l95GAnWGYFFSe8GfxW2kRPUbeJtB5m5z+vEDKL73qf9I3Z2PVAU7C5Nf8RPc5MlUAtvWchVX55ahr
 /4dYUsj3/PWZO40orB6hbLqh2YuQtdhX9WJVHd/Z7ejIGlIn4EM5Keemeow2I7bGhv6A6nmqtv661
 T8vD/Mxmj2XoJQNJoHZ1LuLi07Z9epg5FhY6Zm6LX9Zss06Jwz0k7ymjJPKLNzRFdN0qiIKXIl2+7
 AsB5X1vd6Ec4ALwEth4grNTc7Cj7b8/fw2m8OwQ5WG4Sf8Ut9u9X0hyAHboPqjX2Fi6nYvrCDSnRV
 +tPuuogcwPjCzv1nCyOvR2IEk2nHPlWPaVHhhY0N70SpP7Uv7SC63rRelp15qaPUEFLz9O7DyTnRK
 HDTrKBRdSpk4EaLejUZO1Q7TwLC/UvCWlYdusozNTgGtXwOfOXcAmTk8MnkzW51HnHq2S+ADgz4Do
 km1Aj8ZDXA7FeFE8VL8fDv3b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nDmEx-001GKp-58
 for samba-technical@lists.samba.org; Sat, 29 Jan 2022 11:49:59 +0000
Message-ID: <a1001ed4d643a588fed7850d8525aa1c7cf2f88e.camel@samba.org>
Subject: Re: Microsoft Enforcement Mode
To: samba-technical@lists.samba.org
Date: Sat, 29 Jan 2022 11:49:57 +0000
In-Reply-To: <cc895930-b174-0371-c4c5-807bc06e34aa@kania-online.de>
References: <cc895930-b174-0371-c4c5-807bc06e34aa@kania-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2022-01-29 at 11:41 +0100, Stefan Kania via samba-technical
wrote:
> I just read, that Microsoft uses a new Enforcement Mode on all MS DCs
> to
> protect the DC against CVE-2021-42287 and CVE-2021-42278. The
> Enforcement Mode can be deactivated until June, then MS will force it
> on
> all DCs.
> But with this mode active it's no longer possible to join a Linux-
> Client
> to a MS-Domain. I could not find out if this will affect Samba or
> only
> SSSD. If it affect Samba will it affect all Samba-version?

I think this is Samba CVE-2020-25719

Rowland



