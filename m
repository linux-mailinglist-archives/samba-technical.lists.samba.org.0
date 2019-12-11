Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B384A11A074
	for <lists+samba-technical@lfdr.de>; Wed, 11 Dec 2019 02:26:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xJsleC8WpIVAV3azUz7G/DNA4sxNKbb0D/j6J9ZES4Y=; b=EAdwuxewNrtIyCOFbdkfsZRSnu
	Ns+1En10zMaZnsmwUUuHSoNkS8bkf68HST3iS6TNErvOztmyo0CxvyCFwqimK0qTBWgqokPvg5pGh
	QCqxJJQwkgbC7PfgI8jHFgpWX8e/W2+B2J3RPDwsOwpAW6UCPK9hv9CYOJRZltAAa2edycInk2crZ
	QFvtQsHDvldrun9v00u1gbX7u7l/xDxC3yw1jFVw2HAtsoQEcJ8rmZn9Cv88Dm+vzw9SE6FX33kKM
	IEIbdgL+AASJUP198Lg13vxfz9giEHViYfNa+8ajcwakNIW6HsPwl1qT4t6bw4AeYysg0MGGRTJ0S
	gaC9LKFA==;
Received: from localhost ([::1]:45060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ieqlS-006oPg-0u; Wed, 11 Dec 2019 01:26:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52476) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ieqlL-006oPZ-J2
 for samba-technical@lists.samba.org; Wed, 11 Dec 2019 01:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=xJsleC8WpIVAV3azUz7G/DNA4sxNKbb0D/j6J9ZES4Y=; b=1zVyvzGomgvm2Iml8LgWg6Xnga
 p6ki5JAqvAxte0kEAp9Hb47Kuqu+4eMkHCwa6nzw4W4rlH9q7RfB2I8Sk1ujNlWucobnAzmmG+NKZ
 2ZE8eJydZplH4z4aogrklqtJFj3xuSPEn5cfe0iQvCi7cL5jE+t3Ami5iR/ScdqlAPpDc7Lg5ll94
 cxL/aOkCWaS8IjiJK/crQ6O6cCCZQPk39ecrhayQ96xR3k+hA06h7tk7K0ep2K6X60ecd/1k93k3C
 JDd4NN1iM+cKmXmiF9lO+vjfXGm+9FjpujdI9lWCxAPtviTfjDOUFU5v04yZaZmP5OSLy9mRqoGW/
 Ghp2lETqKtg56Or6WG8YR642nkpHfPOV8ZGbu1/bb4HvNVrsqTlXkd1DHH0VsecYO1aLMkf1fHnKW
 GnXe7sTpocJ7zscqMkjSy9V/Whdb/SZhSPKeWWMgg+Zs5f6e2/AE1XsiGenKHO1xN0mjfiQQjHVtF
 gGgyswlNRojxabn/hnBBbL5e;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1ieqlK-0007hW-FB
 for samba-technical@lists.samba.org; Wed, 11 Dec 2019 01:25:59 +0000
Message-ID: <e86313d7de869d8f9e56fc636183fbce2acc0116.camel@samba.org>
Subject: Going, going, gone: home-grown crypto in Samba!
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 11 Dec 2019 14:25:55 +1300
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I wanted to say a big thanks to everyone working on removing our home-
grown and imported cryptographic code in Samba.

It was with great pleasure that I finally ticked 'met' on the "do not
implement cryptography" section of: 
https://bestpractices.coreinfrastructure.org/en/projects/200#security

We now just have AES-CMAC, and only if we don't have a recent enough
GnuTLS, so this will go in time.  Perhaps even that could be
reimplemented in terms of raw AES using GnuTLS, I'm not sure, and I'm
not sure the change is worth it.

(I realise we also have MD4, but I don't count that).

So a big thank-you in particular to the team from Red Hat, I've seen
Andreas, Issac and Günther's name on quite a few patches.  Thank also
for all the work done adding tests, I know that has been quite tedious.

We should make sure to celebrate this with a WHATSNEW.

(We of course have crypto code in the imported Heimdal, but that is a
different matter.  Someone truly brave could try and re-implement that
in terms of gnutls...). 

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba






