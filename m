Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DEB3DDE9B
	for <lists+samba-technical@lfdr.de>; Mon,  2 Aug 2021 19:35:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=MBIg+7sx+qPBCemeqeC5IsaNZyLQE+OV9P0yTp2RKvI=; b=BtfRyq16hAeQgCdNQJC913xLgx
	JXkitCWglM2nIcJ7hVAxlbc+4tROM4sRUk2/eTiZlYTMCfuonwfSL6QlkEFxoLDUoUmBh/D6QGoIK
	ihIS/S7bw/nSk2sLYo8R3/EETFoKuGbQrPKuhlJZoV/pDbt7oNXNn39i/0a3R6y856LA44KWRxiR2
	JPxCnYB3JlvUY0FDqn+CczwXWEnNT2vfTPW26GQ4n2t5pTb7BZZaEV4daSR6lfezPKtUKq+xVa8cX
	t7IJKYEOFo9J3Yhhf5qQ0N6qrd5QeaDCZE6AqfN+czq5gf985lbLeYkntwRn4T7A6zc039l28Qxd9
	4TqM8+ug==;
Received: from ip6-localhost ([::1]:46152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mAbqH-00480E-HR; Mon, 02 Aug 2021 17:35:09 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:56123
 helo=outgoing.mit.edu) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mAbq9-004802-Cs
 for samba-technical@lists.samba.org; Mon, 02 Aug 2021 17:35:06 +0000
Received: from [18.30.9.158] ([18.30.9.158]) (authenticated bits=0)
 (User authenticated as ghudson@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 172HO4iI015024
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 2 Aug 2021 13:24:04 -0400
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
To: Stefan Metzmacher <metze@samba.org>, Nico Williams <nico@cryptonector.com>
References: <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
 <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
 <20191122224526.GA28614@localhost>
 <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>
 <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
 <3d693bdd-9a4c-7135-318e-593e18e52cd0@mit.edu>
 <9062428f-f26d-4f10-b71f-f54464df2ff4@samba.org>
 <c388e3f9-bf85-8ffd-3640-b27e0552a96a@samba.org>
Message-ID: <276401e2-5d09-29d2-be1b-5e876f49c0eb@mit.edu>
Date: Mon, 2 Aug 2021 13:24:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c388e3f9-bf85-8ffd-3640-b27e0552a96a@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 18.9.28.11
 (outgoing-auth-1.mit.edu) incorrectly presented itself as outgoing.mit.edu
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
From: Greg Hudson via samba-technical <samba-technical@lists.samba.org>
Reply-To: Greg Hudson <ghudson@mit.edu>
Cc: kitten@ietf.org, Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 8/2/21 10:49 AM, Stefan Metzmacher wrote:
> To summarize the discussion we had active directory DCs do transited
> checking (even without a PAC) and fails to issue service tickets
> if the check fails, so any service ticket is already checked,
> but without TKT_FLG_TRANSIT_POLICY_CHECKED being added to the
> ticket.

I just want to acknowledge here that we're taking on technical debt
because the non-conformant party is perceived to be inflexible.

> The initial solution I proposed was:
> 
> 	gss_set_cred_option(acceptor_creds, GSS_KRB5_CRED_NO_TRANSIT_CHECK_X)
[...]
> But it seems gss_set_cred_option() is not accepted because it's
> a deprecated.

Personally I'm fine with this.

> 1. An additional cred_store element could be passed to
>    gss_acquire_cred_from() in order to set the
>    GSS_CF_NO_TRANSIT_CHECK flag on acceptor_creds

This is similar to a cred option.  I don't see any strong advantages of
one over the other.

> 2. I think someone had the idea of using gss_set_sec_context_option()

This seems hard to do without (per-thread) global state.  Even if we
bring in gss_create_sec_context() from some versions of the channel
bindings draft, the mechglue doesn't know mechanism will be used to
accept the context, so it would have to store OID/value pairs in the
mechglue context and replay them to the mech context once it finds out
which kind of mech context to create.  (And hope that all of the context
option values are flat byte strings, not structures containing pointers
to objects whose lifetimes might have expired between the
set_cred_option() call and the first accept_sec_context() call.)

Doing this with global state seems strictly worse than communicating the
flag via the cred.

> 3. Implement a krb5.conf option similar to "dns_canonicalize_hostname"
>    or "ignore_acceptor_hostname" from MIT

I would argue for this to be a per-realm option if we do this, since
it's a statement about a particular realm's KDCs being non-conformant.

