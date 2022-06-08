Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D437543C80
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jun 2022 21:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=kUBIPpcFtwoYKs5BfVadTivYrLy0pCX9/UFp6Rkg3GI=; b=M9Gl8oPIulmWpHB7ZPv2Y46sjg
	R5R5pY+nGD52zZCyCk4cIsoMpnXDlhSLgfbQvMUET62IqmDbF3EclL0QFopu4aqgV7U1C/kEbBG2u
	IhwP9CoR/7rrmCwec6dMKN4tH/zZ3hCkp3WxQ6I/kz+zM6l1e6sc7u707nUitZQwwPRCFn31zvGoq
	QevYmGpdqMf8Mu+HdCGAtCFX7XJdJOaCO3H+J4aMcUDXr4sDyuoh3ZaRlvF80pAO6JCz8M88UXbSF
	fGqJ3APtk7gyL4fGbs87jyavnBvQs95MF6OWYRervtTGT964JM3hzYEJLiMbpJs/KGjU0VHBsr5Bl
	Tp1XtTbQ==;
Received: from ip6-localhost ([::1]:19026 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nz136-008Qnq-NA; Wed, 08 Jun 2022 19:09:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62168) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nz132-008Qnh-CA
 for samba-technical@lists.samba.org; Wed, 08 Jun 2022 19:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=kUBIPpcFtwoYKs5BfVadTivYrLy0pCX9/UFp6Rkg3GI=; b=lhsbdNpDfdTS+QCuYvd7Zgvc7v
 WBM5U1dCgPNVnC77bOfugxbV0B4RNz1u5FtV85eH2BJEV/p/kWgGgaPiHV4RJx/9pC/TU9zcxBJh2
 UGCaqFYsUiZfbPOD4M2p43j4HM+MlkWQlGU5X/idUPiModDeyUeXJVufLSHumDIZiVcQjzR3ijtkk
 H77T03mb8MxACpF8/WOQBxa8RO90sFNRV2bU8inc/YNoVxuvj39/PKX5vK0r5/JBBusXirzInQvTW
 m43XS+RDtTK0n3CcsLRE5sMIKUSfZTLy0JZDIynXoOLlFyojQdAEjDKb4p323wnFPfyvMz+e16kQs
 qoUS48xWttmwp/0So2y8m55+JASpFWov7ALAetLEEdj0XiUcO2kcZp2OYtO9raTd1OCEzNP0rspFv
 uGH5pF7kSEIcglz9QDc87RMi31VzidtCg4a3mWXlNq5689GidB37yffFpsdVt1hlsASZ+KohVAExA
 sinEdcLquIj6j0O5BOUDLl0Q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nz130-004crw-82; Wed, 08 Jun 2022 19:08:54 +0000
Message-ID: <fbd3d4cbd94e639a87cb7fce4ff21da643c3a854.camel@samba.org>
Subject: Re: More Podman work needed
To: Uri Simchoni <uri@samba.org>, Andreas Schneider <asn@samba.org>
Date: Thu, 09 Jun 2022 07:08:50 +1200
In-Reply-To: <73759a92-13f9-1a92-06d1-42d24873ff42@samba.org>
References: <55008d104d4efc5c286e790836e1a6d4a01ea525.camel@samba.org>
 <1737413.VLH7GnMWUR@magrathea>
 <2f5a0903-d3bd-8833-6e3d-da3540124c2f@samba.org>
 <1924935.usQuhbGJ8B@magrathea>
 <4f5b548b-ee32-cd2c-6359-de61f0d7f15f@samba.org>
 <73759a92-13f9-1a92-06d1-42d24873ff42@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2022-06-08 at 21:44 +0300, Uri Simchoni wrote:
> On 6/8/22 21:30, Uri Simchoni wrote:
> > On 6/8/22 19:22, Andreas Schneider wrote:
> > > Maybe the rpmkey package is missing for the repo. Which repo was
> > > it?
> > > 
> > CentOS Stream 9 - BaseOS
> >                                                               1.6
> > MB/s | 
> > 1.6 kB     00:00
> > Importing GPG key 0x8483C65D:
> >   Userid     : "CentOS (CentOS Official Signing Key) <
> > security@centos.org>"
> >   Fingerprint: 99DB 70FA E1D7 CE22 7FB6 4882 05B5 55B3 8483 C65D
> >   From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
> > Key imported successfully
> Correction - the key was there prior to installation of additional 
> packages, so all is well, sorry for the noise.

Thanks so much Uri and Andreas for all the work here!

Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


