Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC7E58740
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 18:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Arol/IiUtUgx7/Jh0XEPvqZrfpR9euEhKDB1SzEHBWE=; b=6T7PT/Sipno5/+ok+5hRDmOJJZ
	SbRQrWSsnm086LHD15ucid/3sA5b2Ei1TtQN+i0C40I3XqcJteJHu2DwyCNLWnjrq0m7a/S2Y9PC/
	+SgTUC+A81FGXT2wE1FIEX/zQmN1KOD64sHrdYxH/uJwKANLzWoGth2FeCPFzYvnNO47jiBx6uF2s
	2EYv/RoHLpybIZtvBbDC5Nn8YOf8peNLDUIrMRuFJJ1R23O3qLDk3RSZv7og9KUOrYKmZeLUzWIST
	uQnYgY/JjWuH3b7lNp89AWrSIJpl3+WOp6SU7P5X5eQKUweve3djhP5RQb5YzZwJmJP5UbaEuh64E
	qUqF/m2A==;
Received: from localhost ([::1]:49752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgXQS-002Db9-DM; Thu, 27 Jun 2019 16:39:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42934) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgXQO-002Db2-85
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 16:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Arol/IiUtUgx7/Jh0XEPvqZrfpR9euEhKDB1SzEHBWE=; b=lULzAZwHA30bJ2oCnF7oC1/irC
 BimTso7KNBEwaCv4SRgHAKDwC0gIC3Kyzw9MZlxAT91rwe5gIeVEZjGfFpKotT6PfA0vG7/0+7LIv
 xqTBNFnfeI8bqNc64VrCqjtjwwkNc0+/45UES3kyWjRRBpYXhHosbUqqHmv4MU6DOp6U=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgXQN-0007js-78; Thu, 27 Jun 2019 16:39:03 +0000
Date: Thu, 27 Jun 2019 09:38:59 -0700
To: Amit Kumar <amitkuma@redhat.com>
Subject: Re: Can we RESOLVED/FIXED
 https://bugzilla.samba.org/show_bug.cgi?id=13564
Message-ID: <20190627163859.GD14078@jeremy-ThinkPad-X1>
References: <e002d5f9-0911-3825-1859-07ffc598050f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e002d5f9-0911-3825-1859-07ffc598050f@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jun 27, 2019 at 01:17:19PM +0530, Amit Kumar via samba-technical wrote:
> Hello,
> 
> Fix is already present in samba-4.11.0

Done, thanks !

