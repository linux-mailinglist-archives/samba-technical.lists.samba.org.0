Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FCA1E6CF7
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 22:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pgeYCl9KcKCMr1ktseva+4sz62WU6yq7QKFWYmvWfDs=; b=MS3MHl6SHbu9jD53fMySrbAomW
	exgl/zCHlX8CoOOI6k1G1adRTdHM9C0jeronI/6XWBmHS5ykouxII0h5tgjkWdrXAFTG3m7T76yX1
	CQj9wAZEP+hgDJsWwb6fUOhzdQTgL1K5VT+qkX91f/YO86ZMfhjW3EQ9v1GXGaLH9ZZJ1+ZVsTxoV
	ln38BNlzQdANjx6TxQ8EFQ3TqMWYC0OEjDUYJJLGcP2tb0G4xilEby4IF9KJbz/eAx9Cql4hZxvC9
	tp7pRoZzjaD2VRkTwKaFHIk1oO58EJnwpovjZNLBl8io67bu10iNCodY5p9MsYTmOItEp0lsaxG8s
	ya/tdXBw==;
Received: from localhost ([::1]:35668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jePbe-006Fp6-5q; Thu, 28 May 2020 20:58:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62688) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jePbV-006Foh-Ph; Thu, 28 May 2020 20:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=pgeYCl9KcKCMr1ktseva+4sz62WU6yq7QKFWYmvWfDs=; b=NiYcdXsqvYKiwQbP1wTiHErMYm
 7rDypEt0INy1RXAXh9QbkBbDgxHfeRay101vW3J7wsLjUY9QOexJUVUe1E39f5Yzt+9Q6DmRYAg6c
 V29FLFm6A4njb0F95s4RbfFrI9fbi/dr6os1waHHV7bhoWWQnvBLalSyfWNpeTF4FVuPdCDRSGuC0
 9Cs03IeufFk4yA+8fnIQMuYgWeONv07Qocw6TPlNLFsWWUy7FY+fo52kaNMiAcZlwFGswNyxdG1Pj
 F4kGVAs1tqtK4+7aV/DnyCZ/UtAWqM+hui/Oj8qMSKy2dcoeEOgzs+rJvGBkoVO1Y2W6tq9n5DbZ3
 sjwMRuyOjcznvsvNV9Wt2FG4lTjjOxJepgbPQe6Z79fOIMQKGSFSu8fFymubL86Hvy9AORlH9btq0
 r2Ypb9Rp6m66gHYWLMe+fHDOi7f89faoc4Mdns2XMz2im28Mv/H1brhNFVXxbK0CeKZx+alxR6y4u
 C+FYJOGAJRwETAMJJ8xIjMLY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jePbU-0006p0-Tf; Thu, 28 May 2020 20:58:17 +0000
Date: Thu, 28 May 2020 13:58:10 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: SambaXP just (virtually) wrapped up.
Message-ID: <20200528205810.GA17159@jeremy-acer>
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Just wanted to say a big *THANKS* to
everyone who attended this years virtual
SambaXP conference.

SerNet did an amazing job of changing from
the usual on-site in Goettingen conference
to a virtual-only online event.

The talks were recorded and should be
available soon (I'm sure they'll let
us know when) from the SambaXP site.

I hope everyone enjoyed it, and now
I have a boatload of work to do to
catch up :-).

Cheers,

	Jeremy Allison,
	Samba Team / SambaXP Chairperson.

