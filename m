Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C115F9F84
	for <lists+samba-technical@lfdr.de>; Mon, 10 Oct 2022 15:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=lpbaaSlyy5rGcnEvFyh3jnwbtSXlwc1YXmG8IvWaDcU=; b=OwGSwf7MGFyyGfpoTZKlOob4pj
	VuNtSloZwEH0SLEKIEe/OVJnGpxGlW81oFeegZzav3Y6y5ZEMm3DyAvkxliS85vEJTNKOJ5ym2shL
	YHKd3kojiUAyfvWIjzyuPk1dqkcXR2GoUPC03rHjh4xpV01yPSxP92UI/RkNLEE4mnOrVxi4wiHZO
	/S5lXWaDcwVc3o536e4OvYCsD7gXotCxlTN9jmY61F2sH5sgjhtpjacP2zrDLJamHeMOwjZ0lVD6C
	fgMp69hl/F06sszr1CV9ef9AaGf12IdsmN1KLi77mw9DZmIoY4OcxGe469AtMErsrPP2Hcz+Ys8Xd
	l84UP3sA==;
Received: from ip6-localhost ([::1]:35850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ohszE-0019cC-21; Mon, 10 Oct 2022 13:38:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ohsz7-0019c3-5R
 for samba-technical@lists.samba.org; Mon, 10 Oct 2022 13:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=7xpfijzjWlHct1Qvm6zATnoFPJVaqkx2yNcfcnXtym8=; b=rCzU9dd7sXwhU1yJ5laduVxMGQ
 tvRGH61uxucD5hFSekZ6d2Y/ADYold3sla2kgfj1/O5QqxV8k5fUu69377LXhPm2l8po4GXUYRCL6
 wZygldlTKmESGj2W2EJkQhSKOalYV+fk2Zv+h0aVcL95RlziWmhWYddJxyoXaxvk6qWTmq+nE1wUR
 GwtRO6ZvhxQnBUccmRB0Zc2KW3bbCg0TmbQfbgFVKWxvJ45VW7oEVOA+4LRg29SNnz7P3sVOgd6A4
 ihsAx/NBS4KAjE5xjnOVgcXRaRULPzXxTuzQiQLH1blevgdUtE5/Xq+xhXCtzHwlXHbFSY/oayJDI
 3D/IUViQr8B0vd/V5r1/TbL4Gh0DqOsM5kEnUCOCCMbeZqQkHYszuRQQReDnDfUz69bTc9wFzZZ3q
 aF3oUbdIJIidILDD6LJc7sPgTgkRGSTp7OHNuFRwgAxgnmnUlje8ABD8nIn0KuMK2JRkJb7+Usce2
 lbf0TY4umjS/W+SfeMHtK3j5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ohsz6-003iqS-Iz; Mon, 10 Oct 2022 13:38:20 +0000
Message-ID: <e3a68344-aa83-4784-b3cd-0309d6ad59d0@samba.org>
Date: Mon, 10 Oct 2022 15:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: vfs_crossrename not working in samba-4.15.*
Content-Language: en-US
To: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <46bd690d-35c0-0d2c-3101-b90d65b0b35e@samba.org>
 <9dd2af39-6816-7364-aceb-b8bbc5e972ab@samba.org>
In-Reply-To: <9dd2af39-6816-7364-aceb-b8bbc5e972ab@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

small edits:
>
> So we have two requirements that do not go together really well:
>
> 1) make crossrename stackable using VFS ops
>
(needs simultaneously two locks)
>
> 2) keep the share mode locking safee locks. /
> /
>
(prohibits having simultaneously two locks)

> Maybe copy_reg can be improved or do you see any serious problem with it?
>
Maybe copy_internals() can be improved or do you see any serious problem 
with it?
