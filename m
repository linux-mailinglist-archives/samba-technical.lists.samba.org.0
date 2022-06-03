Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8AA53C828
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 12:10:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Eob4NJbfluRd4tiTwB0mudq0pYcogT51WQQH/VR6csI=; b=zXRhaiIfYz5dQ+m00LcwAMzlKR
	Or/rYamaG4DOXvzhwjK8vgtaVUlvytAWSxKoPcjRaI6sfUjVGQcedCNqy89FtC6qMVlw/T8JSD0XM
	tFW7fuyPWbTmm1AUMEjZSme8RzE1h5IGz+hSWZYNSMl+FbJwK4e2Z0tXnOcR+Cnp3KHqd8UdXy3oc
	Tl9K+faDvrnc+mwyck/SweAqyl7ApgWvLAeAMTfi6Qkv3nfImhicpphGEPEAzFBST533NoBDRTz9a
	DilxIXmZdCVEzt9IVvj5FsDF30xetIltW/LmYCqavIKJO3BMcQtexx4wHt8DJ+hu3/fizp0EmIh4Z
	s2fpB8rQ==;
Received: from ip6-localhost ([::1]:39490 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nx4G9-006pCe-AC; Fri, 03 Jun 2022 10:10:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61984) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nx4G4-006pCV-TN
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 10:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Eob4NJbfluRd4tiTwB0mudq0pYcogT51WQQH/VR6csI=; b=CPrtDGipyUWOkRHdhofuLq4PZJ
 7w06/WkysMCcYxPG+NBO3O4jeiD4kISmyxz/pKIEwNDsdqkq+ltEXDVcUx/ThaOBKWWaAazCKmJWa
 C7IJvde1WOLZu0H5fDoDKhGOkzy1q40a23PvBAoArqG+Yg6d2sNluWIKr/MS1BMgoug/ncj/I/hdQ
 tCTytioeXQOPs1vCgQCG+0RZYdiqDMdSVpUsHW8relmuLFrm9C4LCnpKZMfaYKwnsIwgwk1Ik36tV
 WFoS0tstDDdPBMyjc0k3uanC9Ax5RTDmkei/T3TxeQ6UqtyI3vaKMBwiLchTnPPieY0MRl8tiM1JS
 JlO/7iHZmZ5YlJaLR5VVIHdOrnHYWk/JjOKJZ/VQbpcAHoJ6kC74ef9u/+q59g6ntRDPbfcHTqi22
 exAnmAGmqCWc7Bcqyy36OsxVG7Fn1FOrlssr7gW9/S5l6dQ5UKw6iOGZZCf1ofEK0GCNcyEuZ4Q89
 uH18cKhD3tQev5c41mEDwekC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nx4G4-003p0D-8Q
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 10:10:20 +0000
Message-ID: <4170ad2340f7a3f2bc40c4f6c77ba5420a0c1cc8.camel@samba.org>
Subject: Re: Reintroduce netgroups support?
To: samba-technical@lists.samba.org
Date: Fri, 03 Jun 2022 11:10:19 +0100
In-Reply-To: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-06-03 at 12:00 +0200, Samuel Cabrero via samba-technical
wrote:
> Hi,
> 
> I have received some complains after we dropped netgroups support in
> Samba 4.15.0. Our release notes only mention we dropped NIS but
> netgroups went with it.

Well, netgroups are part of NIS

> 
> Some people still use netgroups without NIS, stored in LDAP and made
> available to the system through nss_sss, but it is also possible to
> use
> /etc/netgroups.

Why and how are they using a part of NIS without NIS ?

> 
> I had a look to the removed code and I think it is possible to
> reintroduce netgroups support independently from NIS, using the
> getdomainname() function from glibc instead of
> yp_get_default_domain()
> from libnsl. 
> 
> Should we bring back netgroups support?

I do not see the point, AD groups can do the same thing.

Rowland



