Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 735A5180CD3
	for <lists+samba-technical@lfdr.de>; Wed, 11 Mar 2020 01:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1a4cdwd4S2A1VxE1UpO8nqCyAXh/Ms5HeKlRu+jzhB4=; b=C0MNk1TGbNSogHJhjUqmJ1hG0p
	kh1alIC2Wtf1c2Uz69XbhSqjbzFoH9uC2jxDBk28htQ8T4Q6LSszyquv7MUzuuS4FnS36ZX6bTIaB
	wI/PBdAbA4AzaIsBYouLbZ6FrKgL+fW/lhEarIoJ8T3XM9h3dFmH/+7wN186bxgMg/21QaWHfQIAu
	NhtugmfjDKhioD/o+LDhNCOwWqUqGZiTtS/qf0qmNmPfHEbMVIiQJqPkCbKImqMa+dOrDdi7nopAi
	fIjow9CmVn/XtLhPFpJhDKwxraqrvgsCVdgfwQ3BLLEouTxope3vrgHPIcY3axKlYRICbR3+K7G9J
	CYFijlFA==;
Received: from ip6-localhost ([::1]:53570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBpHY-00FmpP-IB; Wed, 11 Mar 2020 00:31:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14794) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBpHS-00FmpG-Bh
 for samba-technical@lists.samba.org; Wed, 11 Mar 2020 00:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=1a4cdwd4S2A1VxE1UpO8nqCyAXh/Ms5HeKlRu+jzhB4=; b=usYPZPLH07NzdW4WRbwP7s3fZ4
 +GRIf7LsZYON3p/8DdWugbx+btd8opotdCmF2846uejDGINR9ZXrCgcCH2z4zrc0emL0eiGDUZ4+1
 lRFdC6RsMLj4fga1nuL42BxKa9c1K3kuKQIHyNjw9+L5ehz25Mc8d+KpJnuTwjAwIG1mzrDLYD2rM
 W0yzuHihvUoRWmFpGLgU2fT6Eq0jcelfw/IrDFvNz+DDYhX0ZXiRCxSrRwUcfzofvWBje3/UbcxNM
 h3g0ubntd2ACwAWgrUbDumyYEaigs0POptmQo3ssQFEjKWiphjOFS7lU5YOhhA8y6Ia1Qz9MQo6c1
 PYqfeNEhlIE35bHRt2up97akC5cCezdmzFvB040na0ERxxhZdFL+h0a5ruIKgC7Axf3/YYrGtfk70
 2JQQmSh0oe0XFsdbRhaIANTGCC4Fg0AQ18LeP8UQr2V0jhipsSjmgJ9+RO9HeD8Cq0EXeGySgVnd3
 FyE5HP208cA+XmO+9xsXvpZ7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBpHQ-0005YM-AA
 for samba-technical@lists.samba.org; Wed, 11 Mar 2020 00:31:24 +0000
Message-ID: <b164abb5639ec380a113634ef0831bcb5063b1df.camel@samba.org>
Subject: SMB3 compression exploit in Windows: ADV200005
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 11 Mar 2020 13:31:20 +1300
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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

I wanted to write a public heads up that Microsoft has published an
advisory about an exploit in their client and server SMBv3 compression
code.

We may start to get questions about this in Samba, and Samba users with
windows clients might wish to carefully consider the guidance here in
the meantime:

https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/adv200005

On the Samba side of things while our lzexpress compression code
sucks[1], it isn't use in a vulnerable context, and certainly not in
SMB3.

Andrew Bartlett

[1] https://bugzilla.samba.org/show_bug.cgi?id=14190
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







