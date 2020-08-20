Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3856324B10B
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 10:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3BJlr/7LZN5HFgdwPNT4pjjTevabq0BGqsF4fqGIsF4=; b=1oGzbLOE0po3raoqdkkgTwZZ5j
	mAuJbCG914W4L6KXNI80DFaZtirHDEE1PfzsmzFi046IDCGIIDNHNTKBjMSA1YWSa+YI5NQvWB1XM
	SQmTQ/yZ9fVFWTvTTNCvva3j12zXtoo3A6YfpsmH5J3kTAwQ0WzfSJm0x2SMgYUTiGMTTrlsWnf63
	Ag2PhZmfurcO+RfK+jkH0yXviRTTh06j2dSsKV6BctjUMS6DpVKDvoAR0rTNuOog1CXvo9Rv6ZaNr
	xXSr6DMn0PVRAcn8X/kqItLTaZQBRz/8gsBtzgQRnU3ozSoXArjyKlmXckExZkWJsbz20txkuggxI
	Pd/Mm2Kg==;
Received: from localhost ([::1]:18246 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8fzE-00EOQW-F8; Thu, 20 Aug 2020 08:31:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41308) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8fz9-00EOQP-Bi
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 08:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=3BJlr/7LZN5HFgdwPNT4pjjTevabq0BGqsF4fqGIsF4=; b=UbnZVWKfSMlvSb8LbLznkPIcAQ
 /ENzLGpdMVqh3gibduMmBdWUAC8syA6k1XbEmiCx5pcVuR05zIPcjIsd40G4fIdHKaPHwn8sElJj3
 b+7GrnA0+/smEIk00TUWEW0XqTiBwqycsFUIvc8ORRmaqcOcTsKf5EqcWf3pmwPtgth9sx3SlpL9J
 yAsVWmE07cYYAoudkFo3F5tVH+4sOkadFdfZ+pes4xsSUQZ9/t4RML8z0VLDlq8YPDMNBvjOYvxeo
 xYivg/b/Hlb7/N5dQtrrk4WpkZ0Nd1M2q29gfUVFegA1uohBSzNsxI0U/MYg3GwuokkhpfQDVS4ZH
 R7bRyCVlEp0GRRs6pU7vFg5xLnZ4f5MUd0KllzuHy681s72hnEWroXIJ494HUdIrPkBHr2HBbyuTf
 /uw1s9OgaAtEU1jPNj1qZlArHj+61iIKorC+SGc5Uhu8LWmbhWX8yu76/muE32xW+R14BV1IUmlK7
 0MxHWRefbJACtay0Di5f4+eA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8fz7-0002Ro-Pd; Thu, 20 Aug 2020 08:31:46 +0000
Message-ID: <4c9267080ddc3cc0ab3a20472db4c28135356a74.camel@samba.org>
Subject: Re: "auto" for Kerberos, a history
To: Stefan Metzmacher <metze@samba.org>, Rowland penny <rpenny@samba.org>, 
 samba-technical@lists.samba.org
Date: Thu, 20 Aug 2020 20:31:41 +1200
In-Reply-To: <e64290ecfa717e4c66b9b41e7bdb64d70d8cfeaa.camel@samba.org>
References: <3749194.YmznvRLumo@magrathea>
 <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
 <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
 <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
 <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
 <e64290ecfa717e4c66b9b41e7bdb64d70d8cfeaa.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-08-20 at 20:19 +1200, Andrew Bartlett via samba-technical
wrote:
> On Thu, 2020-08-20 at 08:53 +0200, Stefan Metzmacher wrote:
> > 
> > yes means no fallback to NTLM,
> > 
> > Should we use "disabled", "if_available", "required"
> > instead of "no", "auto", "yes"?
> 
> I think this is a good idea, and consistent (shock!) with the
> smb.conf
> options.  As you know we already have the following synonum table,
> which covers the required backwards compatibility:
> 
> /* SMB signing types. */
> static const struct enum_list enum_smb_signing_vals[] = {
>         {SMB_SIGNING_DEFAULT, "default"},
>         {SMB_SIGNING_OFF, "No"},
>         {SMB_SIGNING_OFF, "False"},
>         {SMB_SIGNING_OFF, "0"},
>         {SMB_SIGNING_OFF, "Off"},
>         {SMB_SIGNING_OFF, "disabled"},
>         {SMB_SIGNING_IF_REQUIRED, "if_required"},
>         {SMB_SIGNING_IF_REQUIRED, "Yes"},
>         {SMB_SIGNING_IF_REQUIRED, "True"},
>         {SMB_SIGNING_IF_REQUIRED, "1"},
>         {SMB_SIGNING_IF_REQUIRED, "On"},
>         {SMB_SIGNING_IF_REQUIRED, "enabled"},
>         {SMB_SIGNING_IF_REQUIRED, "auto"},
>         {SMB_SIGNING_DESIRED, "desired"},
>         {SMB_SIGNING_REQUIRED, "required"},
>         {SMB_SIGNING_REQUIRED, "mandatory"},
>         {SMB_SIGNING_REQUIRED, "force"},
>         {SMB_SIGNING_REQUIRED, "forced"},
>         {SMB_SIGNING_REQUIRED, "enforced"},
>         {-1, NULL}
> };

Drat.  Yes means different things between this table and what we have
meant for Kerberos. :-(

I would still like a common table. 

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




