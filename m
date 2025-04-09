Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B197EA8224E
	for <lists+samba-technical@lfdr.de>; Wed,  9 Apr 2025 12:36:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NgpExsv6pogPaSM6P8ekWFPkR3yybuHBiWAw3rLeV3s=; b=MD0RlGjogEWBeZo5u0QxhGq7FH
	kmzze18tZ3cvAAyhZisA118dOVILUQKy17rc93eGJpxh7yQRlVQ4yK+MWRp6yGdUh5WldErgBVYPk
	yMphvtYmgvxRTSXQ3ivaWEPkf9aKd7/9eYGy06HJRO2PlJoBVd18nIzWzGhQlAU9+1UPGj50hiDAG
	GsuKfULVlvvR46hbr8m9WoL0s1xiV/L2CqgKo5zIAjrSoeybbMuZV2F05Diu+k5THqlUg69G/mQGy
	JUYCVFI3aF9rTz/aqKTE6AhozIB4dIALfoFZjiByfRMBLmRO9qD16ONLdVjnIxjUf2zn1HfR9Vm6d
	amzoce8g==;
Received: from ip6-localhost ([::1]:49284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2SmJ-0020Tl-Nf; Wed, 09 Apr 2025 10:35:31 +0000
Received: from relay2.ptmail.sapo.pt ([212.55.154.22]:56866) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2SmE-0020Td-Ns
 for samba-technical@lists.samba.org; Wed, 09 Apr 2025 10:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1744193768;
 bh=NgpExsv6pogPaSM6P8ekWFPkR3yybuHBiWAw3rLeV3s=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
 b=Ll1ZBkLBtm74hORhwzMWweJMXXHU8b/Cj87ypqTEWQb6/zGlwcKZne1k4sBR5cA0r
 BlFO82mkIeC/JgXxRjcXioP6tjoMJfoVj1EarykcFuWsxKr2y/FwTOiWEWMLo09NHz
 PDp/FeyjLWwRlOrfuy2eRK1O5KyDLzK9BGY71bR6HFsE+8JkA2j2iMNTJv7u614l5l
 14JGt3gr2mc/C47R2GZ7Yen82pJzPP31VkPJH8ldikZo/DS/4fL0HERMNZkAfyfNqa
 KqBo4B/Viv2txeCWcDdAmdZLS2y6nUMRB+IeB7+zrvR/x3D31ZGIYH1yOnmr3udVso
 xai685N5pFX3g==
Received: from sapo.pt (unknown [10.134.36.76])
 by relay2.ptmail.sapo.pt (Postfix) with ESMTPS id F3327B516C1
 for <samba-technical@lists.samba.org>; Wed,  9 Apr 2025 11:16:07 +0100 (WEST)
Received: (qmail 622072 invoked from network); 9 Apr 2025 10:16:09 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.245.190.191])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth02 (qmail-ptmail-1.0.0) with ESMTPSA;
 9 Apr 2025 10:16:09 -0000
X-PTMail-RemoteIP: 85.245.190.191
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: <samba-technical@lists.samba.org>
References: <CAH2r5mvSBqF1uW+hZ+1syN=bZsqn6RPPfDgsho6FxpMgJRBHzw@mail.gmail.com>
In-Reply-To: <CAH2r5mvSBqF1uW+hZ+1syN=bZsqn6RPPfDgsho6FxpMgJRBHzw@mail.gmail.com>
Subject: RE: directory lease handling perf bug
Date: Wed, 9 Apr 2025 11:16:04 +0100
Message-ID: <003c01dba938$67616360$36242a20$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Content-Language: pt
Thread-Index: AQHimy/QWz76CesrGdFbLVuNQR0v4LONOgXA
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
From: miguel medalha via samba-technical <samba-technical@lists.samba.org>
Reply-To: miguel medalha <medalist@sapo.pt>
Cc: 'Meetakshi Setiya' <meetakshisetiyaoss@gmail.com>,
 'Enzo Matsumiya' <ematsumiya@suse.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Could this somehow be related to this post?:

https://lists.samba.org/archive/samba/2025-March/251148.html



