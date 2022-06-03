Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 171FF53C8DD
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 12:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3/OexZDSewuH0LH5YS7/Nfi6oRRGVLM/Fs9qN5rOLoI=; b=5KJUCd8YcpyTb35R7LvcJr5nWq
	myC9YldcMc79vrrxDx+2fV1G9KQIFjO5q0D9SRDfBVDfxI+WqNpjsUhYfNr+1V+XRwvWjVaOyyPN2
	YfWhgDmlEtS1VYEIeNr2KDlc1QmXvOqywaj8i2hWb+gMUQfrHfArmTuYPWmCCxWcXv0fVX6r3TUuv
	ar7RSiiS43eIdWvSA5a1wNqyicyOXz8Gd+oLu2GYUUV5slt3zRWtOOOz1JQBR9BmZdrvFtmGsIwqb
	cQjhZHoWk/7zLgrJj4RUlXG12wIZUM0/1wl4yvx7BT0MvI9ge5xuf91cwrSitrHScHUjdU8qVNin5
	Sz9W6kIA==;
Received: from ip6-localhost ([::1]:40854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nx4jh-006ppW-By; Fri, 03 Jun 2022 10:40:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61992) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nx4jc-006ppN-DH
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 10:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=3/OexZDSewuH0LH5YS7/Nfi6oRRGVLM/Fs9qN5rOLoI=; b=YjKDyvF8GgTCDjzXEisqq/93XL
 SmOT5qBrqi0zwgDZW3ssVqe8nqpPe+z67XhafPbqgwcbiX8XN2pYXc0vBSLmFHzC9/KtgvZ/NbJpD
 8mAhl/ZPVTlJQ4jB7btM8WqozAbdeyndOu9JHUmv+p7Q/HBftyExN33nShesdInTYDKE+pnPOA8ic
 ReDKuCW8+3fF6X6BuTAa52cYk05fJz94gsl0kXseDV2RotjLZGFvD5fWDLnrY4rIXCxkUC/5LRJpb
 4PxovtAbL0u/079zlVk5tCGQ1WUd/Gg38ySVgkWP1XC2rZ8HJ457MlThgeSccRPfLyqFsw/ICyfhg
 Jpslc4CNWfrfzqEETWtDCXEbd2+mbYnm+sJuzxOIka0K+dFLs3RSfvVIMYIqsKofsdniWB6vAFEBZ
 wz5FBh9kXt6i6jCHaC8GAv0JI+NMPUO8bceOGw0Kc8fFnolTZiYv7EIaaWwZtqA/kG9ouXfafgkHF
 8YuwW4ruXeKpKLTUivMqyujp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nx4jb-003pGS-Kp; Fri, 03 Jun 2022 10:40:51 +0000
Message-ID: <b1e1aadfb2a9441afd8f58e096cfbccb8bd54d1d.camel@samba.org>
Subject: Re: Reintroduce netgroups support?
To: samba-technical@lists.samba.org
Date: Fri, 03 Jun 2022 12:40:51 +0200
In-Reply-To: <4170ad2340f7a3f2bc40c4f6c77ba5420a0c1cc8.camel@samba.org>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
 <4170ad2340f7a3f2bc40c4f6c77ba5420a0c1cc8.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
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
From: Samuel Cabrero via samba-technical <samba-technical@lists.samba.org>
Reply-To: scabrero@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-06-03 at 11:10 +0100, Rowland Penny via samba-technical
wrote:
> On Fri, 2022-06-03 at 12:00 +0200, Samuel Cabrero via samba-technical
> wrote:
> > Hi,
> >=20
> > I have received some complains after we dropped netgroups support
> > in
> > Samba 4.15.0. Our release notes only mention we dropped NIS but
> > netgroups went with it.
>=20
> Well, netgroups are part of NIS

Nowadays you can store netgroups in LDAP.

https://ldapwiki.com/wiki/Netgroup

https://www.linux.com/news/sysadmin-sysadmin-netgroups-are-not-just-nis-any=
more/

>=20
> >=20
> > Some people still use netgroups without NIS, stored in LDAP and
> > made
> > available to the system through nss_sss, but it is also possible to
> > use
> > /etc/netgroups.
>=20
> Why and how are they using a part of NIS without NIS ?

The netgroups are stored in LDAP and used in the 'valid users' share
option.

> >=20
> > I had a look to the removed code and I think it is possible to
> > reintroduce netgroups support independently from NIS, using the
> > getdomainname() function from glibc instead of
> > yp_get_default_domain()
> > from libnsl.=20
> >=20
> > Should we bring back netgroups support?
>=20
> I do not see the point, AD groups can do the same thing.

AD is not involved here, this is a pure file server use case.


--=20
Samuel

