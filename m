Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11F4A3991
	for <lists+samba-technical@lfdr.de>; Sun, 30 Jan 2022 21:56:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=7Ym3zqeTkGWjYeS5yJaX0IAgMXpFuagct7MILgC0hzU=; b=VaLN/h55WWXa68cBApsFDTyVGJ
	ghIDGbbr9O2EwVToajvTQjYz1vTMYgp3biAlEcgqIydd/Pm++HAK8EVbFXysBZnW2bKjxtLS8wYyL
	TnbRams81AnuNhBItGG6XXL63zI89OUtoVHayh8z1TU2fTDwcYVkh0kYf/y8j9wqKKdNs6zYyNQLf
	QNBUkHRVtB/NTedEROgRoDsUeC3jXoVjcKL3PoEX+YFX25ALCCMF9Pp0dynLDypGnkucu/z+CdP+8
	kKVPgYrtfRw3g5NPxQSdWBYRNfY4t9wUqXUYa9kOOgJmejH36bEY7SRfyYa8r8St2S+pr082R5lwg
	fejsDDGg==;
Received: from ip6-localhost ([::1]:37938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nEHEo-002WpD-NO; Sun, 30 Jan 2022 20:55:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48506) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nEHEi-002Wp4-UV
 for samba-technical@lists.samba.org; Sun, 30 Jan 2022 20:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=7Ym3zqeTkGWjYeS5yJaX0IAgMXpFuagct7MILgC0hzU=; b=1+nOo9SewwgZlSS18EAW0q0iIc
 KCTOLu9on8mUwE1ei7K3xjNgrX3uulJG9kU0nAJP4D+Th6QhQrlgFwCFejYWOZpwlvQFa9rB301zB
 Yd4ynu0zItc5+mJ2xaVxFc9esZy5oPtDbmWfQ47KYk4BU1UtSJQzWDzCa3L7oaVUZc86l5mnpxFhO
 w3/+oT5ZXqleA9RgxwmfzLlYpIKt3DuvH748eKXP2ecGwDo7XOmo4lCicaWmcx+8SfYbKMtP6KSmm
 LzS1f4ufXf6Zj7D7MmoefguktkDjylgjHHj7jJ59bdIkhxKjGxwTpnkhH2IS/p9nexmALqFcqWiQs
 YpCYhU9Mm7BsS3MxbKZwWKSlQyv/dlUzAu+Uu73HIXUjga10BVhcFAil6h6TgaYO3959NT/guJ+Uj
 uSmlPGFk2g8h6QWV/CvOcnC6ZPUUzS0ZEwOppq0HzjXnerrEcqYaPzDvOVwcrxJxBaecr0UV0LFhJ
 xM9DuWD509ikAsbJxvMyOwkf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nEHEg-001Os0-L8; Sun, 30 Jan 2022 20:55:47 +0000
Message-ID: <d3f7a5fab640810ff2baf01baf66eda7287038ba.camel@samba.org>
Subject: Re: Microsoft Enforcement Mode
To: Andreas Schneider <asn@samba.org>, Stefan Kania
 <stefan@kania-online.de>,  samba-technical@lists.samba.org
Date: Mon, 31 Jan 2022 09:55:42 +1300
In-Reply-To: <4510140.vXUDI8C0e8@krikkit>
References: <cc895930-b174-0371-c4c5-807bc06e34aa@kania-online.de>
 <d235f497057f4188e9ea447477c32e6e0d66469e.camel@samba.org>
 <4510140.vXUDI8C0e8@krikkit>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
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
Cc: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2022-01-30 at 17:41 +0100, Andreas Schneider wrote:
> On Sunday, 30 January 2022 08:47:50 CET Andrew Bartlett via samba-technical 
> wrote:
> > On Sat, 2022-01-29 at 11:41 +0100, Stefan Kania via samba-technical
> > 
> > wrote:
> > > I just read, that Microsoft uses a new Enforcement Mode on all MS DCs to
> > > protect the DC against CVE-2021-42287 and CVE-2021-42278. The
> > > Enforcement Mode can be deactivated until June, then MS will force it on
> > > all DCs.
> > > But with this mode active it's no longer possible to join a Linux-Client
> > > to a MS-Domain. I could not find out if this will affect Samba or only
> > > SSSD. If it affect Samba will it affect all Samba-version?
> > 
> > This isn't something that I expected to fail/change based on the
> > intensive discussions I had with Microsoft during development, so I
> > think this is an unintentional regression.
> > 
> > David Mulder is chasing this down via the protocols team.
> > 
> > Samba sets passwords via LDAP typically during the join, so isn't as
> > impacted compared with the tools around sssd (adcli), as I understand
> > it.
> 
> It is relatively new that we set passwords over ldap. We used DCERPC before. I 
> think adcli is also just using LDAP.

The traces I saw were showing an issue with KPASSWD.  David has the
details.

Andrew,

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


