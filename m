Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E7253AAC
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 01:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=l9y9cXRySCvtccjaTWLGaYiiUJ//pBLVbfVbFM9Jitw=; b=Wn1IpU9/Y2iBVXnoF7xtCwlTLv
	DE2ODKgPsTWFCjSfiMClbCJyu9GsUEP4GVfqek1x3GJQzY2M5SmfbpWCMPaLkBE3xsq8NM6We7vEL
	UxNv2F+Aic6ciJ0LprnZc6lm8AZHmvzMw+Im4WelSUbtl78QA8q+DeMMYgIeLc0/LNDiF1bzwZRGm
	VdoBcANA6/F/U3rdqhkI2L6yR3BePDOChl2GYtiDWmiVecTURkBzEe7PAm2+H8nJQ3xE0F3aSLNgi
	dnJQyO3gaxA0hs4w8A3VtLu5+WuPsKv8+gqvhCx0O1jeNRxwZfAk25ovS5bW+yWR262fn+Wnl6POo
	+NyVA1eg==;
Received: from localhost ([::1]:56004 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kB4vX-000ov3-E3; Wed, 26 Aug 2020 23:33:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57682) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kB4vQ-000ouw-LA
 for samba-technical@lists.samba.org; Wed, 26 Aug 2020 23:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=l9y9cXRySCvtccjaTWLGaYiiUJ//pBLVbfVbFM9Jitw=; b=Uhc4hwHJZ3ODsUL1vok+9wSG8B
 Qqm51U/hXUD1f3Q5e0ra1tRJXZ1cOhXbsdIc/ALBBooKcUY5XnUIVZjkFfHdSff8QTyWAou3amGCz
 qoTZZqx1gq7IBqMKs3MvbLi2i2W65lkoPIEmAHY02RS20TD4xiRj7fa/kJdNJryN5EZnd9B6+xBBR
 1yVVQLapaCN6ot+sz8ekAy0rLAhJuaaknCeR3v74oHdjaP9K1MVuLrPo3I1rNDDcWvnIzn1WNnWHr
 FoVYkAcDNRTnLzYlhLhdmrhwpVivWp34bcu613rxHOrG/k4e3HrAsTcEFotiY2sks+DJk9YG12ddV
 SMyRNL9XBj1nM9ITW8S7m2K2B5SWxNQbsXnZK9IAyYXRCGrg7BeLjwyLPTq5saT6G4NnIL+/2gyWY
 TDbZsQeVBQXJCVLQg/9kx27LwQMSKaLIUFUXE2+mADKIcKAhcjczn3Anb8iOEJeasI1IP0jQCeDxW
 4yfXqxtzcWsbEzq2g2LSpXTW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kB4vP-00081B-EG
 for samba-technical@lists.samba.org; Wed, 26 Aug 2020 23:33:52 +0000
Message-ID: <c1dcbb2f7c11b0e42c3c078d7850fc0cf983e3bc.camel@samba.org>
Subject: oss-fuzz back working
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 27 Aug 2020 11:33:46 +1200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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

After a long break where the build failed for two different but
compounding reasons, oss-fuzz, Google's automated fuzzing tool, is back
building Samba successfully.

There is still more to do: We still need some seeds to be given for the
fuzzers, so far all the problems have been found by the painful
evolution of "" into fault-trigging packets.

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




