Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCCB74238D
	for <lists+samba-technical@lfdr.de>; Thu, 29 Jun 2023 11:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=z+b3goEH7i9FDPY1y/hpLx6KkDe2i2e3ekmkjvxMyq8=; b=pKzBxJ2Ssu081RQVrvpy+zXpFR
	ENNRIYwJJRQDJAmDt8Tg//guwvSkV85Z1l7ozG80RUADNf0tp6VDpI6r7FZEtIQmJYBHyY3esnUTN
	uyxU10YUVbB6JtCcGcHLEVBn3WAj6ba7Hs03B0pW/2tQf0o09RXzGJJpuyUaY1SHUWXbdWJVh+UBl
	6tFwX332WsNp8j8f/LujyodF3JsEwW+C+RnmUzWG6sbi13uR3Hv7zQikqnHXDIx6CAB5Lobp/L9mv
	mY6g3magrVQpPC1ycsQw39BwYqhqrfFXvynoV/TOLz4DfLByCKb2O96rbz7gJsRlo0bXRRmYa7BzD
	6qZXvjPQ==;
Received: from ip6-localhost ([::1]:52912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qEoNr-005BxD-9M; Thu, 29 Jun 2023 09:56:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58572) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qEoNk-005Bx4-F4
 for samba-technical@lists.samba.org; Thu, 29 Jun 2023 09:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=13cLxaZOFfUfztOiI8A32VKq0Z/76lAIt/kwFK4AsDc=; b=26Ft5x/13UsZp/h0BtsCZ20xlJ
 f6YT/nJm087EQuVts1Pj2uHry05oa4mITkwWmmYw5kcOr3Vt8uQ+L4Yh7yryi4CqTC/knCzVgybUr
 bp0gIgbjKzadPkFY8Dypfj6DelgYePNp2CHcCAJna8FMF5FDOLbHIBd6JpQhkR/GAUeUgA1rnrWl2
 UN22Up6sqc94myvUwQ9yUNb0BaqWPvvubR1oyY8zVzAzSxQzfYRE+/PJqKIi7/AqWGEir6Za+Q3HV
 Q4pGKsb6PysSnwo/592LWoIMqUnjaQujvybLsIYKACfV4teJKVS1woOXxXB8PQrenVFipsKEhsymh
 kJNZJkiFzWwGOQ/VFwumk1II9aX/mtiU748v7SpmDuCq3KiQ7faUgOpWJBlf3bRXC3ylOhdLBVHcL
 pvbNqUamlhGKeYBRe+rLUqF8cWlgvCBa9+E9icR7/Zy/Dfd5W4VEPQ/JpAcgw2n84zVy4PvLODF4s
 hno1GOeCMuG8Go5cEfuI/AEj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qEoNi-005ANP-3A; Thu, 29 Jun 2023 09:56:07 +0000
Message-ID: <05888b9585b918c2f14576e884982fb762323133.camel@samba.org>
Subject: Re: Is this a real memory leak?
To: Ferenc =?ISO-8859-1?Q?W=E1gner?= <wferi@niif.hu>, Jeremy Allison
 <jra@samba.org>
Date: Thu, 29 Jun 2023 21:56:01 +1200
In-Reply-To: <87y1k2fvkt.fsf@fin.soreny>
References: <87v8f9gpbo.fsf@fin.soreny>
 <ZJsgx2j0foTkcE6m@jeremy-rocky-laptop> <87y1k2fvkt.fsf@fin.soreny>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2023-06-29 at 11:48 +0200, Ferenc Wágner via samba-technical
wrote:
> Jeremy Allison <jra@samba.org> writes:
> > On Tue, Jun 27, 2023 at 12:41:15PM +0200, Ferenc Wágner via samba-
> > technical wrote:
> > > Please take a look at the following patch, taken from
> > > https://github.com/balabit-deps/balabit-os-8-samba/commit/5f46ae6282db1457b8ef8bbfb4e97eb4aadd55b4
> > > :
> > > From 5f46ae6282db1457b8ef8bbfb4e97eb4aadd55b4 Mon Sep 17 00:00:00
> > > 2001From: Balazs Scheidler <bazsi@balabit.hu>Date: Wed, 22 Aug
> > > 2012 11:34:43 +0200Subject: [PATCH] nsswitch/libwbclient: fixed a
> > > memory leak in wbcAuthenticateUserEx
> > > (cherry picked from commit zorp-os-5.0 /
> > > f0e88410bd2528517910f780d71e63f8effb91ef)---
> > > nsswitch/libwbclient/wbc_pam.c | 1 +1 file changed, 1
> > > insertion(+)
> > > diff --git a/nsswitch/libwbclient/wbc_pam.c
> > > b/nsswitch/libwbclient/wbc_pam.cindex e4cd2963..b16c9424 100644
> > > --- a/nsswitch/libwbclient/wbc_pam.c+++
> > > b/nsswitch/libwbclient/wbc_pam.c@@ -415,6 +415,7 @@ wbcErr
> > > wbcCtxAuthenticateUserEx(struct wbcContext
> > > *ctx,                                 params-
> > > >domain_name,                                 sep_response.data.i
> > > nfo.winbind_separator,                                 params-
> > > >account_name);+                       winbindd_free_response(&se
> > > p_response);                } else
> > > {                        strncpy(request.data.auth.user,         
> > >                        params->account_name,
> > > Do you agree that this patches an actual memory leak?  If so,
> > > would youplease consider taking it?
> > 
> > Thanks Ferenc, this does look like a real memory leak to me.
> 
> Thanks for taking the time, Jeremy!  What could I do to get
> thisincluded in Samba, what's the preferred process for submitting
> patches?

Ideally https://wiki.samba.org/index.php/Contribute but I suspect we
may be able to do something less heavyweight. 

Do you know Balazs?  I'm not sure we strictly need it for one line, but
ideally we get a signed-off-by and a developer declaration from them.

Andrew,


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
