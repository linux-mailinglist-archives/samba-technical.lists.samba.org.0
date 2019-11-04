Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7790AEDAC8
	for <lists+samba-technical@lfdr.de>; Mon,  4 Nov 2019 09:48:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=eBUZ1+EwQxMaLQFkvN9fSM7m3K2eQxqFmmh17qNqULU=; b=v/NUB/4QtEfoIsJd4XWYFO28MT
	Cut0/n3Zh5yWW31wetK/aMZ9sYop/2lLFfWVaavqRncQIkYK8GpYNW3Lxviq4pUh1wMGWkbURLlsS
	eaERHlOZNZXzQ1la+XwIEXVNpzH43UWtxjrjdi2jtit5r5LjCO+6bopTuT9LRAZVG/2pTgSNX6PeQ
	67xNXt2aX9d4U8/6uFtouTxMPOSUYQoGk13g7cr6cCECBC8YdILSSka/9o94bPPFL+mp4h1ouW1AI
	S47O41Q3wi9mkuoXp5LN5hIk+ZFylfmG8KeQu8di8+SZ+3BFhVee0YYuJEV3oPLOq0yXKM2WYBdYl
	QD2ti+kQ==;
Received: from localhost ([::1]:62122 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iRY1z-006S3K-7H; Mon, 04 Nov 2019 08:48:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32912) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRY1m-006S3D-9P
 for samba-technical@lists.samba.org; Mon, 04 Nov 2019 08:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=eBUZ1+EwQxMaLQFkvN9fSM7m3K2eQxqFmmh17qNqULU=; b=Ck2GmZYIscOuAHHZQKq4Mk/CZc
 uCpjwGHWZ80soefdQy/XWYupJe0YH0sqkN/MXEvYfcHDxOaazrG1DiUIel1vzVDvy1KDHmavxHHkv
 Kpr1uN9dr1haxdObXfsgJkgEGjFLDMOsZJZfyJFFQfolvpQYjj+HnBKS4XUgqx2z6IWl9mLB7ME+d
 fnoc0V24hei4mYWsYtVDX6Cb6aDCJHxXIEg/8BH6VQyPhkcMHTXeGmFJMjw0BR5AQa7AVJFW933yt
 b8DJW+R5ZXn62Vzf7j4dUPM9cnLmRCuTWPk/kEmTh5Ja+nO0gEuGZWwoJ306VqCjTOfbGzNlIq+vd
 E5z3cZSi9iMGKgeKv/vpPK6ZWZs5w5UiPS5nqRd/US1donGUbAR1Jp8x42TaUb3EBDmutHbMb4j8X
 G8P/G242yHX3xx7W6okdFEm0adA9/4IyXVGX9VM0oVVjTEaf35tHGElnrPDqzwLVgFJHavIl/V33T
 zloVspFGNudkuqS4AI/ueOX4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRY1i-0006OO-M9; Mon, 04 Nov 2019 08:47:54 +0000
Subject: Re: [PATCH] s3:libads: Fix mem leak in ads_create_machine_acct
To: Samba Technical <samba-technical@lists.samba.org>
References: <CAEUGjKjmFJFmz+Wts1UMZaHXKEEpeuY7UmB52H_aiQU=HS11sA@mail.gmail.com>
Message-ID: <937a7927-14e4-be29-a1df-37d19f5999c4@samba.org>
Date: Mon, 4 Nov 2019 09:47:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAEUGjKjmFJFmz+Wts1UMZaHXKEEpeuY7UmB52H_aiQU=HS11sA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 11/1/19 8:59 AM, Jones Syue via samba-technical wrote:
> Hello list,
> 
> This patch fix memory leak in ads_create_machine_acct,
> samba-4.10.9 included Bug 13884 and introduce this,
> please help review and push, thank you.

lgtm. Can I get a second team review please?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

