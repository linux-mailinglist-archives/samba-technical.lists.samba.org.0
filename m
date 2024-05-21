Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0444A8CB5FD
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2024 00:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Ds3YAsBXjSvLaw+/gDrrS6SnkEqsgYzGdYXPTSE9jBI=; b=HxKj49x0r3lnZC3MrQM03jFUvW
	+ncN4pyXEwSEBLCIRuGJEVlk9VCZEN1m4RZ/8yHsxP68LbtRjK/uQH6TVgTNqOIl3EgPAB9/ZgUJr
	bG+zgKrPLhBehc8qgWWCQ3/Ov6r1Lk+OAh9YFw1gGcImK2wSw0aqmoJYQS9eO0I8qM63DVNJTO1Ii
	vdR604cFVDtLhSj2c23jf9drbSPGHJnmykKfOJNXQ9wAjUXdQNGCsv0JdzX/x572nHFW2IcLs1zAd
	gLL7cKO9ebTUrYBRpZJjToOuokdC/Mu3RDSJdZLb+Y/6PmOJh6jz00kDeLlhLYH85JHrlU/d3zOxw
	FfFXGm1Q==;
Received: from ip6-localhost ([::1]:29296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s9Xtb-009Zip-NG; Tue, 21 May 2024 22:23:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61618) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s9XtW-009Zii-Hn
 for samba-technical@lists.samba.org; Tue, 21 May 2024 22:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=d3qHlHMgJGTsBB4o5RdEOFSq95oTQf0bkgiRMCqSdHk=; b=IHH/POWwuxW6uU6MTMcHu7CnU8
 ek4UrH5i3ltcJkFJ5SgRt4iZ8bykd5SiQdBPTRmrQdALDDNuIZRg6w/E7cApJDd7yIVsyLaGFssFR
 sko8v3qZIY0LeibNdokBUx5q9U6aDWnjH5U8dspTMEGii+5Vg6YNwWOphOunCEuP9jCVeWHMWSq19
 pSm0Mml46zU11FKEo/wSLbNUrRczpKvCnHCl3HlaUw+uphDAlcfIeya0yjrjMTxmiq0wDe0r3Qtd3
 QED6cs9H7Z2Ou360CwKcuJJCuOiobff9+ltfva84ciTP7Na8PylEAP2Os9G7V73NrIUar6dwCU1vg
 m8f4rWw67FFFLcKmgWflYnH6vuuH4OUbzA7WBcPAvLr97OHUZfGPaj/ikn255AGT1ZaKc6r67j5Dn
 3Pad3PAspX2N02WsFOt1FwPJWnZVXLHUOur5vM0yH/d/7UGtw5OSA/6VxChQwQ2D+PIwQBdM3sTWR
 HGqP4HPohPmcsXuHSQBKSk6l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s9XtV-00CTYn-0v for samba-technical@lists.samba.org;
 Tue, 21 May 2024 22:23:41 +0000
Message-ID: <e9b3c0d0f1a94a8977e067c048eb56592d6bfe49.camel@samba.org>
Subject: Improving smbd_smb2_request_setinfo_done/smbd_smb2_request_error
 tracing
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 22 May 2024 10:23:37 +1200
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Kia Ora Team,

I've been helping a client out who is improving the Go SMB2 client
implementation and today we got caught in the weeds just trying to set
ACLs on Samba.

We probably have something really silly wrong, as despite being root
and just setting an ACL with smbcacls, it fails. 

Anyway, it was heavy going debugging partly as our logs are sparse in
that code, and partly as even when we have logs, the very helpful
'location' macros don't work as well as we would like

So smbd2_smb2_request_error() prints the location of the failure, but
if that is just smbd_smb2_request_setinfo_done():137 we don't get many
more clues.

Is there a legitimate way this this be unwrapped (I see I'm not meant
to read the guts of the tevent_req) to be 

smbd_smb2_request_error_ex(req, status, NULL, subreq-
>internal.finish_location)

I still don't do much with tevent, so I'm wondering is that legitimate
in this code?  Will that always be filled in?  Or could it be NULL, and
can I rely on it at least being initialised?

(eg so i can do):

smbd_smb2_request_error_ex(req, status, NULL,subreq-
>internal.finish_location ? subreq->internal.finish_location
: __location__)

Anyway, just wanted to give feedback and perhaps improve debugging here
for the next person, but lost.

Thanks,

Andrew Bartlett



-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
