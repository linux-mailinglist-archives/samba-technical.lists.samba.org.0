Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B9653C944
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 13:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=WwcUnTwcPOJOnVGDvvsbAsEqeZ1YI2t2aVA9f2Lc0FI=; b=WQ0mGlUf/hl/hboWCrNO4V1ciU
	cXhfKFL74gLDlqm2P/FKGoRo7dWbCjWOxsC47D2SIBjHyKlejHBW2H27ZbQJA6C5I7pleNY1YtyZ+
	gyb8KxeFHQIKvr68AyCDZBfoPFy5bP4324CMNYo4xS4FFhEMc8reZI/kvZ1hjOb6zrFUF4/3Pl45L
	lkO7PjcaKykbsNkoXJb5O/W6CgJMWCwFkVoMJIiT8+OdD96nC4p0btq4TZTCJAwWKOe4xgTOLy+wP
	bPmI82xTC8nGtTmPs/CGD9Fmx6SJVintH4Kmh2CQiIZgp9FQ2eZQJCDEEmOV5JI40ukuM1UJOeHtH
	bLwsg/fQ==;
Received: from ip6-localhost ([::1]:42206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nx5Sw-006qUM-Cd; Fri, 03 Jun 2022 11:27:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61996) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nx5Sr-006qUC-CD
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 11:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=WwcUnTwcPOJOnVGDvvsbAsEqeZ1YI2t2aVA9f2Lc0FI=; b=2e6aNhmYgKArF5qqXlNF4Vd6vK
 xPt3iDjEWjIknvkoonroWB3eFHSatWA0JL0JVCjroqkHhP4Shqyj73nWWVpVc+UVXZV/76VqgUNva
 agMy1sqx6Ip7hAyBzyvOVuV4ANtP7o1cvCFbFkDukwRq4asuzy9/dpJRRLzmgczjp6FMbrDkOVENE
 43D7/53RHyt/Fq2gYQtgUyf0E1Ja8k84VSDUPOeIFubwRsAnZ26EzhEZWWVy6ZxUtVlZskxH6rqQy
 uOx1oxW1Imxe0aDX2+zYhxVyvdEYCXa/eXR0E7y6luK2Cclr6GUcUZ5ENKxz07llNmTK998nB3L+A
 RdoemBNO8MQuDSAgyOS9W4TUc0WYRBfHlTN/Krg7pgnGE7XZdYOmkKH0r2fdJ4+3n136/L6eMwcUa
 MZaok5dLuf8Zzn+WpxMVifowmwNMDsjbwXBUNHPVQDwcZaCOiK6L5nQqwC0IKq0vaZrQH33ONthEP
 heszZ3qUe77dNy69ipUihyUO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nx5Sq-003pVc-Bm; Fri, 03 Jun 2022 11:27:36 +0000
Date: Fri, 3 Jun 2022 14:27:34 +0300
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: Reintroduce netgroups support?
Message-ID: <YpnwJqKrIWEUiQda@pinega.vda.li>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
 <4170ad2340f7a3f2bc40c4f6c77ba5420a0c1cc8.camel@samba.org>
 <b1e1aadfb2a9441afd8f58e096cfbccb8bd54d1d.camel@samba.org>
 <4ce02f11ab5012b67f3667df5eb73489e1dcd334.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ce02f11ab5012b67f3667df5eb73489e1dcd334.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 03 kesä 2022, Rowland Penny via samba-technical wrote:
> On Fri, 2022-06-03 at 12:40 +0200, Samuel Cabrero wrote:
> > On Fri, 2022-06-03 at 11:10 +0100, Rowland Penny via samba-technical
> > wrote:
> > > On Fri, 2022-06-03 at 12:00 +0200, Samuel Cabrero via samba-
> > > technical
> > > wrote:
> > > > Hi,
> > > > 
> > > > I have received some complains after we dropped netgroups support
> > > > in
> > > > Samba 4.15.0. Our release notes only mention we dropped NIS but
> > > > netgroups went with it.
> > > 
> > > Well, netgroups are part of NIS
> > 
> > Nowadays you can store netgroups in LDAP.
> > 
> > https://ldapwiki.com/wiki/Netgroup
> > 
> > https://www.linux.com/news/sysadmin-sysadmin-netgroups-are-not-just-nis-anymore/
> 
> But using Samba with ldap basically requires SMBv1 and Samba is trying
> to remove this.

These are orthogonal things, absolutely. When you run Samba as a file
server, you are not limited by SMBv1. Your user and group information
can come from multiple sources, regardless how you are joined to domain
or not joined. SMB protocol version is irrelevant because the checks we
do for netgroups membership happen when we check access to shares, not
when we choose which protocol to use.

> > > > Some people still use netgroups without NIS, stored in LDAP and
> > > > made
> > > > available to the system through nss_sss, but it is also possible
> > > > to
> > > > use
> > > > /etc/netgroups.
> > > 
> > > Why and how are they using a part of NIS without NIS ?
> > 
> > The netgroups are stored in LDAP and used in the 'valid users' share
> > option.
> 
> But, you really shouldn't use 'valid users' with AD, you should use
> ACL's

This is not always about 'AD member workstation' case. Samba does
support more use cases and they aren't being removed at all.



-- 
/ Alexander Bokovoy

