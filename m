Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D2A53C80E
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 12:01:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=F3H+DpnK9eQFEkfQMUeWV2l/cSdUKLP83qGtZmGJ1lI=; b=Tu+B0yuBdLq8buZGYd2lGsXrgR
	jN9gpjFfvkz4dnh/Bb+Fi8I2RJJjMVBN9tAiY8nXYH4H/9aCkzDGLHcHdEaSAbmGYNnP02QKWDllJ
	y7qL2hnjAxqS1ojbdZHCsu5qYFkT0Y9prPyLIsmO4NSQG6WT0tkIGeK4raNFhRV6iqnzsjXUi2ak0
	2dhUTKxbZP3eDVebazHh6UnQ1x4vWmrDtUtVdcSvJBdiuyfjVUDJ+k7TfyWgIQdqwDBYwp403qtRT
	0DhdlhQ5pdFz4RJStamj7WrGag3pmmQkqZnzm1Xt1C03tfD/znZ7XLNFS+2BP9hGLY+Sm41L2ufgH
	J6ObhLGg==;
Received: from ip6-localhost ([::1]:38804 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nx46S-006ouJ-Ny; Fri, 03 Jun 2022 10:00:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61982) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nx46N-006ouA-Ea
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 10:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=F3H+DpnK9eQFEkfQMUeWV2l/cSdUKLP83qGtZmGJ1lI=; b=q79WKSWmHVYC2qotdNNH7i+FSJ
 cnpsdB4aqStWGUUwbkwGYmrjD7XEkUXnpqXnXHCIAHzpy6eQs6r4ZPjcEw/Pi9uubBbGwlR+I/hMJ
 QPxra4DeCHXehmW3KZx4ZqT+IHsVjGJUNCEBhllNx5lZz9PXvMm4Gl2/8tIp+xObAS19PLLdVFQ8Y
 Azle9565f96bCQ0lHRDXnpnq5MNI2o+6ey6/2FN8M54kaWtPYKnn318FXUTfEbLTOpEk82AHykHU0
 ALo1FLfd8RhUhnDJH2d0hbYbPANOSOJOehRoXxFosX77+/0smpUmw0cuSKyixhce5n6GJGOe2XBaB
 mT5zFBsDFCh75N078WfznVr4deqM6zk1Gk4YwmFa6EAXGWAI6yM2KVUl5CLiZM5s2ccZxluKN456t
 3P81UeGd1OktHJbL+vJTyxuddu/TOgziLq5ZE6H2BOj8U92fa34sfHfth7v9c1WsaMvMRVaLoBPtF
 uMMLP+or7wu0gkqTB7C+QHtF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nx46L-003owC-PG
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 10:00:18 +0000
Message-ID: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
Subject: Reintroduce netgroups support?
To: samba-technical@lists.samba.org
Date: Fri, 03 Jun 2022 12:00:16 +0200
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

Hi,

I have received some complains after we dropped netgroups support in
Samba 4.15.0. Our release notes only mention we dropped NIS but
netgroups went with it.

Some people still use netgroups without NIS, stored in LDAP and made
available to the system through nss_sss, but it is also possible to use
/etc/netgroups.

I had a look to the removed code and I think it is possible to
reintroduce netgroups support independently from NIS, using the
getdomainname() function from glibc instead of yp_get_default_domain()
from libnsl.=20

Should we bring back netgroups support?

--=20
Samuel

