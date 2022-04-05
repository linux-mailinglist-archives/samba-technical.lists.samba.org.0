Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 552674F4818
	for <lists+samba-technical@lfdr.de>; Wed,  6 Apr 2022 01:49:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=kC+fl2/zkLi0vw37DupK0Ax5LQq/qz/Pl3LNsuXhgIs=; b=pMxRiQW7j8z3cLIYO9kr5FS7gV
	pJ8fQ+v9xididPO/RV79LzSNokYb3F8/Fry5cDUk832zahcNHiFORlzgvvY+yR3r6GU/rFNav9aZu
	XLqfyb68AGVIw+Oib3Vd2gX7E5LCjmxLwW9gyFks5KNp2pgBs/3LnQNJk9cltlXEYi0ObFoa4XsTA
	AiBS8zr0i/LQ9SdRM0ZrbaT437tkwIn0bXSyzM/YG6T+C3czeqlkiW9N66iXIU5KoU2u9yFPP2sor
	D9fGNOMWR8v2KzF3pZSWzIZOO0ld11m43HZ787IKD+5CmP5aRFQY4qNYAGJriuoPg43i2iKyYdGc3
	VxR82cKw==;
Received: from ip6-localhost ([::1]:46060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbsuu-00AGjR-Iw; Tue, 05 Apr 2022 23:48:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38176) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbsup-00AGjB-Uj
 for samba-technical@lists.samba.org; Tue, 05 Apr 2022 23:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=kC+fl2/zkLi0vw37DupK0Ax5LQq/qz/Pl3LNsuXhgIs=; b=oQzEWs1wpy8biRGPDrvc7gQnxm
 RN+FniH1EEqqvy2Soc4eFufgrsA2dLPcckp61CZz48lugg+VlJp2vWkEjArAzwKnMcTOBctNwZnwk
 4v5Tg0kZcPfqnh0b7XtCllkt5xdBOU3CzeIm6bvVdbbSxE+muv+bhHcuQvRPVv5VO+VudssGpoT9a
 7Q9GUO76V4eVw5o4IZhEW7rmive8qzkKTB1qr0iCudJy6bcBEYHiQDSkWe/bHstht45XFCZoG+Pkd
 pVCbXYC3vvq86wjTpZGbOG6rE9rHJYYFrtJ2I1WtPf/DL/9BEFRCG7C8txdDcD+4o2jvFGQ6rfgXR
 dTC1lW1A+VMB7zXJEH4+E5uyWqPBmGhJSX/DqJrcMP7OQovnaho92wRdPAfL2fMngtW8uHNUwUBw1
 M/q5TMqdn5o9lA9IlWlRd2SxLh6tHzA0ky+scojxT01onSLjJX0je04cRpSKp0Mxne0ntdhUO+ixC
 s/lxkfzuhok5qJggj4+3ZY9C;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nbsuk-005WgR-NV; Tue, 05 Apr 2022 23:48:47 +0000
Message-ID: <d001920183b92fb425c4d5f3fb79ccf869bc9fcd.camel@samba.org>
Subject: Re: What determines RUNPATH in installed libs?
To: samba-technical@lists.samba.org
Date: Wed, 06 Apr 2022 11:48:43 +1200
In-Reply-To: <alpine.UW2.2.11.2204051626590.10912@server01.int.multitalents.net>
References: <alpine.UW2.2.11.2204051626590.10912@server01.int.multitalents.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Tim Rice <tim@multitalents.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-04-05 at 16:43 -0700, Tim Rice via samba-technical wrote:
> If I configure samba-4.10.16 with these options,

I realise your question is generic, but before someone else says it,
please don't configure Samba 4.10, it is long out of support ;-)

>         --libdir=/opt/lib/samba
>         --with-modulesdir=/opt/lib/samba
>         --with-privatelibdir=/opt/lib/samba/private
> most libs will get installed with the correct RUNPATH but these
>     bin/default/lib/util/libsamba-modules-samba4.inst.so
>     bin/default/libcli/registry/libutil-reg-samba4.inst.so
>     bin/default/libcli/util/python-ntstatus.inst.cpython-39.so
>     bin/default/libcli/util/python-werror.inst.cpython-39.so
>     bin/default/source3/libmessages-util-samba4.inst.so
>     bin/default/source3/libsmbldap.inst.so
>     bin/default/source4/lib/samba3/libsmbpasswdparser-samba4.inst.so
>     bin/default/nsswitch/stress-nss-libwbclient.inst
>     bin/default/source3/smbd/notifyd/notifyd-tests.inst
>     bin/default/source3/versiontest.inst
> will get installed with RUNPATH /opt/lib/samba and yet they all
> need libs from /opt/lib/samba/private.

Yes, this is expected.  Bits of samba require other bits of Samba that
are not public interfaces, but are built as shared libraries to avoid
duplication of compiled code (with all the problems that creates).

> Are the dependencies listed somewhere in one of the files in the
> source tree?

The deps= lines in the wscript

> Are they calculated at configure time?
> Are they calculated at build time?

waf, our build system, calculates this.  

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


