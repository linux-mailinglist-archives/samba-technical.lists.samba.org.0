Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D358B1FA4DD
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 02:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Tq1PWFyvudRHd6oTj8JW0qylsZ4OMkoTmp9I4KVS26g=; b=EGRsjewva8kKMgeWzij2b/zgHe
	RVnYdJbG3J46wH6ZbMERyjBZveAJwQsbeq2H7cQtN52OY86s0Ubu4qyBZWweIYq2SM4B6ctMV/UuD
	SdZbCxU8Z8g1EXXIAACet1GWCbhLgndODbWHCKoxDWQsbE7IHQmC6YfbQQUTp6XJPkzz1kMghq8Va
	13aQLU0jGncRtlJDX0x5DtnzMAKb0s3z60YA0Ws0AVlTtYHm6xtuEcOxscI5DiWVLj1cO7VshGhJ0
	ROmsJjzT9k3ggeQLMWjkockvQ4Q/g8d8moJxH8903bexlrFin5+Mze/OcYiWpWpjz+cMgHjHJObsY
	tf2AUCMw==;
Received: from localhost ([::1]:51710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jkz5e-000Xxi-En; Tue, 16 Jun 2020 00:04:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60030) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jkz5X-000XxX-8P; Tue, 16 Jun 2020 00:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Tq1PWFyvudRHd6oTj8JW0qylsZ4OMkoTmp9I4KVS26g=; b=vV+JJjhZFaf1sK/FWHNzn/cB0g
 xG6ncs9ayJQ0k01EunLHg2eJBBK5JQB48bFpVEVjPzjhfuvmV56wJ8+bBZZUoetNQYRur+Tih8oqw
 k8Qig0KKg8i+KD9ca5VCJMBaF7R5izLqLZ/NkEUhSTXBmM+h6J3RMGAP8q9epIRlWobij1kEc0IuA
 8ioIfyP0DKjZl54KD4Fca7lyInRZ6S5+bWQypaLqsWUoB6avofG/8xp67sL8aRgTnMaX7Z4rikmXQ
 Samh5SdcjNqbjbCCZ3EdslbeYIVO5oxsgmSPlpR6ZJ2m7PEkeLjAl8ZL+mMOfo/KC7oOeEz/6TKXG
 YoVMDbINSH0L5jJT6g+KYFjgBQLAp7bf5iVXVm9L7gmgJlqp9EvmgQ2rzZcYUUk9+bqnRfr3CT4uM
 kQAk+/+ou6BuYtK9Bz38UzJMG5Xf/h4mAO/ntQr41gHOsGBBrbGHt5jNk+D5/6ptrU0DdI9r+DjQ6
 af9MIcBnu/iu9/ByT0PG/wUi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jkz5V-0006k8-PS; Tue, 16 Jun 2020 00:04:26 +0000
Message-ID: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
Subject: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 samba@lists.samba.org
Date: Tue, 16 Jun 2020 12:04:19 +1200
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

With all the recent talk about ldap stacks, I wondered if we could
discuss deprecating and eventually removing pdb_ldap?

The reason is that pdb_ldap is primary user of smbldap.  smbldap is in
turn yet another of our ldap stacks (I have found four so far), in the
sense that while it uses OpenLDAP under the hood, it replicates with
libads, ldb and tldap the 'get AD-thing out of an LDAP reply' part.

I've huffed and puffed about so much over the past little while that
sometimes it isn't clear what I'm really most frustrated by, but it
comes down to:
 - number of LDAP ASN.1 parsers
and in particular
 - number of incompatible stacks (structures and helpers) above those
parsers

For example, these functions all do the same concept:
 - smbldap_get_single_attribute
 - tldap_talloc_single_attribute
 - ads_pull_string
 - ldb_msg_find_attr_as_string

We likewise have the client-side handling for paged searches in:
 - ldb (paged_searches module)
 - libads/ldap.c
 - lib/smbldap.c
 - tldap

Of the two, I (perhaps strangely) actually care most about the upper
'helper' layer, because it is in this that we encode Samba and AD style
LDAP on top of LDAP.  If you look around the functions I list there you
see so much borrowed, but never made common between them.

-

The extensive smbldap layer, largely in duplicate with the others, is
provided for pdb_ldap (and the pdb_nds for Netware, remember that?),
net sam (for pdb_ldap installations), idmap_ldap and idmap_rfc2307.

While it would hit a significant number of large and legacy sites that
still have not made the move the AD, but I wondered if we could
deprecate pdb_ldap?  

pdb_ldap has never been automatically tested, and is primarily in
support of NT4-like domains (which we should deprecate at the same
time, for consistency).

Merge work is hard, particularly when the users are untested.  Removing
smbldap would reduce by one the number of LDAP stacks, and allow us to
focus on finding a common way forward for ldb, tldap and libads without
needing to accommodate smbldap as well (presuming that the idmap
modules can be migrated). 

What do folks think, can we move on from these features in 2021?

(To be clear, we won't break stuff actually needed by FreeIPA, but
individual codepaths might only be available to FreeIPA in some future
release, or be only in selftest like the NTVFS file server, or be
passed over the the FreeIPA side of the fence entirely).

Thanks,

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




