Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE10E26432E
	for <lists+samba-technical@lfdr.de>; Thu, 10 Sep 2020 12:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=EbZkiDPutZIQPILRzod+qICIaNKGhVpBo3pKbuFF8kA=; b=lA+idYYeaIjW/+MOZ8RElXALQq
	Nusa73K/m8+8Xvqqc9nUvQ4nu/0AfdApsAxHtUoSHQ+px1AAeArUsE9WJbHkAtKaoNvU71U/86Ozb
	olgYwcRHy8/iQ8125JkgoBvc9t2hyfls33zMbuv7+QIhYfgV1RrLr67+pUc10yiw7/B6rQ7yw7NQX
	Wx2Bn85MnasaBnzzMMWrJ2PfMT7DiyvrMCVt2SeLuXpyTOJA1FQZyCbFqwSy6etDnLh0cMsxarnEX
	GYQyCH2DnR+43eA+AcKE2ZewBQS3KTnv8ziDrkkJgbF3PJ4iPZYHGZ2pomnwczUMHLaL2jUd8wNF1
	WXQlibJw==;
Received: from localhost ([::1]:56458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kGJQQ-004rpn-4B; Thu, 10 Sep 2020 10:03:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37600) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGJQL-004rpg-Jf
 for samba-technical@lists.samba.org; Thu, 10 Sep 2020 10:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=EbZkiDPutZIQPILRzod+qICIaNKGhVpBo3pKbuFF8kA=; b=dibl9oWdow2ZBe2W1GaeUqkmjG
 sL8VEcNnUz0c82sYZB4YpcDaqJ4i48bg4lA8biXB4+OqrRb7HxX5wunU+Vlir5Pp8V/IIQbLuYqkw
 b73ztP3QWFn/qqN94fp11gU0YKg1JOof8M0qD4Wn602qCLl39JZ4ctikOfJnGDFiOQCiA0xk8u5mI
 9wc7ZFFeuakaknfmnc6o4ecJGMnbCi1FlvNpCxdiNNmF6PT4kW9uW3/f3SHAbdHXQxYHsph9PsV/S
 JFD3N2j92ua5TfGM9kPRBV8ILWv3e4/zlxdLxB9rAuVCx0mUbhbXT9vQSlRjGDdyU80b0KZ0J+yQQ
 q8w+fVB1kADj1D8GcrjUFQv7qXRNY8pgkTC6FUUHeTffA4RdvQveZzInH6Bf6ipYsYyZlbOwE38uV
 fxkBwI5Z6yEbz4TrO59nCXZHT81oDi5Z62pWqq0zPVS6sn+omOYmBINYrY66uy6eNMAeJYfOcp4VT
 jV80yV1srjWwNdDNIKV3i9O3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGJQL-0005Hd-7o
 for samba-technical@lists.samba.org; Thu, 10 Sep 2020 10:03:25 +0000
To: samba-technical@lists.samba.org
Subject: Where is Andreas?
Date: Thu, 10 Sep 2020 12:03:25 +0200
Message-ID: <3112634.7DAZDHbNlT@magrathea>
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

Hi,

tomorrow is my last work day, after that I'm on parental leave till October 
19th. We will go to the alps and the baltic sea to relax and take care of our 
daughter.

If there is something urgent and burning, let it burn. I will clean the ashes 
after I got back :-) ;-)


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



