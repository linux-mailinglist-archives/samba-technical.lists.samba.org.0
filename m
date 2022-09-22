Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10F5E65F0
	for <lists+samba-technical@lfdr.de>; Thu, 22 Sep 2022 16:40:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=TVe9xn31Q4Wu/V+h/w7E8IHvnB2PaCIApAV28if4S+4=; b=H5I8KDzMABVMi/U5FzdkFaDlbx
	NGsV6ku5RnU1CyQVS4Rki1f+ORgZ53S2Pq3p7TZJunNgx72U1lXTxToQYhk6OvwRNRxjY6RwOMuEp
	brN7Ub6ZBuJhVRGA2FwMKrCibkTtgddf8GYLG0NVBF3KKsj2Fj1WPvv9e7bVJS7uudwKL41jeSJI+
	73chE6K7qED+xYJpzYuR60FMuCwBrkgHkG6MoN9FFidfPElAWZAu+AWO8OEJ2fn7Q0OC0PzvzVh7V
	BL1Keli/WB9Nkj4XQU/6/tAYCH6UeCGXuYO9fqvkobGjBFcje9pZBJjQxTSQC5HxAYWaRQx/blIAs
	a3IhV1Tg==;
Received: from ip6-localhost ([::1]:49322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1obNMW-0032J7-7t; Thu, 22 Sep 2022 14:39:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20830) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1obNMR-0032Iy-F7
 for samba-technical@lists.samba.org; Thu, 22 Sep 2022 14:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=TVe9xn31Q4Wu/V+h/w7E8IHvnB2PaCIApAV28if4S+4=; b=PuGZJrA8ngSZvINuP9LjPfIL+U
 NtppG/OWfGKtj/tNyxZnrpz6NGHRe5feRaRQwLl9sq7oTdyMcuumRUr+sjJkJxrW9qsHxfBGz4jXW
 2PYFaY3NttVVdBB3JTr0MvE55znfIqTPn7Ntj2WTNLmQ2QcHMvXqjd4eXqyN5XGXGdPmdyaZlLbyK
 cXrvawI6fM4xZ0B85EqUedOxfZawIn1G+wEmOfIR0lOQztMwLHhHxlB/os5XdE86iMHajx5NRcj6Y
 oKvSG4j/qNmg6INr/CSLB5TEz61fJhN26vPwklRPdWHixfhiQKeAEk+McmpFdiPV4Zumr7mEyZAd9
 pQZw3/HcedcMjh7UbPjuE3OXJzeisXmlcpG0e8FMcLxHQ3NCEyzZPD2OybFODc0ujmw+clR4ciRH6
 KmqSKDKiMkSBN7w5BeTLbgwqMuXkRne5okMjsxC4SJg/njhhY1lE9leOw8xxvrfFTh9VazI6zwmfk
 +F3UJt3mgHDWIoYmnccTnvo3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1obNMQ-001UjI-3k; Thu, 22 Sep 2022 14:39:30 +0000
Message-ID: <e8bd2297-086f-b4bc-ba5b-52ecf5d23377@samba.org>
Date: Thu, 22 Sep 2022 16:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAB5c7xoG+7oowYFG93rdv3cFeNRs7-5r5DOLxObyYg_rTGpyUQ@mail.gmail.com>
Subject: Re: MacOS Ventura, compounded flush and close, and io_uring woes
In-Reply-To: <CAB5c7xoG+7oowYFG93rdv3cFeNRs7-5r5DOLxObyYg_rTGpyUQ@mail.gmail.com>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

> I have two questions regarding this:
> 
> 1) Are we sure this is the correct behavior vis-a-vis compounded requests?
> C.F.  MS-SMB2 note:
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/a64e55aa-1152-48e4-8206-edd96444e7f7#Appendix_A_245
> ```
> <245> Section 3.3.5.2.7: In Windows Vista and Windows Server 2008, when an
> operation in a compound request requires asynchronous processing,
> Windows-based servers fail them with STATUS_INTERNAL_ERROR except for the
> following two cases: when a create request in the compound request triggers
> an oplock break, or when the operation is last in the compound request.
> ```
> The above appears to be something specific to Windows Vista and Server 2008.

See https://bugzilla.samba.org/show_bug.cgi?id=15172

> 2) Has anyone been working towards adding a more granular cancellation
> mechanism for vfs_io_uring?

I'm currently reworking our io_uring integration,
which will make it easier to use IORING_OP_ASYNC_CANCEL and/or
IORING_REGISTER_SYNC_CANCEL.

metze


