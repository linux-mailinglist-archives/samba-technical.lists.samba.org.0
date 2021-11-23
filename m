Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA0345B03A
	for <lists+samba-technical@lfdr.de>; Wed, 24 Nov 2021 00:31:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=5XDVZnMHI504HmGNfru+gax6byhGp324YgHgQ1yPoHc=; b=UDjak7DLlFV6c7RcL8TZ1cIQl4
	1fy/7VLi7TiGHwacRgrWLdIXDCl7PUaVSzeolxTP9/rN9RlZje+/NqyK8pn5qs0CZtWKg52PsYb/a
	Y4QSk6JQbXN4+Ro7bGNqxWUSPooIb0f7s+m0eyeB0kJqbNq/lwiPbdCwDGIqYQ/S0pWEhDrCxgxXh
	l53u1crcl6bNx+KFozuP7X6Sth22lL/JgPPTqqoPbUiTM8AmuqQfIdnYPvDrRfwk5IL3XIE3z2CRJ
	3CqNofGPwRteoZeR+2+Diso8yAOxwOK0IamFKYCUlcOGU0aUjswj29qBnDzhAoA2sbKfbtESgtT1Y
	tpxoAL8w==;
Received: from ip6-localhost ([::1]:64982 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mpfFJ-003zKO-7C; Tue, 23 Nov 2021 23:30:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58472) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mpfFC-003zK9-GP; Tue, 23 Nov 2021 23:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=5XDVZnMHI504HmGNfru+gax6byhGp324YgHgQ1yPoHc=; b=z9Zpzdl5Wou20vWxZ21bO3OzvF
 XN5bqyrDnWUXW4zk8u9Y7s6SWONVgs4K8yDlKyY0is4VP+9ltLgVI1ivrTYq7MrKR9oMe4KxOCDCj
 gZQNXTToMIPyTqK6TIniWwZBuds/u5LzVSa2BXuTK6yfdcd8RrveV4KajftBn3ymLbIHNtDBv8/ep
 EE3BpMLkFQs6SaYfYJBzYPMfvybsLDTWalv76CO0KX1oocfUO3Bs/KhAHVUiAbU9vpUMJJomKQIFZ
 80c5xdaPQ2pLkbb38sInKi6evaCRLLNt8SE6lO2VBfkefncRIJM6ZEJR3SgtITI6wn6FmsZbRPQhf
 SIF1KgyBY3tzHDxs2XMDr+H56oTcMxAJFK6TFFl74XxZqGbP76g90Kv7AfkRj0z/4dlBOUQPjY5JN
 HZU/M5Ag4F4woTrzmj2QPRW84FkLlvJ+gX5FqwUiQiDHP47ChDo6+MUevqYVY44A3eNAh7ttZa5qv
 rlU/+se9ZphnJJsOJTBcvnm+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mpfFA-008csz-U1; Tue, 23 Nov 2021 23:30:33 +0000
Message-ID: <fc493905aca034c362fb8b20f2fffeca252f98bf.camel@samba.org>
Subject: Re: [Pkg-samba-maint] Partial mitigations for the Nov Samba CVEs
To: Salvatore Bonaccorso <carnil@debian.org>
Date: Wed, 24 Nov 2021 12:30:27 +1300
In-Reply-To: <YZv1imZpBb+xIhtC@eldamar.lan>
References: <c8187137526a42e9c370415ddcfa5aa1df2a6af3.camel@samba.org>
 <YZuiw+V9vrzrI8UL@eldamar.lan>
 <409e2ab4b21677c183a10cf109d10ce7a2a882ea.camel@samba.org>
 <YZv1imZpBb+xIhtC@eldamar.lan>
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
Cc: "sathieu@debian.org" <sathieu@debian.org>, seb@debian.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 samba@lists.samba.org,
 Debian Samba Maintainers <pkg-samba-maint@lists.alioth.debian.org>,
 jmm@debian.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-11-22 at 20:54 +0100, Salvatore Bonaccorso wrote:
> 
> I do not know if you have spare cycles to review what is applied for
> Debian, but if you have I will defintively wait for your ack. 
> 
> Regards,
> Salvatore

Thanks.  The patches you apply seem reasonable, on a simple read-
though.  A full CI cycle would be needed to check more.  

Cherry-picking in the dom_sid_buf change is the right approach. 

I hope this helps,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






