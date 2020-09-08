Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F37126145F
	for <lists+samba-technical@lfdr.de>; Tue,  8 Sep 2020 18:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dGOcFdYh+OsOl+3ITyZEDPaqcubuSIiM9P6YG09YsYI=; b=k5GZyo1n36+uwb7B6LUSciB1Np
	yPFNixjDeOia1h63QjlXpUMFzkkBvCOrCsYJ+pRsV52Iz0AR5ag6ulXqkUvDYBTJJLZI6iIXwHgsD
	vpRT6OCX9rZOTMeqnXz4JU+fmNsKJeNTtIpHQO1OfNmASS9I2UT8713RJ7IyA02L2yOSyWyoVC1lU
	Y7EqhyQJnM+8/dgrC1casD9ozTLBkbl0tKYNgsezYkdwR84QfzDAjQer1xZFOscLy1qsI80X4i6iy
	8yNkDtVXqYBpqKGJdyQUOTWEIJ6JdTncEFk53r1oXIR91a94HsBxctSF1udZUqh6SwMTwBSBUB67z
	45o5eeBw==;
Received: from localhost ([::1]:47486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFgIR-004gR3-IL; Tue, 08 Sep 2020 16:16:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60782) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFgIN-004gQw-0L
 for samba-technical@lists.samba.org; Tue, 08 Sep 2020 16:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=dGOcFdYh+OsOl+3ITyZEDPaqcubuSIiM9P6YG09YsYI=; b=Y4o9Lnt4T6F1ytmRcPytySNOJk
 3qYH+Y+yLVRSwpDsd+7+tD9y4RZ7zTQfBGlMJ1DaqEwRLq1C+j8bVkymPq6KzEnCsieuORV1hypYH
 OYwfWBloZbpGr1J5ooozuvRKKIWN/xGnJtqghxzNax8+52SdCP8lA8HrolGTtrZEmi1IZx5GGRw6d
 HuGB20rghPH4YojptX2pliaTiztSm6lJP1TNubc7R1t1zmv5EBu4N/JliEY/c6qVTKp8NEdemzC5Y
 qT0ukNNcTzYAu/16Ux1KBI1N/BA0ySb4HE2w5bXYVZpNF5sVIw5a/ONVQhnw3OalsFYPjgQciClxJ
 5Z0WEi0/7etvPKM1yfnXvPJ/xe4LF1tk8OvkIQGRC4V29bIQ3GCpqMoM/7KNMiWZ+jrSKJzR4snIU
 nUCTCwjAHrERXvpQcqvOvIqgdX/0ZbwKtsz9YCaYCg+MuNSvhwRHyKT+cCDWXVBpyz++DzCxtR9JW
 xhjdLMS7c85mZstY9Esf/ewp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFgIL-0002zJ-Br; Tue, 08 Sep 2020 16:16:33 +0000
Date: Tue, 8 Sep 2020 09:16:27 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [PATCH] [WHATSNEW] Re: Drop Python2 for the build?
Message-ID: <20200908161627.GB599978@jeremy-acer>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
 <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
 <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
 <e279b12e-0b88-3f40-3733-ea575486db28@samba.org>
 <7960be07410deb265299daf2e2af243b628f3d4d.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7960be07410deb265299daf2e2af243b628f3d4d.camel@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 08, 2020 at 10:17:54AM +1200, Andrew Bartlett via samba-technical wrote:
> 
> I'm sorry it was not clear, yes I mean all Python 2.x support will be
> gone so we can focus on Python 3.6 and above.
> 
> Let me know if this new patch is clearer.

How about "will require Python 3.6 or later to build" ?

Don't want to mandate a specific Python3 release.

