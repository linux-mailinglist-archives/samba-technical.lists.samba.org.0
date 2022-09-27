Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0C65ECF94
	for <lists+samba-technical@lfdr.de>; Tue, 27 Sep 2022 23:53:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=cHvpciUgikWdP11wZNGMBN+aQvWVQH02QjU1CQs14Lc=; b=cli/F9eerUjRYfuhRQz3/Jbvqk
	opNujneIR0k3e/BCtKSw7yZPguAXgQYm9HF1AWHuC8F+kNQBxcn6LiLF3V9psaiO2F5OUT4phWLhV
	uLG9Y9MMolrH/A1WmyAHs7gwsRm+b0QbXHGJbIicN3NupDUfXMOu+7XZJrCXBwhIgQSPCisyOF41h
	URawgyfZ3b+bz5BkKvwnaU37l+kCpIE6LyxKD8Y8P5WhFR7mDO0Cqg6559zhBWefJjyI6uHP6p/jz
	iE7dwO2LlG/JjnvUH21EU5sgApfaDMZHpQl4H5Afp9My7EkipvxGvxX3UM4iOWdfsPV14ScuuyYG2
	bfr6k45g==;
Received: from ip6-localhost ([::1]:58080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odIWA-004TzX-9Y; Tue, 27 Sep 2022 21:53:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17778) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odIW5-004TzO-D0
 for samba-technical@lists.samba.org; Tue, 27 Sep 2022 21:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=cHvpciUgikWdP11wZNGMBN+aQvWVQH02QjU1CQs14Lc=; b=MQwQf1np9Wtq/TTm4VFfsL0a3M
 ZioLSQC5Ysr8ttLIpMVaBDTsbA9Km8MY6aZpoNnzryiUXdWu2TWspdfLRjsuwRlx0xcgkKUBzwkiT
 9j1jWALySVAcrourEYeTGyruohbSCA8Q/F7n9TGaCj8JBvXbYLLmIuEGMV1A+aMtmR+l4SYB+2jq1
 /DKNLKoto9fQ9sD3+gf1idak74BfjF7DxkXYym9hw7TT30iTGzslyA8zgqEiafbC1vxj8umH6/7w9
 r+wLoSQH7FqIGkUlCDJjHrR/ZaDW1NLT8cKROH3Jg8U48Vp/vOjbf4E5zRvWkyhRyFLRtE6tvlBYG
 WR7A4eRtPist+pZVEUQjABwZ5AiMOJ6L0PJ2fW4aFFzJy5mxo3lFCWKE0iw/7mCHpQcxwvNP05Gdi
 S5yWOpZojdggKI6RL2J98ftld2UFiQ6DVM2twngBt8E/OOPBu5vaznsb6CPrFuW5CXIIPnzfkMDCx
 h9cmPM7iRetZW4MDN8q32510;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1odIW2-002975-Ub; Tue, 27 Sep 2022 21:53:23 +0000
Message-ID: <1074acc48316978ba1fc5af74c7cd486fbe2ce0c.camel@samba.org>
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
To: Jeremy Allison <jra@samba.org>
Date: Wed, 28 Sep 2022 10:53:19 +1300
In-Reply-To: <YzNu47xX9+j0BLKH@jeremy-acer>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <d1cd76d317998a3dd4456e7877b3950901019c14.camel@samba.org>
 <YzNu47xX9+j0BLKH@jeremy-acer>
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
Cc: Daniel Kobras <kobras@puzzle-itc.de>,
 Michael Weiser <michael.weiser@atos.net>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-09-27 at 14:45 -0700, Jeremy Allison wrote:
> On Wed, Sep 28, 2022 at 10:37:41AM +1300, Andrew Bartlett via samba-
> technical wrote:
> > I honestly can't think of a way out of this that doesn't break
> > something.
> 
> What would it break ?

Perhaps I spoke too strongly, what I meant was be a user-visible
change, that could potentially break some unknown user. 

> > Mapping the EAs from multiple namespaces by stripping the prefix
> > really
> > seems to be a bad idea - if only because information is lost.
> 
> See below. I don't think incoming EA's from SMB3 clients have
> a namespace - just make the always user.
> 
> > Also, I just don't see what business a windows client would have in
> > reading the non-user EAs, and if a client should read them they
> > should
> > be read in their own namespace.
> 
> As EA's from Windows clients don't have a namespace prefix
> by default, they are always (or should be) mapped to the
> user. namespace on UNIX.
> 
> What am I missing ? Under what circumstances would an
> SMB3 client get or set a non-user namespace EA ?

We are in agreement.  What I'm saying is that it seems to be a mistake,
which can be observed externally, to have mapped other namespaces by
simply stripping a prefix.  

Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source 
Solutions






