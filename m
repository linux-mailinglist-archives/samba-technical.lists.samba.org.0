Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8ED129F0
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 10:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QALynqiZUbKh1ifBvCryY5JwC+OGerPj29S9LcWFMC0=; b=cWWAoTrSDlHVAqpABXj4TB0ban
	6S4yQzqTAP30jQLYbH3G4ZH1c3HMwnjF8L6WZHkrYQsgIZWXgJ0iphV4McQXMwY4p0GdGRtQZ8Crt
	Zi9khL0YTdGsBfLPKJlQyYJbTctAm1hxFLqpoL30K6jTGmSiWp91vmcup9UxhXCp2b8APDO0AlfVV
	9tgrCJOcHqD3yRvZqv0Uw9ip6fL/lH1IryNzxkVL/KLBuXSrZ3t/M4ka3p7yCrxn4keh9RaHcKA1L
	uwgFXRST3qD1CPnIjxpW3WLB3SuBpFmBasrNtANNGGoES85uNIRSupCNI7auxqeg4Jrje1Y/SKAjN
	camwXWQQ==;
Received: from localhost ([::1]:36266 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMTcI-002DBJ-38; Fri, 03 May 2019 08:32:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:56142) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMTcE-002DBC-3Y
 for samba-technical@lists.samba.org; Fri, 03 May 2019 08:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=QALynqiZUbKh1ifBvCryY5JwC+OGerPj29S9LcWFMC0=; b=Ze0KjHFHbtzg9pmwZZdaU0ZN6T
 hnIG/QNlmmLVi7afCkdZCbh7LrmLAba7cnVQAiJa+v7LJkXouJ7FuQ11vg4doLDLmq4iXtDaRdvl4
 oISTfc/xC5rwbo0I6P792WYmYINhHsGgt0SL4sBWEzRCiPmwCNfXsuf9nQn4vM6X6SAY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMTcC-0001GR-Sx; Fri, 03 May 2019 08:32:21 +0000
Message-ID: <1556872337.2951.50.camel@samba.org>
Subject: Re: [PROPOSAL] Evict zlib
To: Alexander Bokovoy <ab@samba.org>
Date: Fri, 03 May 2019 20:32:17 +1200
In-Reply-To: <20190503075152.GC5460@onega.vda.li>
References: <1556868232.2951.47.camel@samba.org>
 <20190503075152.GC5460@onega.vda.li>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Fri, 2019-05-03 at 10:51 +0300, Alexander Bokovoy wrote:
> On pe, 03 touko 2019, Andrew Bartlett via samba-technical wrote:
> > 
> > It was recently pointed out that unused cryptography can be a pain
> > for
> > users of our tarball.  I also recently did some work[1] where we
> > documented the location of cryptography in Samba.
> > 
> > With GnuTLS being a requirement now, I think zlib is also a
> > reasonable
> > requirement and removing it would also remove some bad and un-used
> > crypto from the tree.
> > 
> > What do folks think?
> +1
> 
> There are four places where zlib is in use in Samba:
>  - NDR compression/decompression code in librpc
>  - DRSU replication code in libcli uses CRC32
>  - CRC32 use in gencache
>  - ntlmssp signing code uses CRC32 code
> 
> I think this part of zlib is stable enough and available widely.

Thanks.  

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




