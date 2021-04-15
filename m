Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1A3603A3
	for <lists+samba-technical@lfdr.de>; Thu, 15 Apr 2021 09:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7JsCZioV1wxQ2aF2cEPI/HOYt6RxVfpKtcovym9WFAw=; b=6MAP0mOmpg7+RxLnT3Plsrv2nF
	GREgaU0mWpVmzUKIwHIWxqBJD77ZZgZQq+jw6NVEAxjKLOTV6jhk3SDGM3gqxE9AL3Km0Vrc/47SY
	eNcmC757XTkuDg9iDXUUeWi/JarpgvjafX4bs4YXFjueuuZPLj0XNDmqCkYkf7lkxdF3fl6WYigaV
	I9ZX2+rrqheCFBHrlUg1RBpzeOpBQYFsUlM6P1UMSLiQ7V6vUEBAQqaGlCwZz8xALgVelaAC7Ggdg
	CYNe3Kq+iPoxjVttnxtPqJD6iOO8BUNN9eVo6qctRFCnn8S5YPLk/m7GpyySDQswT5srZPNCF8kQR
	Nga9Bu0w==;
Received: from ip6-localhost ([::1]:25276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lWwh7-00BQNF-Nb; Thu, 15 Apr 2021 07:45:45 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:42487) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lWwh0-00BQN7-2c
 for samba-technical@lists.samba.org; Thu, 15 Apr 2021 07:45:40 +0000
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1lWwgz-0006SG-Gj; Thu, 15 Apr 2021 09:45:37 +0200
Received: by intern.sernet.de
 id 1lWwgz-0001Ee-Dx; Thu, 15 Apr 2021 09:45:37 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1lWwgz-001i4q-8U; Thu, 15 Apr 2021 09:45:37 +0200
Date: Thu, 15 Apr 2021 09:45:37 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Other things to drop (was: Re: Drop NIS support)
Message-ID: <20210415074537.GB406861@sernet.de>
Mail-Followup-To: Andrew Bartlett <abartlet@samba.org>,
 Jeremy Allison <jra@samba.org>, Andreas Schneider <asn@samba.org>,
 samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <c0ab22d7832cc8c9d7e1abb7ef729161f46814ee.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0ab22d7832cc8c9d7e1abb7ef729161f46814ee.camel@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2021-03-25 at 09:13 +1300 Andrew Bartlett via samba-technical sent off:
> Does --without-iconv ever work or make sense (it builds)?
> (or in the alternate does anything but UTF-8 still make sense?)

--without-iconv works and is required on certain platforms. Don't drop it, please.

Cheers
Björn

