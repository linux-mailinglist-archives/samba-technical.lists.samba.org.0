Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37857F07B
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 08:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vkiMbVmG/22QHHDOMw8xTm9XetBNxkuzZFHkuO4/KPQ=; b=OYQSn4VHGEE2Izj0eWvpkCYxRy
	D8ghwUK/MS+3B53q1UfObm8FCAM3wjfmWg9zD1B+/dRFdzJRdP+U2SlX2ArOkJyeX/9AGOl3ZOGkl
	BkUgx58WPnN+Ia+u/tpf0gBMv6KkvJJ4tgDgcGOY1+HY28vyxXwMjh4HTfTeRLeVytpK0Nf3qkcGx
	Aep0qJ0jj7VVjdrcnC9llAR6tvuKD9nMoxp5eso16Cw9kGVsShGw5XTJe0Wkd9wCFqA6V8w1I0WqM
	aWk1hfg2Z4ifb4innkxAVyXnH2Bu0XtmHdZn4Nf+o0iO2izAvxGhBoCIPrnP4MQZQeP/qbJtJaath
	w9wopaig==;
Received: from localhost ([::1]:24220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLMHk-003nPI-Pv; Tue, 30 Apr 2019 06:30:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:63616) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLMHJ-003nPA-Dw
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 06:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=vkiMbVmG/22QHHDOMw8xTm9XetBNxkuzZFHkuO4/KPQ=; b=NTeRgheXWYiGGSv9Pb6jdzwWku
 Cl/DiS8TINgqt92u3G8AfKFEYMkgIyqhjxsUqx1RbyQ0EO6iBmMrV9omsZSK7wnGpzWbz1ZEa+RID
 +RfhMLld/8DKH/ZrHq4ag/P+4mZugBxz0Nas4Q/Lckj+dIztRHWKK3x2J6Mqenw2pGYc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLMHH-0006o4-Ue; Tue, 30 Apr 2019 06:30:08 +0000
To: Christof Schmitt <cs@samba.org>
Subject: Re: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
Date: Tue, 30 Apr 2019 08:30:06 +0200
Message-ID: <3291684.BBSyHeM0za@magrathea.fritz.box>
In-Reply-To: <20190429223210.GA23900@samba.org>
References: <20190429193555.GA28948@samba.org>
 <20190429200808.GA26142@samba.org> <20190429223210.GA23900@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, April 30, 2019 12:32:11 AM CEST Christof Schmitt wrote:
> See attached patch. That works for me on RHEL7 (skipping the compiler
> option) and Fedora 29 (using the compiler option).

Thanks Christof, as the CI passed I pushed the patch with my RB+ to autobuild.


I will look into CentOS7 for CI next.

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



