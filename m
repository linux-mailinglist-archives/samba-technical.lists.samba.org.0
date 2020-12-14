Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9262D9F83
	for <lists+samba-technical@lfdr.de>; Mon, 14 Dec 2020 19:49:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=frpW80Hpx5l6OmjqXebgV8JKMs05hfI6Ocqax9b855o=; b=PCfxFOJit3gZtlFcJMPF8bCNog
	LoNOZapNOJmWYk8mBziPwGX1+5VY51fI4ow8VAsYVDIhFFpMNoh0OKGvHnL3JCLsc/mvsXNOmpc1y
	eTm62iq3T3LXRkwe9wtHevamYDng+ggOxwDMPVT2BuNgi37ELXd+S83Y5shb48a9q9wwR2WUz6u/1
	l9fQhrC7BrH3u5OUrPmKa5LVkHbGK8sGMZ3DCKeMZWqraOZD8NiCYltX0EiwIPRe5I/VuTPnUmgbT
	mok17jZZV7AyGBx/o1cGRZCH0AuLGRRE4gJKqf1TVU5yrjKWFezrbFtpzWDuAE/VZCmOth1Bhw62G
	7GKe+XMg==;
Received: from ip6-localhost ([::1]:19110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kosty-001CXn-2N; Mon, 14 Dec 2020 18:48:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23028) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kostn-001CXg-Sd
 for samba-technical@lists.samba.org; Mon, 14 Dec 2020 18:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=frpW80Hpx5l6OmjqXebgV8JKMs05hfI6Ocqax9b855o=; b=mumy/bJUowl/pPwDy+RiATE8fH
 EPLxLI6bbd7iypsT9Dk+OnIzXigyUVoQezA+/bsmTM19hM3XY64tk+6n/R7oCG3WyOFf2MWx3h3gR
 MCdCQSc4h8zt5yHOfPAh9gQLJuOcp2URtoWhz/F1jPL55M1IM7VircFOU14MrqdB+V/5rRaJzXeoi
 +IH1Zdmf6OrmnPSEJlPdvG33BacEeBkq0R9vs4/DM4hdHCVn8nzzTUgA3ggNV+r9XoaVvMz+VIlqE
 N4mVU/1WvSKOuAyOxWLf6cvAKuOl00dMEivjm2xZwaZrnWkBrkjJLf1WLGK1aZ+fnLlDBAibshWDr
 n2bWuE5gAmrbb9SYYdFVJcAhoZGcC90CxScdQGSAIIHhZRsL04InrAVb5I8H6JZ+lKvGae8M2Mr+I
 tN8Q1DtrPvZdX151kFGS29wwRDuJFpixrh43G0d1goiyKJs9XuYd6Oaz/+0nDV0sqztEoY1o1uhXo
 77/Kh1FZaWNwQ8u8HuyifRfH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kostT-00027B-AJ; Mon, 14 Dec 2020 18:48:23 +0000
Date: Mon, 14 Dec 2020 10:48:20 -0800
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: updated ksmbd (cifsd)
Message-ID: <20201214184820.GB56567@jeremy-acer>
References: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>
 <3bf45223-484a-e86a-279a-619a779ceabd@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3bf45223-484a-e86a-279a-619a779ceabd@samba.org>
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
Cc: Namjae Jeon <namjae.jeon@samsung.com>, Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Dec 14, 2020 at 06:45:51PM +0100, Stefan Metzmacher via samba-technical wrote:
>Am 14.12.20 um 02:20 schrieb Steve French via samba-technical:
>> I just rebased https://github.com/smfrench/smb3-kernel/tree/cifsd-for-next
>> ontop of 5.10 kernel. Let me know if you see any problems.   xfstest
>> results (and recent improvements) running Linux cifs.ko->ksmbd look
>> very promising.
>
>I just looked briefly, but I'm wondering about a few things:
>
>1. The xattr's to store additional meta data are not compatible with
>   Samba's way of storing things:
>   https://git.samba.org/?p=samba.git;a=blob;f=librpc/idl/xattr.idl
>
>   In order to make it possible to use the same filesystem with both servers
>   it would be great if the well established way used in Samba would be used
>   as well.

A thousand times this ! If cifs.ko->ksmbd adds a differnt way
of storing the extra meta-data that is incompatible with Samba
this would be a disaster for users.

Please fix this before proposing any merge.

