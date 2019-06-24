Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D35950601
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 11:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=VolWNezCj/mBaElXvccLcbn76eeBfFt9sa/8Aie7bOo=; b=pGx3E17JhMSo/5c6tsHvshZAPW
	tHz7X1bLC8JrCFct8Ovi/oc3tvPFMeum1YGr5u62vR8WLRsM2X9eLqRHL2j0NXI9XpnuSdMSP3+fv
	9tgr0i8kF/Vuy6ss1qTOCmVyxiFg2p80kklUFFuakiSTI6FICpXUOYHO6ExP5XLu2LW3CIN2v9CAr
	2CrM3bGm9kZCLGUKyHul+LHw1y156WZidKoowq4AHqGRj1X2cECr+f4+I5y7W8W++Wm+YKDPprPfI
	TcM3hoKmm7HycsZnv2iPYmBzuzKkNs0DYv50ymWo3hFdN1VRg+Xc9uphRGSvh9bUB18nBG/v1wLrp
	+R4xi2qw==;
Received: from localhost ([::1]:49512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfLWE-001R4W-E6; Mon, 24 Jun 2019 09:44:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64174) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfLWB-001R4P-0G
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 09:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=VolWNezCj/mBaElXvccLcbn76eeBfFt9sa/8Aie7bOo=; b=JmdDkUqpKHh5l8vQ9IjrSHNp52
 pSSGEjuzfwQYUrxFaTjo+ksm2jb9WSBu5nGNH9SYE97pwPMxxVB/Opz3A21igboSygUw5r5pLw1Hh
 4sUjP4DNgyQu/5A/MLKHYwMGcVVX8ieNX1o2YSYIp9yB0PjcnPLz804njV6cktsSE4kw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfLWA-0003tv-Ms; Mon, 24 Jun 2019 09:44:06 +0000
To: samba-technical@lists.samba.org, Ralf Habacker <ralf.habacker@freenet.de>
Subject: Re: [PATCH] winbind: fix crash in fill_domain_username_talloc() if,
 specified username is NULL
Date: Mon, 24 Jun 2019 11:44:06 +0200
Message-ID: <4843149.z4PxEiurGn@magrathea.fritz.box>
In-Reply-To: <b8d53d4b-0b73-4c70-5bc6-3c5e6f7d8a6a@freenet.de>
References: <b8d53d4b-0b73-4c70-5bc6-3c5e6f7d8a6a@freenet.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, June 24, 2019 9:50:55 AM CEST Ralf Habacker via samba-technical 
wrote:
> Hi,
> 
> attached is a patch for git master branch, that fixes a crash in winbind
> when calling wbinfo -u.
> 
> Backtrace:
> Program received signal SIGSEGV, Segmentation fault.
> strlower_m (s=s@entry=0x0) at ../source3/lib/util_str.c:474
> 474 while (*s && !(((unsigned char)s[0]) & 0x80)) {
> (gdb) bt
> #0 strlower_m (s=s@entry=0x0) at ../source3/lib/util_str.c:474
> #1 0x00005563f7957ac6 in fill_domain_username_talloc
> (mem_ctx=mem_ctx@entry=0x5563f8a89480, domain=0x5563f8a7b6c0
> "SAGWH", user=<optimized out>, can_assume=can_assume@entry=true)
> at ../source3/winbindd/winbindd_util.c:1209
> #2 0x00005563f798df06 in wb_query_user_list_done (subreq=<optimized out>)
> at ../source3/winbindd/wb_query_user_list.c:110
> #3 0x00007f3d6620c7f6 in dcerpc_binding_handle_call_done
> (subreq=<optimized out>) at
> ../librpc/rpc/binding_handle.c:520
> #4 0x00005563f797f3ed in wbint_bh_raw_call_domain_done
> (subreq=<optimized out>)
> at ../source3/winbindd/winbindd_dual_ndr.c:202
> #5 0x00005563f797cc3c in wb_domain_request_done (subreq=<optimized out>) at
> ../source3/winbindd/winbindd_dual.c:629
> #6 0x00005563f797b14d in wb_child_request_done (subreq=0x5563f8a89880)
> at ../source3/winbindd/winbindd_dual.c:221
> #7 0x00005563f79a40c7 in wb_simple_trans_read_done (subreq=<optimized
> out>) at ../nsswitch/wb_reqtrans.c:432
> #8 0x00005563f79a3a06 in wb_resp_read_done (subreq=<optimized out>) at
> ../nsswitch/wb_reqtrans.c:275
> #9 0x00007f3d5fe10c10 in ?? () from /usr/lib64/libtevent.so.0
> #10 0x00007f3d5fe0f097 in ?? () from /usr/lib64/libtevent.so.0
> #11 0x00007f3d5fe0b4ed in _tevent_loop_once () from
> /usr/lib64/libtevent.so.0
> #12 0x00005563f7950548 in main (argc=<optimized out>, argv=<optimized
> out>) at
> ../source3/winbindd/winbindd.c:1797
> 
> The related samba version is 4.7.11.

Hi Ralf,

could you please use:

if (user == NULL)

instead of

if (!user)

to make clear that it is a pointer.


Thanks,


	Andreas



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



