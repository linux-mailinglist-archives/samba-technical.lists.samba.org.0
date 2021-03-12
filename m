Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B413382F1
	for <lists+samba-technical@lfdr.de>; Fri, 12 Mar 2021 01:57:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=J/SP6x3nYcGHQIqT0dhaKjgUgbKJe+EF7RYDFd1ZUsc=; b=b+b7gnzfsU+EuP62AXpfR6Om6M
	l9glve7WGOuiwaMc/AoZ91wQGVIFqsJWxpKgQPhf0odatiWegvWLhE6H1Awwig9Ki+DG7AC3rlW5k
	Oo6z5Mqd5mJoSvmBsO/C3lAZnod1z9OuGGZihjCRiEF2XK085zkTYNW00QBGSndZhrekbEe4U4QX3
	B7fNxRdeK2KI6C+FKqm+k15qYe0D69PhBM30uqWTeTWruEMHRGQ2ZmPXojeU2KMfKZN7ogobLqNwG
	DIzRbhF7bjX1XF398nCZASJHvRrsDxnQBjlbn6XO/osM0RHxvOfnX9GVxJ0HdP741nuvr+ELno2jj
	R2osxd9A==;
Received: from ip6-localhost ([::1]:55722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lKW6e-0055qu-Qm; Fri, 12 Mar 2021 00:56:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47162) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lKW6Z-0055qg-UY; Fri, 12 Mar 2021 00:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=J/SP6x3nYcGHQIqT0dhaKjgUgbKJe+EF7RYDFd1ZUsc=; b=3rEzOy2HM1OVIBRnzp5HlbUf8i
 P8As5IDlKNY9ybsstkYJRBj/1QmbDQiSUI2JaFV5SpDs2XBBOGtBx90FeiMnMQ8cGUaE2LADTaaNF
 e/kCGiBU/OIBylWK6SXYq0HJwC2eXAa5R9/tB+411V4aWM1cS+Ianwp0LPE92nWX54bpv1QAPKA2i
 bwZjgLaRg2/+so0bAtCYjPgdEAh1GwaeYxTGmfA/cOPAHSqqVFf+FSeMbtfIND81Oa0Ud9nLNOQMU
 TaSYGOJngjz7d7nygdCWFPHlOGJsfMQKWbrSk1yqSV9PQ9FFUbSxkRb2tEnMLRPNMCROfqezYRfBQ
 MmirpFkA+3VacPUKWu8VtQrrzDPRy8OS3uBroVdmWvFkulBe2alLH4A3iVZrqqNse3zacJhNNRye7
 RZry6YmxTj5Wg73JQVBZHBSx4u0E6VvLJLQ2QZzQGBRObkdQB6K4F7xj70FeqI0KiCTbKRKbKy7Cw
 LBi4bDmJ1+SxYb9qBftMHhdm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lKW6Z-0000vK-4d; Fri, 12 Mar 2021 00:56:39 +0000
Date: Thu, 11 Mar 2021 16:56:26 -0800
To: samba-technical@lists.samba.org, samba@lists.samba.org
Subject: I want to delete the Samba module source3/modules/vfs_tru64acl.c for
 Samba 4.15.0 release
Message-ID: <20210312005626.GC1939059@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This reference:

https://en.wikipedia.org/wiki/Tru64_UNIX

shows the date support was discontinued for
the entire Tru64 OS was 31 December 2012.

I'd like to remove source3/modules/vfs_tru64acl.c
=66rom our tree as part of the VFS modernization.

Any objections ?

Jeremy.

