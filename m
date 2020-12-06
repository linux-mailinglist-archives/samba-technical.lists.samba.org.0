Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD32D07E0
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 00:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=zIqo9FHjUj4lmr2VHnC3yrQ62wg1Qpxp4VKUGNqh0lw=; b=ZNUumkyjAMptJW5teiqcxfLSAd
	RSUY6NIvXcJCzbQXpgLP1Wq4EJyxglkArkntrhuu4NfpEsrsGdbyG0I8NKmUW4JlvfxsplPxRcGdU
	dDzrFlzeHLzoXHmz59Nj4uiksvN1TJJYnQNqIPTechYPLWbhbJGW3PtBIM8xhwmUy22NBGInKDfwG
	EwD2QTcPDTWTpJpPMW/f3GE1O5qg2DfRJlRSGP6O6dRKpacuxRh4e8gnpqGI5QWqlOq0TFruSOjfd
	TSLIod+wtUcirPpFLNfy3tbDK5GRco4TPg2wJVj/mf2GfkGW03P3Thi+Yffdm0AaQuOQW/Py3oyPz
	44L+exjw==;
Received: from ip6-localhost ([::1]:33378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1km36p-0002eM-Q9; Sun, 06 Dec 2020 23:06:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50430) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1km36k-0002eF-Og
 for samba-technical@lists.samba.org; Sun, 06 Dec 2020 23:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=zIqo9FHjUj4lmr2VHnC3yrQ62wg1Qpxp4VKUGNqh0lw=; b=JaJaGjVOzEIfn3oGQpCsZ2HHbc
 fkAaoexSGspWF9PrusFRsQrx0n1AzbrWofxUCMaRCFQTLzf+biuZkYOD87Z7v9G4WXgZt6crht/Tv
 Cp2qc5kLp5uj3z5anSXaM/dPBLtiUA+S3jbwwezc6RhE+oeTeNipuHbN1iZ/12pQev6Hgbu2U2em9
 O/V3ISwhu60+kg5Mj6XGOaQ68VsfM94vZxaJNNaNVF/yt4rEfZJ1bGwWSVA18F7Y2Iwiy2I5Jvc7s
 J/p4cWYQfQyyiTf2K4ZR/+/qAdHHO5kB6qRh5S9UQidIR32PktzPKlSOQGvKbZUCFQiXIX5KozAX9
 XgLrVpyIOzLAXE9un/rLYQX8J5YAodHEJNboxWrBXGT9rn/91U6UJOWofO499QTPsUCEFBkwtkFDE
 pjUN3+GEzm9US0IjwuBhLF8pQO9kApqGLZ+lvAVzkeBlV9fADOZ881EY891VcAdzGz8CekJsJHw84
 S0e8lmp14eV3EcZgMV7UEtur;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1km36h-00076W-SD
 for samba-technical@lists.samba.org; Sun, 06 Dec 2020 23:06:20 +0000
Message-ID: <334b390ea3c64631b9da07c10a6f636aa3079f54.camel@samba.org>
Subject: 20 years doing Samba
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 07 Dec 2020 12:06:14 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2020 has been a strange year for many, but one additional thing that
has crept up on me is that I've now been around the Samba project for
more than 20 years!

I wrote some thoughts here:

https://www.catalyst.net.nz/blog/andrew-bartlett-20-years-samba

The earliest patch I could find on the list is this one:
https://lists.samba.org/archive/samba-technical/2000-September/009729.html

It certainly has been an amazing journey!

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba



