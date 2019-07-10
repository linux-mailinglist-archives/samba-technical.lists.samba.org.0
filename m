Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E812164ECC
	for <lists+samba-technical@lfdr.de>; Thu, 11 Jul 2019 00:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jwdJl6UM4H/80OlW5YqUNn/S/vB+2SRqOL9qlMPEpv8=; b=TWtdc5Y2rLg276xLha0q5CrptI
	aSrW8TGFv1J4550py67zFHIjfsrwIIBsmBN+ByE2uW7Bhk42K95KhYFIzfjxyJsAcH85i+ooxmz21
	PYFJ3oDpaXnZQOHZYQwG8/Oxr7MGunk0KIX/FsYwgY3qXT7+0RH6kGmSljbc6Dl4aa4djBijG83Mw
	b6RO1egA7XQ9cOOeEvwm3DGucsAq8NJs8qV3kqC+PbucpRYud6O3pDkm4lkYu9Fh6M6m/1VDirNjz
	YyOcH+Ao0JUw03HlHaB7KiPthBsAnn8ek0ZbcrhU/R4+VOeD+ZpJvx4WKov7Qki0SLo4YqDZY5Wnk
	mF+03mgA==;
Received: from localhost ([::1]:62952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hlLRD-006Ny0-KT; Wed, 10 Jul 2019 22:51:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44454) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hlLR7-006Nxb-Cy; Wed, 10 Jul 2019 22:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=jwdJl6UM4H/80OlW5YqUNn/S/vB+2SRqOL9qlMPEpv8=; b=hh7TEGm8wqBqzFb5xidpTOJzbW
 B76Boa9KdvbJR+IfPKlY4DZdXYmrhvE1psbCqOHhRFasgmxxo1tmRfVC2vfYA57XFhn5506b8xwmr
 UtMCIbNAuCcZl34h23rUsJiStDenlp5HG3ohaCmhP3gdtbON+t36iJN//ZsPf9H1D7ro=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hlLR5-0002fW-Gl; Wed, 10 Jul 2019 22:51:39 +0000
Date: Wed, 10 Jul 2019 15:51:21 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: Turning off SMB1 make slashdot and theregister !
Message-ID: <20190710225121.GA142072@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

In some small way to apologise for linking to twitter
yesterday :-).

https://tech.slashdot.org/story/19/07/10/2119238/samba-411-removes-smb1-file-sharing-protocol-version-by-default

https://www.theregister.co.uk/2019/07/09/samba_sans_one_smb1/

