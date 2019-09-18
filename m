Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B214AB6192
	for <lists+samba-technical@lfdr.de>; Wed, 18 Sep 2019 12:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=2Na9Q96ifZDMtCRbmb6xOt+HxX1zoTxAk0axhrQhFgQ=; b=ED17o+7NKN867as9+MEh/VtKjB
	UYRNq6ioGPjS2cWoa3S/2Qhkkh2+V+GmG8rhaogp2ITxzNEKEI91I5AqJgS0gHoaGIheLZXI5YUxA
	H17VsBK/R1KM9LDLcVIPun7Me/foFCs3GOvruLQ3JIuMdy1yoDIfxiB7m65q0TAM7VYQUkxnWLf1m
	cl95cm00eIb+XOoVkPh/nOBg6Y9xtST91VFBlSYXBYP7kG0hTau1o+RPM27dLWWR4vac6qta4Yj3d
	dCI7IjM8nnGS/U7HYNY7cALE1G2Qq0s/9mLQA9CwZ22UqIXih5Oa2ViSSnBEOvzV6KzmZQ20TubUG
	C/GlrJ7A==;
Received: from localhost ([::1]:28254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAXOU-006VMO-Mu; Wed, 18 Sep 2019 10:41:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43944) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAXOQ-006VMH-Fi
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 10:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=2Na9Q96ifZDMtCRbmb6xOt+HxX1zoTxAk0axhrQhFgQ=; b=uzs8aB6Kv/dg/1IBGANp17/Kpf
 UhGKZZKJLV4SeU7Az3IJ91hmZOWGabHBfN3HODqBEUlmfakcyAmMdA2UNqn5cykyb8pLYfbgZ56p2
 zJgJvb2gJgWvvRYUAsAst1lSeBAK1c5VkjPBWO+bbwB3Sw6m/+mEZPbGeshjNj4XC3+w=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAXOM-0002sN-Li; Wed, 18 Sep 2019 10:40:58 +0000
To: samba-technical@lists.samba.org, Nico Kadel-Garcia <nkadel@gmail.com>
Subject: Re: [Release Planning 4.11] Samba 4.11.1
Date: Wed, 18 Sep 2019 12:40:56 +0200
Message-ID: <1647554.S0p9aAJIM7@magrathea.fritz.box>
In-Reply-To: <CAOCN9rx_8eJR-ZgXrH6_zJFNDAOfoio+2Y89-QT_ZyCE0jcz5A@mail.gmail.com>
References: <43d2884c-c637-a028-2f17-9857483a11b4@samba.org>
 <CAOCN9rx_8eJR-ZgXrH6_zJFNDAOfoio+2Y89-QT_ZyCE0jcz5A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, September 18, 2019 12:54:57 AM CEST Nico Kadel-Garcia via samba-
technical wrote:
> On Tue, Sep 17, 2019 at 5:16 AM Karolin Seeger via samba-technical
> 
> <samba-technical@lists.samba.org> wrote:
> > Hi,
> > 
> > Samba 4.11.1 is scheduled for Tuesday, October 29 2019.
> > 
> > https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
> > has been updated accordingly.
> > 
> > Cheers,
> > Karolin
> 
> Will the experimental support for mit-krb5 be considered stable enough
> for production use? The Fedora "rawhide" copies of Samba activate
> that, rather than compiling Heimdal.

We are working on it, but we are slowly moving.

See for example the work from Isaac:

https://github.com/krb5/krb5/pull/912

and

https://github.com/iboukris/samba/commits/asn_iboukris_s4u




	Andreas



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D





