Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A221838133B
	for <lists+samba-technical@lfdr.de>; Fri, 14 May 2021 23:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=HAQ+MKBdAl4Aky+sbz/Q9Iy9loPcu/l+vI3cM/k6DdM=; b=SRkEcdn0oq1w6/LS6znlcQ5BO2
	amM9qpK+q05j7lC4DV2mj0pOite/G0PwLfCA4IWWYIDqCqkEgrLJUjwPVWppWngKz5SlELVBXDE0N
	kxvyXCAwq0BNvisZuyVDZkAZvGNRGUpLHTT5hv/nTEZWKX9ZrAb9Hr9q5iHTxsQZx/7UHcwAA9Wv2
	VINrsxCbwzJE83fU+yeAj166BROIvKtiPXskT7enMp5eqgWvMEQ7got1uk5ZFvC0TntCZ5hqPGgHg
	KiX8cZaD0vb/+XkpkVpfJXsx7lVsFPcuXHtH2ZV2kYMtazwBgSnnIRFi+DiXoncLpk73UtLeiooCc
	K/ClePKw==;
Received: from ip6-localhost ([::1]:52604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lhfVB-000NfL-7m; Fri, 14 May 2021 21:37:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18580) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lhfV5-000NfC-3V
 for samba-technical@lists.samba.org; Fri, 14 May 2021 21:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=HAQ+MKBdAl4Aky+sbz/Q9Iy9loPcu/l+vI3cM/k6DdM=; b=CKPP24ls7ZMsDStIlKLfqYzwLk
 /h6qCp7ZMT8suqrtgbAziPvxdcTwgDONNs+HsQWyC7RnOk986qwRvzYLWtxIRoxHy97qPaCaNKKwy
 VTMbkp2DSqCQuw1cftEi+AOk+XFcPV2bCktaIZeYH4hkQpuqzdNWdHO2VLv+DMLu7dgo+uqF8cxr7
 /PlcxPlh7vqLhpaSQKJSSQxHna175OSkkFMT3Qzliheu9S8kBSW/np2KMNpdA0ppzbokiqKxYXG4S
 m0ZJ5dywZ7nAXvbw0yRifyEFdGKbS12y1wq2p5ahbTR2prphtSUKFfYy8k+Ktu7GBhns2FXgY2/o+
 F+44/zMM/FNO3kAUJ/6dBVmy0zLNRiIMhRBy7QjDJgyIv3RbaTwszptyK73JvZo3VP9YnePdhoSZV
 yhlAeKTEXJw0I6uuwlrAEyJdl0Cyf6nmvEr7lOQLBYdhwoLUqAt2MT5LOrjMGVw6WnX8hdOO4IHfM
 BHF9ZuXg6FOtqahlXKUJGDw5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lhfV2-0002kD-W9; Fri, 14 May 2021 21:37:37 +0000
Message-ID: <0085446689a4dbeb12d45ee692fdfb1b52ddfdb6.camel@samba.org>
Subject: Re: Kerberos raw prototol testing
To: Stefan Metzmacher <metze@samba.org>
Date: Sat, 15 May 2021 09:37:31 +1200
In-Reply-To: <a2a22a8f0c59a86f0ad7f659b1e4d6201a6d7601.camel@samba.org>
References: <3663e2d45ad7855b807286d4d45bba7ef450d9a3.camel@samba.org>
 <a377c5a5-225e-9fc4-a70a-c52145732121@samba.org>
 <30ab21963ccb18678de20e7814e97e8e4b13f3f3.camel@samba.org>
 <b08f1fca-9a92-ba28-5515-7918522dc5ff@samba.org>
 <a2a22a8f0c59a86f0ad7f659b1e4d6201a6d7601.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 gary@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-05-03 at 12:33 +1200, Andrew Bartlett via samba-technical
wrote:
> 
> In this case in particular I've checked the diff and other than of
> course the pycredentials fix (thanks, obviously good!) this really is
> quite fine squashed. 
> 
> I'm also happy if you keep some of the early preparation patches
> distinct, eg "python/samba/tests/krb5/rfc4120: better etype
> dissection"
> but I wouldn't spend much time beyond that. 
> 
> Please propose it squashed down and lets work to get it into master. 

I've done the squash down here:

https://gitlab.com/samba-team/samba/-/merge_requests/1953

Is this OK?

I can fix up the MIT knownfails if that is the only blocker, but I also
need your sign-off, particularly as I've written a pile of the commit
messages for you. 

I hope - just waiting for some final confirmation - to have some proper
time to put into the Heimdal upgrade so I'm really excited to get going
on this. 

Please let me know.

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


