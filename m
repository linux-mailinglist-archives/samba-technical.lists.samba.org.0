Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D3D5084E5
	for <lists+samba-technical@lfdr.de>; Wed, 20 Apr 2022 11:25:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=lKjV/Yhuv7f9fJwhIuPaq3izkveOQFW9/Hm3eKtz6Cc=; b=KzSdN62VfheXqiFftAacpixCur
	L2bhkLH52ccyncC+Wbxt/EB48TwN+cc6g/m7rYheTYssD3JnqTUaWI56B5dV+z3UnAnTaHox2bm3W
	Ds1oRBX+qDcPEeU0xWRRWmWMfGy2802hyjF6KRX5/S17NgCVE16Xsor97lMkN+Rq2pNrXL2JJY4mh
	qnBH0eYMeTyfbbz9oj5N2FlCzisVphPepA6pMjYynkMe6myg8sfzw0AfzKM+vUyeddFbgQF9/LTV6
	MrUHa9RTN0u2MOTJ8w0vYBHA6nNxsvadL2AiOjxDlwVyBAQyRb/PjMldnMmBUhO/le54080GM3wQ6
	cdpoqFAw==;
Received: from ip6-localhost ([::1]:21478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nh6ZS-001IKG-Bw; Wed, 20 Apr 2022 09:24:22 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:39977
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nh6ZM-001IK7-Uk
 for samba-technical@lists.samba.org; Wed, 20 Apr 2022 09:24:19 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KjwG64PV3z4xPw;
 Wed, 20 Apr 2022 19:23:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1650446625;
 bh=lKjV/Yhuv7f9fJwhIuPaq3izkveOQFW9/Hm3eKtz6Cc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iGYvpT+1QyfRN9LRjVjtaZI59Z5n8XVim5J/CyeW6Nn4vcn65jhDAfYIaX+/T2Tvy
 eauPy/FRohczc6KzxoBB5Vi2LU39eWGhG2uzERhVvCTBPs3KPpBc2F7aWk12GIzsCR
 Cdu73C+B7cNm5DhaXpfmT70k5TDBcbFJCCOxcYx8Qlq7JW2ECohsPoHsCDbwKCqLWr
 0R0LRZnSWkdv/jMrKlNN++1j0kyElY81pr17PkFYXciVj5t7W/eNfZuADU5oICypnt
 lpV7fktCHSRJNcSe5u8lPMC3jA2RyV/5a80heezIu1soIOH6KIP5Wu+zlrv8IQNjrG
 WZY/TdMw7l/9w==
Date: Wed, 20 Apr 2022 19:23:41 +1000
To: samba-technical@lists.samba.org
Subject: Re: doing a test build of samba
Message-ID: <20220420192341.5c8ce0ce@martins.ozlabs.org>
In-Reply-To: <1b3f5415-f263-8b56-c66d-77049719b018@msgid.tls.msk.ru>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <5f048c2b3b9a93b653f19e2573b2f60ad4688af3.camel@samba.org>
 <30f1d626-f8c4-ca8a-38d0-a2c7eb2ed03a@msgid.tls.msk.ru>
 <9327243.eNJFYEL58v@krikkit>
 <794ca2a4-6d67-ae04-2dec-ca291d633cc8@msgid.tls.msk.ru>
 <0a7f7fb7724efaa78937a1020ffb110eb5e6b75f.camel@samba.org>
 <1b3f5415-f263-8b56-c66d-77049719b018@msgid.tls.msk.ru>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 2404:9400:2221:ea00::3
 (mail.ozlabs.org) incorrectly presented itself as gandalf.ozlabs.org
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Michael,

[Replying to a random message in this thread that is still in my samba
 folder... :-) ]

On Tue, 5 Apr 2022 22:57:16 +0300, Michael Tokarev via samba-technical
<samba-technical@lists.samba.org> wrote:

> Before uploading such a monster I'd love to know if it at least
> quacks still, instead of relying on my users to report problems.

Samba 4.16.0 landed on my Debian testing system today.  I hope you
managed to get through some successful test runs.  Either way...

Congratulations!  Excellent job!

peace & happiness,
martin

