Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE6A35F5FF
	for <lists+samba-technical@lfdr.de>; Wed, 14 Apr 2021 16:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=f+tZA8j4gfTSEZK53J6uDjWt5bH3GCZnjaKhWl220bw=; b=Kwn9WV5RGJdHbpv9h84KmsYqqJ
	6Aa+xMEWxw0RfPDxO+Nw087PEO0XhjfzdZ5RRbFzhAFUu2hGUgh29vuYhsTDaEHKtho978LhpMAA6
	HspmytjWNSDBE2REZ5aK7+mvhIMfzDb51mQDC6ffD3S8dplLccnrThExUh7YNxqHvSnuHrLrgkQIh
	Wy6AwLe+BAqMcvuIBa7LBsr/5zeVpjXv7Eh8wU/xKmWtsmxhFnK6UWX4//UXX+u4zknsXXW7ZQWyi
	MoymjFk2V20D36h6vG7yKKT6bSfpT+y2R/12d1R7zfV1oL4sD14s5+USJBBz8ptPCb9W+ExurXVAT
	VTSVmUjg==;
Received: from ip6-localhost ([::1]:48144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lWgOp-00BKPZ-6B; Wed, 14 Apr 2021 14:21:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51862) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lWgOj-00BKOM-PD; Wed, 14 Apr 2021 14:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=f+tZA8j4gfTSEZK53J6uDjWt5bH3GCZnjaKhWl220bw=; b=Grstg05/KixnCXgUawwjlFRodX
 2u4iocFAVh+ePLw3X1QTwSW362hCN4OKQyDFpwoA4+ySmDWnVZAdvdhDmv7OmrROcNg3dEQv8N3pS
 hOhb6CZG6SC+WDGUVjdEjoH8hRXBcBBdhEPtpjQ9ZCoPJ5AYpmonX4Yf1UOJYkb8P6eZfR2ln3QYo
 X24zST1ezs1elJng9Ufv3srYw1HcwGHUOFHwRrJyU2d80zuSGDRmly4mfd4BD6rYftphihmAAlj1O
 WNvCcaUGaSJKWd0A0mDfT9xiWMRq5tdXKY+7+T0S6KPQfE3CIhmu/1D11hRATv3JOMS9JD0yCp5KN
 PTtxqd0Yr6GarHZXlOFW+/WyVlssymZMxqnCRG3tgPQ61wzVrtPLNbpAT3n47dgQruYPm0dnVvgMt
 WqCA7f6vOrvRjXVn8L9cpNZTvTn6FYH3NL1SWalNcI6RfQKlIz8qEdxVAeS7D8yi/bQUG+5AZbHHm
 k5zJ5Zcn2gXGmfzaR0OLE0zW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lWgOj-0002vZ-9o; Wed, 14 Apr 2021 14:21:41 +0000
To: samba-technical@lists.samba.org
Subject: findsmb: drop it or reimplement in python?
Date: Wed, 14 Apr 2021 16:21:40 +0200
Message-ID: <1785578.urSO1NLUhl@magrathea>
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
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

is there someone out there still using findsmb?


Regards

	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



