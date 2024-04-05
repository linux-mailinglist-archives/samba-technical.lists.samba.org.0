Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E618992AC
	for <lists+samba-technical@lfdr.de>; Fri,  5 Apr 2024 02:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=K7YiUqv8hSwp9Y2wQywvprR8lJkcMd1wbd/c9fj8C88=; b=qpZe8OOYdwi2Pd/YP7oDnw0Xi0
	VShJ8/nymyKaKcBGIjTQzdoQvx+mM5cPuc+yOCGfTEfYmXV6DpjPep/NxqoUXQBUxwZotILyL+Ovc
	7Onx4U0HqNZFssSxvH+c9w/eLBg/LnEvPJKUQ/j3MAeB7ACwAAWcfL02IXvOwzklX2GMw3jSdzCSx
	wwY9lvIypkBSGT6H0gVGc2b96At2JcGsbtPNmmixm02BslKGvI2z15JTMpwFS9JiFsP/lgo3UI08j
	E/H+5IuCl2Z3s6vRkGnKTxSZi5mJT4fBWQ7b17NqBUfYQEbH8uxNZhq28AVmPujay5SvP0eaaZSSK
	lG7fP+ew==;
Received: from ip6-localhost ([::1]:26692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rsXla-003wJ8-Oc; Fri, 05 Apr 2024 00:49:14 +0000
Received: from mx.manguebit.com ([167.235.159.17]:41684) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rsXlW-003wJ1-NE
 for samba-technical@lists.samba.org; Fri, 05 Apr 2024 00:49:12 +0000
Message-ID: <b1680423bce48c6ee54e43f894607ba1@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1712276656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K7YiUqv8hSwp9Y2wQywvprR8lJkcMd1wbd/c9fj8C88=;
 b=tDihX92CZy8RFJEJtYr2H5Iif3FbpniuQNGRskiK8Mwibp+VXO4oQ8kEd39Ig6zTASM47U
 9xHNgEtetwMzpnv2+yKxdbVnV3dvcOD9nB78jDir3BGcDcWYdcSdyYylScH3SsUXMjwtP2
 4arl2wCsMAGyv+xeXxDq63uswEg8MKhlidTrgzXBKh1Ae4S1qXFRioVPUbi3fozejAi7A/
 eWKb9bLLpnkaXYFhQqGrRwyVDC6kMxiiik8Rnm2PSeSAsxNcxoXAjEm5OrvpHX2qVVyM3X
 1nFIJVBZIYg4jCTqktrajY7GBpqhqA1AJ+NQQiTf4eTIux+Labv815plkduWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1712276656;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7YiUqv8hSwp9Y2wQywvprR8lJkcMd1wbd/c9fj8C88=;
 b=FzWWU6Grmaps+SQzCFnYbD/RfrQ/7IwKbgl6Xn7een1Vzagl1h6UmJRt8YMvgHgnHSPqh3
 T0GwJylwrXLj9MX+ldwtSeN/RJWGAVj114cz6Ci8IjcVZuRSRZdkP5wxQynoRYDVZVipwd
 Bf4W6ebVqeX48pidCEts8teJouj/NWyopha8+/nsKlUYUDN9XoF+QFNhw8QDGu6Mg8Z7kX
 E4DZ/DwHMNjy+j9gjqEcrCMso3xubfQLKOZDVc3hSKvv94h14Hy6AX620unF2GdXRlOo8g
 aipwcugHwVYvdgweA6GkTW6i24zJqFcyGMuLjqYPfRUMer7Oth3EdMjGrVYtZQ==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1712276656; a=rsa-sha256; cv=none;
 b=S5viGfaWXr9Cs/q7CA7eiB51ne4ttO6r88ws8tBhnGNsDWWk1TwINNR7kYxKH7wZKuynG5
 K6f/LB7U630q2iRcvUjXS1hvS+wwBH+vgQPR3k8+fuZxNhj8U5udZmtkprxMeHivcDWVFo
 j4yxiU4fcGGaopxlcd5b8+EbSv/rZb86SBM3cy3CNluDAuDDTxqnlbliCF2gVqERD4nssG
 D9/KOrz+boFRWPe1Au0WZxMmTBAs6qpgkbRQ4Jpc+Pm5Tm6nM3MTl8GxdKMlUnvJ3F+lYA
 oZG+xp0pfkif4HGNum+Ls9aHBVMWyOMFxtpInIjKY1GX1qQ9XBRFHVvcfO5Iuw==
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: [SMB3] fix reconnect so it can handle cases where server is
 doing password rotation
In-Reply-To: <CAH2r5muFhPy+zJ7iuyOajVT8PQhO=2ruazg0kkbKOz3_YeNWSw@mail.gmail.com>
References: <CAH2r5muFhPy+zJ7iuyOajVT8PQhO=2ruazg0kkbKOz3_YeNWSw@mail.gmail.com>
Date: Thu, 04 Apr 2024 21:24:13 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Tom Talpey <tom@talpey.com>,
 Bharath S M <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Steve French <smfrench@gmail.com> writes:

> An alternative would have been to use the kernel keyring for this but the
> processes doing the reconnect does not have access to the keyring but does
> have access to the ses structure.

Are sure?  For example, DNS resolver and kerberos auth require keyring
and are used over reconnect.

