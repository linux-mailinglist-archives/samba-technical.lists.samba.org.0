Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B298A3B8BD9
	for <lists+samba-technical@lfdr.de>; Thu,  1 Jul 2021 03:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=BB2FevKmAg+5s/aewkIeGTPSNZX2Jmupv3q0OrtvK5A=; b=GttzScJEaymZ+l8KJBjdkPLeSz
	puPYSoy8dNtyT5EbuuhOAbrvI5vOiCLX4InvaTZQgUWG0WIrJHSxvca03xbK4G8zxD/VRydioFZrY
	pFJ6EVRXgqaoEorzq0aPmHmOrtiLG7L41/44OG6Et8KrEHqED2ZqPR/Esods3wMmbmEdd09SNyZXb
	lhWeiQw+LuXRT+OtY0HE5SiPOobpR0O7F2z89eVmwGb94/NlO8fdy7HyWk5t6yuDvf/JcLH3UzXt2
	PKdL/2MVZHRd/XPte/iInvvCCkSkc0jR4ITLAbTCfzMqHu9VLGLU0U66Jh4JAn9Xs9GBQN2xnZW0A
	kC5Ew4EA==;
Received: from ip6-localhost ([::1]:32962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lylw8-00BMl3-Tc; Thu, 01 Jul 2021 01:56:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lylw4-00BMkt-5H
 for samba-technical@lists.samba.org; Thu, 01 Jul 2021 01:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=BB2FevKmAg+5s/aewkIeGTPSNZX2Jmupv3q0OrtvK5A=; b=sebCy0fUzi/T3sZJUv2sttSKb8
 jy1KS4G4ntC56dCpoHAEInCyT5fsf0+ydY4cqvuYY6hLGiG8AuymgTASxw3C01F2NjwatWHkmn95F
 geExYtx2CRKUq5Yr3JfyyLa/bgez8Ylxr86ySoGZF8DZasBASxQEkSCn4jYV7DICKwyiyZtGMxtIE
 QoWs4bmXZTFAC4y+cW7V1OvirSTGYi6glQpeOUpq2M7Za7xA1e3aSNSgod+GBU6ITbWV4VNVrcGNR
 x/2uVROaiN+xdfd1SGi5gUTtpX/cVtC+utZ3f7kushd/EKP8REQgN/ai7Zmz+RNHsPEL592k57LeP
 JmH6f5tUHzjUymkeITsUCXYtdGwbv5FnCbfDCp1TXW6+EvGHxEy6GQWV5ssmvlKooIi3xZe1yux7X
 xwSLDkOzWe0kl9diwOKuxVnMtQbdBj8UBDqcfM6QXEzTtiN4bBGltFBOc62XqWZutIviKMfGTUDjF
 pc6MOj9Dv2bJG36D0QGMh7hG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lylw2-00035K-Na
 for samba-technical@lists.samba.org; Thu, 01 Jul 2021 01:56:11 +0000
Message-ID: <e95c3ab28e222f9e5edc8eb6993cd34fd862a3ff.camel@samba.org>
Subject: Given PrintNightmare, should spoolss go the way of SMB1: off by
 default?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 01 Jul 2021 13:56:05 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

G'Day all,

It seems the current keep-the-sysadmin-up-at-night is a thing called
PrintNightmare (CVE-2021-1675): 

https://therecord.media/poc-released-for-dangerous-windows-printnightmare-bug/

Hopefully this doesn't read on Samba, nobody really knows the details
right now, and if you find out please mail the Samba security alias
with the details of how and we will deal with that confidentially.

But the public question I have is this:  For Samba 4.15, can we set
'disable spoolss = true' by default please?

I love printing just as much as any other team member (joke!), but we
have a lot of juicy code in printing that many use cases don't need. 

When the next printing exploit comes our way, it would be nice if like
SMB1, many of our installs have it turned off already.

What do folks think?

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


