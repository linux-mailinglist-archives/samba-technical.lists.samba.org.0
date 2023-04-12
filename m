Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 405826DF262
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 12:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=9rS4gDcnIU5u8ZH5p2lLo2z0SgxywlUg8DOm/E5fTxU=; b=qd12iaHAdlYXO5V95xAGpbA7h+
	ZjWb+dUknBhnDBZhlpdVHd5bT402RJ57rBX4QByaZ408MVT3Yx8H5LHUWoPA8MyTEcBLrZ/PVA9SD
	LzofAYcXNaE8vuJ4qogop5zFQM0miPknYNTc0TeBuJEfRd6f7xEK5xWhebVMNIqddF0aJDXSuN/tv
	8lRZSSCRNsNnXkKutsweBQBZKREUCeAGphCQRPn9d+4wU0baS7TguvdEXibTOLV1613BV3AG8+xGc
	7sKLL60Fp+5FnydYo7N801+YtBvJsDgHaXWU6jHe5Ez8ONx9CoDqL45sq76igGa1kEu8ftDqCiMNS
	TlURmHSw==;
Received: from ip6-localhost ([::1]:24408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmYBt-000ery-PK; Wed, 12 Apr 2023 10:59:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20698) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmYBp-000erp-TX
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 10:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=9rS4gDcnIU5u8ZH5p2lLo2z0SgxywlUg8DOm/E5fTxU=; b=LAxA6g9d1uWfjkpt/xNHbMyLY/
 RAewP2HpDxOcXmN9ENpdZTW0qo8DI52auNTTIEP7vmtYGKomjhtTCookifgBuW43ymlas0fjXCVC0
 xXgG/bb4Sf2T9LLjUSZ8d1Euv0GISF/kimSm3vgB1esGa7USGmNaX/+35VW7rilf2QbCXB/ttGarE
 irG+36jXrMeHarKNOjTU60mUxqwLxsDJdMhfh2sj/mo+2oT+EiQQFqZ890Z2AuM82M2QwSKWRAKAD
 cBoYrxoU10NqbHoiZp5XF7n6aEM7AKiKnaTt5rkbwXqw4jRnvn3VKF8Ecid8LUQu54wBY+OT2T39Q
 rmpLjQdAyhtzJIZ6dMe56Xnw10vzWpBaKQ5j2MdCKolL+e5ELoH6xChhbmbHnTLRifjifhzzCZcFV
 TYvJvzb8ClN6z2AUhj1fBCM6BJz4g7ZwTGwzAac8QS+0qRRMiuaXAIUzlPRCv4oV0MYk/G2EgaIml
 XgUTEgsj4oLoeYGoz6Swl3ey;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmYBo-000gkk-VK; Wed, 12 Apr 2023 10:59:01 +0000
Date: Wed, 12 Apr 2023 13:58:59 +0300
To: Jan Andersen <jan@comind.io>
Subject: Re: How to test samba LDAP parameters with openldap tools, eg
 ldapsearch?
Message-ID: <ZDaO8+dQf+DYVbdZ@pinega.vda.li>
References: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 12 huhti 2023, Jan Andersen via samba-technical wrote:
> I have an openLDAP service running on a debian 11 system, and Samba 4.13 on
> another Debian 11. In smb.conf I have set up the following:
> 
>   # LDAP Settings
>   passdb backend = ldapsam:ldap://vogon.zombie.io
>   ldap suffix = dc=zombie,dc=io
>   ldap user suffix = ou=people
>   ldap group suffix = ou=groups
>   ldap machine suffix = ou=computers
>   ldap idmap suffix = ou=Idmap
>   ldap admin dn = cn=admin,dc=zombie,dc=io
>   ldap ssl = start tls
>   ldap passwd sync = yes
> 
> I have some trouble understanding why this doesn't appear to work, and I
> would like to try to understand how these parameters map to the parameters
> of, say, ldapsearch, so I can see if the problem lies there.
> 
> I have run smbd with max debugging, and as far as I can see, it successfully
> makes contact with the LDAP server, but then doesn't find the user I'm
> trying to log in with. However, when I do a search with ldapsearch, like
> this:
> 
> ldapsearch -v -b "dc=zombie,dc=io" -H ldaps://vogon.zombie.io -D
> "cn=admin,dc=zombie,dc=io" -W
> 
> - I find the user in the output. So, my question is, which ldapsearch
> command would be equivalent to what smbd is doing?

Please provide logs from smbd side.

-- 
/ Alexander Bokovoy

