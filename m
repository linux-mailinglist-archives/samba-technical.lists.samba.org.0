Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD6C6C6D21
	for <lists+samba-technical@lfdr.de>; Thu, 23 Mar 2023 17:16:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MxTId67olSZYYv67pzijLESbCPawf2aOisi0b3ONNWQ=; b=zesyTVvoPaZSTLAu8762V7roLS
	AoAMm7HSFV4CmSi4pLG2qmMdCYHoaZeybOLWVgEMCJvzucuitOFXtedMQ7s3j2M14wCmtwNy5My/U
	tv37GOuWApgx/wMT6WAJUA9/tMxz4PoAbU5Jup2LGXu4Kz3dgkQcc/9yOhglBExFevTvEi2JFKmJ6
	wdV7HbcIfFtK5sZZH2FYBLH/oAXg8NMjlC6jBA2RhD9bvwPz1Ll9ZEKWkVsKk+r40gEi4UIHWWaXB
	Eh71fHiLu5wzOa4QvhzXN6VcdCrklxoarXkTOiHCKWLQRv0Ru/fxPdh2FjXSWpRxdSPoFzIRX/5Jr
	eqduZ2eA==;
Received: from ip6-localhost ([::1]:32892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pfNb6-004AI5-6Y; Thu, 23 Mar 2023 16:15:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50280) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pfNat-004AHr-NP; Thu, 23 Mar 2023 16:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=MxTId67olSZYYv67pzijLESbCPawf2aOisi0b3ONNWQ=; b=seXC11Xm6q/j91XJLSOfgilGet
 YFanbClzbHQSlICsNjXJaSnh6R52B+dOdTLASQoNbhrDIxpLGomL8jfT8Vg/bOdxGJNDpvgGukqJ1
 kLLJ7jhpkdTA/mLqybUFtdWOJNug1EfPON4/4iUnEZlQWlFbHhioB3rfnQXr8pdNOcQOWeHH0Y6Vj
 B5Uz+0B6uANaXt2NFb4Sc9HZoyx299XghBFNjMk7RcgO2Hb1vo8iK5fPfOscLnYeT1gzAl1iaw8Hk
 xCipN2Spkr3Qgk35WjIG193S7HX+lg9ePDU5qbBq/8m0HVCSQFVhi8CuSns4Cx7F1W1qAU6Haoso3
 bJzQZDZXxYPDUbSONPBg8Ww07VUoSTuWAaT1EeKcU3eWnQ8eVBCaCzN2zGDxSpLY6rIvVl8rMWkia
 sn1w3pLdaFBRP+yLmDLxchRfzJ0urzc4kLo79031L+TnOuPR4owOKo221TloqwLEO/IJNDDk/BDH4
 Vvo0wAeGofom9s5eyKGdLJq5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pfNap-00551Q-1E; Thu, 23 Mar 2023 16:15:11 +0000
To: Alexander Bokovoy <ab@samba.org>, samba-technical@lists.samba.org
Subject: Re: mit-krb5 and heimdal binaries
Date: Thu, 23 Mar 2023 17:15:10 +0100
Message-ID: <7242311.31r3eYUQgx@krikkit>
In-Reply-To: <b9e0eed101e224500c3e665e8505052fc07b6501.camel@samba.org>
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBgbvnB76vjgkq/B@pinega.vda.li>
 <b9e0eed101e224500c3e665e8505052fc07b6501.camel@samba.org>
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
Cc: samba@lists.samba.org, Michael Tokarev <mjt@tls.msk.ru>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 22 March 2023 01:54:06 CET Andrew Bartlett via samba-technical 
wrote:
> On Mon, 2023-03-20 at 10:39 +0200, Alexander Bokovoy wrote:
> > Indeed. For the record, current set of tests not supported by
> > 
> > --with-system-mitkrb5 build:
> > 
> > 
> > 
> > ----------------------------------------
> > 
> > $ cat selftest/skip_mit_kdc
> > 
> > # We do not support RODC yet
> > 
> > .*rodc
> > 
> > .*RODC
> > 
> > ^samba4.ntvfs.cifs.ntlm.base.unlink
> > 
> > ^samba4.ntvfs.cifs.krb5.base.unlink
> > 
> > 
> > 
> > $ cat selftest/knownfail_mit_kdc_1_20
> 
> ...
> 
> The bulk of the failing tests are in the 'common'
> selftest/knownfail_mit_kdc file, the file you mention above is only for
> tests that are different between 1.20 and prior versions.
> 
> $ wc -l selftest/knownfail_mit_kdc
> 2207 selftest/knownfail_mit_kdc

A lot of those tests fail just because of different error codes returned. They 
would be easy to fix. However it is quite some work to go through all of them 
and check if it is just an error code mismatch or something else.



