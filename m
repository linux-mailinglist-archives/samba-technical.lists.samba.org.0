Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 101BBBE1D9
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 18:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=x2edj/d+ftimKBzELih06hU93c/EKgNLHe50i4jwxH0=; b=S6tL61BLR7jqdxzYXq+wjbLGwu
	pDFjw0FGGscwW0dASWIwtBXGG2WH+8t6EFUL/O1eswKY6WZgwtFpBi/Np0XrQ7VfPK5PHF1VY+bXo
	ivvr6lyRrhbQzpSLo0cluEqawFagmGEzZpYBCzQLTdg2dxOiRpMDoZ1zbyi4+thoAr0klLBU2yoaA
	BESUgzne4SwS3Vdf8mY33j7AZrMug3w9FSb2yhDqkPikMxgkT/xVn4xaipRoMzOlRMS6ayeiNMJMX
	YtX3LrnLOXx1HyZCwA5NUzRbvnraX/Z+5B6awSBzbrDekaK6WsJZeydWdhijSX1lnaoh3Kl5gq0lk
	AoxJiP/g==;
Received: from localhost ([::1]:38530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iD9hO-008YFx-Aj; Wed, 25 Sep 2019 15:59:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20578) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD9hI-008YFT-JF; Wed, 25 Sep 2019 15:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=x2edj/d+ftimKBzELih06hU93c/EKgNLHe50i4jwxH0=; b=AAW8E0b3hO6Yrjt+6HYu+we4A6
 S8NyLMdFaBQ5NdRuKgM7oQPN8i9RCxJjXbSrvuOUhH29CzBP31ZgJhubizv61wKMhKRqTWANVSdhP
 gdAKyVBpl5xw63zZEQpGO+++6uqpZTlXtKhBKPY52h0qgitKcFwr0A6zwMgdmAinAVZQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD9hH-00015o-Jr; Wed, 25 Sep 2019 15:59:19 +0000
Date: Wed, 25 Sep 2019 08:59:16 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org,
 samba-announce@lists.samba.org
Subject: New minimal SMB2 client library !
Message-ID: <20190925155916.GB21234@jeremy-ThinkPad-X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Ronnie Sahlberg, Samba Team member - has
written a new small-footprint SMB2/3 client
library. Compiled size is 120KB (yes, that
is *KB*, not MB :-). It supports signing,
sealing, NTLM authentication (and krb5
with external libraries).

It has *no* dependencies (other than the
afore-mentioned krb5 if you need it) and
is available for checkout and hacking at:

git clone git://git.samba.org/libsmb2.git

License is LGPLv2.1+, and it is developed
independently of the main samba project,
so please send patches directly to:

Ronnie Sahlberg <ronniesahlberg@gmail.com>

Submission of patches grants him the rights
to integrate into the code under LGPLv2.1+.

It's designed to expand SMB2/3 use into
the small device Internet of Things and
is already used by the VLC and Kodi projects,
and someone has ported it to load games
off an SMB3 server instead of a cassette
tape for a Tandy TRS-80 (for the over 45's
on the list :-).

It will *never* support SMB1 :-).

Thanks Ronnie for making samba.org
the home of all things SMB !

Samba Team.

