Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFBC53C97B
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 13:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=DSYyxD1cz7o8X4/MbpVBrG6ojOPwUvA9yjVaspF9dZY=; b=GW+QxzqMMqpHgw6NPwSdlA+in3
	J+PSBID+tAHgFRdoJq8N4T4E+ZETd+LcUu+LsSxik5AKf9ZF3R8GWVGmMzZ2hTGrkqLKhxIz+nPir
	m+LI3A/J9THBMgjyAjgNT3iVdbo/p9ltjO/bl+XnCZAy5IkvVwU/pFYEUrlRa/Y0SD8bnEJZQS/A+
	VKUKk3+CT/oepXEF8Lcr4Jt1tCmK0AvlopbwT6q5CMw4VjXeaceeQ1AJImjQ4VK8xpMiH1G3E3Yeo
	/051bRRkh9yS5HHKIE9v/DjFFson10CGuqo9aJNauKS+RnpBrwAOBEc7C/yDn7bKb2RdToyzK6sdD
	ytdbl7qg==;
Received: from ip6-localhost ([::1]:42874 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nx5er-006qnL-Ig; Fri, 03 Jun 2022 11:40:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61998) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nx5em-006qnA-Ev
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 11:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=DSYyxD1cz7o8X4/MbpVBrG6ojOPwUvA9yjVaspF9dZY=; b=SvHvaBmoCzFcoASz9EydwrWMgh
 FKQfcSzl6LxD5QMbEVQn09t3TCNfdsSmBaFm7vFRDIiNNdIeggr9cRRNZT4tqJZI+7hB5aLVG56x0
 dEOfM5t9Ozt3k5vKr9PbQl8g2DCKOCQb77iNP5E5kdLeaYq/NgmKHnt/1YhPmUsJzSjmhsc2/0Vdg
 oChWzm3hucMsZqcySFp4uHuJAmDj3Wzrm5mh2auB5ICs+gHno7GlSHxsgzlxAg0jQxWsBk8lNr60W
 MG/dNchYM7dTfJxZPDLH1GGTYt7U/e1HnhWx2oqCA1/0P1ygyqu8KbbITOMC4ETJuwl3vXrNO/fqd
 Cd2UydpE9qtOfvLUtZxiNxB5aKf8K+ga21H4XEc7b7PG50CYsZnZq3IDMryxOPMc0ZC1OGlhfq9iX
 3dDqA20yrdWI0TnlMCUAx/+Ekos2KAnPO+8kjbueM5wWt/blBT4T1+d168nOwYh/w/UfiEjeQcA8I
 gxtFjA4qKsBuT6lNb7p83fz0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nx5el-003pay-L1; Fri, 03 Jun 2022 11:39:55 +0000
Message-ID: <27dd54d1ec4f7f0b6138d1d9e63b8b040f6eec6f.camel@samba.org>
Subject: Re: Reintroduce netgroups support?
To: samba-technical <samba-technical@lists.samba.org>
Date: Fri, 03 Jun 2022 13:39:54 +0200
In-Reply-To: <4ce02f11ab5012b67f3667df5eb73489e1dcd334.camel@samba.org>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
 <4170ad2340f7a3f2bc40c4f6c77ba5420a0c1cc8.camel@samba.org>
 <b1e1aadfb2a9441afd8f58e096cfbccb8bd54d1d.camel@samba.org>
 <4ce02f11ab5012b67f3667df5eb73489e1dcd334.camel@samba.org>
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

On Fri, 2022-06-03 at 12:01 +0100, Rowland Penny via samba-technical
wrote:
> On Fri, 2022-06-03 at 12:40 +0200, Samuel Cabrero wrote:
> > On Fri, 2022-06-03 at 11:10 +0100, Rowland Penny via samba-
> > technical
> > wrote:
> > > On Fri, 2022-06-03 at 12:00 +0200, Samuel Cabrero via samba-
> > > technical
> > > wrote:
> > > > Hi,
> > > >=20
> > > > I have received some complains after we dropped netgroups
> > > > support
> > > > in
> > > > Samba 4.15.0. Our release notes only mention we dropped NIS but
> > > > netgroups went with it.
> > >=20
> > > Well, netgroups are part of NIS
> >=20
> > Nowadays you can store netgroups in LDAP.
> >=20
> > https://ldapwiki.com/wiki/Netgroup
> >=20
> > https://www.linux.com/news/sysadmin-sysadmin-netgroups-are-not-just-nis=
-anymore/
>=20
> But using Samba with ldap basically requires SMBv1 and Samba is
> trying
> to remove this.
>=20
> >=20
> > > > Some people still use netgroups without NIS, stored in LDAP and
> > > > made
> > > > available to the system through nss_sss, but it is also
> > > > possible
> > > > to
> > > > use
> > > > /etc/netgroups.
> > >=20
> > > Why and how are they using a part of NIS without NIS ?
> >=20
> > The netgroups are stored in LDAP and used in the 'valid users'
> > share
> > option.
>=20
> But, you really shouldn't use 'valid users' with AD, you should use
> ACL's
>=20
> >=20
> > > > I had a look to the removed code and I think it is possible to
> > > > reintroduce netgroups support independently from NIS, using the
> > > > getdomainname() function from glibc instead of
> > > > yp_get_default_domain()
> > > > from libnsl.=20
> > > >=20
> > > > Should we bring back netgroups support?
> > >=20
> > > I do not see the point, AD groups can do the same thing.
> >=20
> > AD is not involved here, this is a pure file server use case.
>=20
> Then it definitely shouldn't be brought back, once SMBv1 is removed,
> then standard ldap will very probably not be involved, just AD and
> netgroups will not be required,
> =C2=A0
> Why not get sssd to work with Windows AD groups ?
>=20
> Rowland
>=20

Rowland, lets remove LDAP, AD and SSSD from the equation completely.
Consider this pure file server deployment:

1. Set NIS domain name

$> nisdomainname
foonisdom
=20

2. Add couple of users

/etc/passwd:
user1:x:1001:1001::/home/user1:/bin/bash
user2:x:1002:1002::/home/user2:/bin/bash

$> pdbedit -L
user1:1001:
user2:1002:


3. Setup /etc/nsswitch.conf

passwd:         compat
group:          compat
netgroup:       files nis


4. Add a netgroup

$> cat /etc/netgroup
netgrp1 (,user1,foonisdom) (,user2,barnisdom)


5. Minimal smb.conf

[global]
        workgroup =3D WORKGROUP
        security =3D user

[share]
        path =3D /srv/share
        valid users =3D @netgrp1


6. Test, samba < 4.15.0

$> smbclient //localhost/share -Uuser1%<pwd> -c 'quit'
$> echo $?
0

$> smbclient //localhost/share -Uuser2%<pwd> -c 'quit'
tree connect failed: NT_STATUS_ACCESS_DENIED


7. Test, samba >=3D 4.15.0

$ smbclient //localhost/share -Uuser1%<pwd> -c 'quit'
tree connect failed: NT_STATUS_ACCESS_DENIED

$ smbclient //localhost/share -Uuser2%<pwd> -c 'quit'
tree connect failed: NT_STATUS_ACCESS_DENIED


--=20
Samuel

