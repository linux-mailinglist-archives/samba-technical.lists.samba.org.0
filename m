Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F95431436
	for <lists+samba-technical@lfdr.de>; Fri, 31 May 2019 19:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=fbEziQAlDa+MPcuMDQ4aWE9wRj2Etz/eXcyDuUKM790=; b=ZZynDdEsMiabxMaLz4UeJZ/eA/
	TLzRHuIxVNo5AnjdB/yT0Elss0y9RQxjxIvq+bHygPdzSUzDNSxubPEVcX7tO9y6VRNUBrDnSRFkO
	9ps64dHN2WqsJ7BXyTjeff7bmJZ5exV9s93wFel+ZSQLu/y5WMNL/7kc1vAvG/z5bVy9LWouYbBXW
	LNIyEIzsulaAyxwCKB0IpiRjTdgH1ygg22eMXmX3fU4/V/TrjIKOafJhCP2xPMrDRdk5/UHq66pBc
	E7z6lN41vG8PBs4bBoNOIb57wFOfSAmfXoH3g0ZUzj2m7UAFl2kQ6vb5St8eE79YgIYGgIfG+NNRb
	j3dohGAg==;
Received: from localhost ([::1]:44998 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hWliX-002nYz-1G; Fri, 31 May 2019 17:53:25 +0000
Received: from latitanza.investici.org ([82.94.249.234]:45047
 helo=mx1.investici.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hWliR-002nYr-HZ
 for samba-technical@lists.samba.org; Fri, 31 May 2019 17:53:22 +0000
Received: from mx1.investici.org (localhost [127.0.0.1])
 by mx1.investici.org (Postfix) with ESMTP id 7526A120AC2;
 Fri, 31 May 2019 17:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1559324058;
 bh=fbEziQAlDa+MPcuMDQ4aWE9wRj2Etz/eXcyDuUKM790=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=PwhAZW9D6yYqloskUiv1TummkrIZq6iS574b95t0XMauO205SlrpczYToX6BHEk6c
 oHmB6WfpZhz1eXT2CUmYN51dh+H5TFqs4UccyolZDSN0ioEdqIdmx/hvBQG4H6aSES
 x6NAP5cJUQvKptxfNRGoyOFIismyFFoi2VAKD0Qw=
Received: from [82.94.249.234] (mx1.autistici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id A328812084D; Fri, 31 May 2019 17:34:15 +0000 (UTC)
Message-ID: <d59909ca37f6b2abeb5fc653f518b41da30b0680.camel@cryptolab.net>
Subject: Re: [PATCH] Fix compile error with --enable-selftest
To: Ralph Boehme <slow@samba.org>
Date: Fri, 31 May 2019 23:04:09 +0530
In-Reply-To: <20190529084444.gcd6k2kgskv4jnhz@inti>
References: <42f879d1e0abfd4dd2e6c299b9184a7dfc5afacd.camel@cryptolab.net>
 <20190529075805.zc4qabjyb7plsajg@inti> <20190529082426.GD4871@onega.vda.li>
 <20190529084444.gcd6k2kgskv4jnhz@inti>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-05-29 at 10:44 +0200, Ralph Boehme via samba-technical
wrote:
> On Wed, May 29, 2019 at 11:24:26AM +0300, Alexander Bokovoy wrote:
> > See my separate email -- there is a typo in the commit message
> > (undecalred). With that fixed, RB+, please push.
> 
> fixed and pushed. Thanks!

Sorry to ping again. I don't see the patch available in master yet. Is
there anything pending to get it pushed?


