Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD5A1750E6
	for <lists+samba-technical@lfdr.de>; Mon,  2 Mar 2020 00:10:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=LC9QHvk/WMA1y2EfeB24Z9Tj39CiORd8kg4l7zmNwf8=; b=oLZnECDxYIY/tl3X2hxO8DzE3Z
	UPh+85XVeZdEai+gxB1n2LBxJCRTPLyhy5B8I2l/boU1yJ51pu+He/R5DqUJeex88P6iVB4uixZej
	33Ssz2z072A49sFnLO5HndT18OEnySSrRo2nUPpS2mkB6/4L/lNCyz+FjzkvSnaDL99HfNWLt8z+k
	kbZRRh+EqRzh0jkBpfGFxJlymJLIE8pfNlD6ddQipn3oVPhj6RTpNGNQs4DZhJUO8DOjMADyj87dY
	Yu5/eMWYwO870e8mNAH2DcBNFiCooMrMUXUqkjZiwv7w0mjptkwO51QPbw07RIz673/22RPtAxVGW
	V4vw2qrw==;
Received: from localhost ([::1]:46886 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j8Xhv-00ELs7-8S; Sun, 01 Mar 2020 23:09:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34866) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j8Xhq-00ELs0-B7
 for samba-technical@lists.samba.org; Sun, 01 Mar 2020 23:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=LC9QHvk/WMA1y2EfeB24Z9Tj39CiORd8kg4l7zmNwf8=; b=UD6uJ6dod94RhB9ZymHyatugq9
 wCuyzoYw3uDEdftxD7gWEJtripHJ1fpsQB7+WKPvm1agcy1Gr3uCSNarYt3tZ6CsPdMjNTD3zu6js
 lvziGR+gTyepLW/+J1EZGv1OGKLLuzAkXF2aHh/51nMmbLetXoavf8f3DKCGrVCQaLfLE+6pO18Qf
 lMb67UQybPwfxUCMBRotzp6wAMntw78Zvc2gnfVel1vvCZMfVw/1T1KtfNgVqupslBzxfUN/jsolp
 86ewFOoxSyDSgdxVyejeL6BKHNJLnL0DLNYPlc9GWZxT6BTZjqcHIz6dB6TtiUPgoGjSAv/9xKFks
 MTywA78aFg0a6lBbwYBq+m6z6D8yZH52l44/kLCB+SEx2Yj8IqJOWJUXnxGswqPt5Jkq1di5vF2Ao
 XZAd5HBO6nLrM3qJlHTbBwSM9S/Ymrvq5C+yq6rZL251Ys7v1f/fE2aOgDy5luhdSxRC5CYPz5V6L
 1G7/74baQq3q//xFCO4z/Vss;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j8Xho-0008Qi-7d
 for samba-technical@lists.samba.org; Sun, 01 Mar 2020 23:09:04 +0000
Message-ID: <e72619e6e317195481e7af331204fd6b0c3956ca.camel@samba.org>
Subject: Samba code coverage improved!
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 02 Mar 2020 12:09:01 +1300
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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

Recently, Gary patched Samba so the code coverage build finally
succeeds, and I changed our CI settings so the run on the main
gitlab.com mirror repo gets a full CI.

This means we can see weekly updated code coverage here:

http://samba-team.gitlab.io/samba/index.html

And if you look at my recent wiki edits, we have slightly increased our
C code coverage in the past 10 months, while still increasing lines of
code:
 
https://wiki.samba.org/index.php?title=Code_Coverage&type=revision&diff=16520&oldid=15683

Well done all!

(And someone else can finish updating the other figures if they like)

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







