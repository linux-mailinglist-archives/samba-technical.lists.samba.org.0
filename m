Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4432D92F
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 11:36:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=yGCKM66JfRMsKV9sb/dDxyZ7TL6Pgj6FZpiwsW+bybE=; b=kIuHiVCAk9PW9ipybLYI6mLxet
	ABdbu746FcDsl7JpWDetzk2RglppxYiPJh1IPA7BT2uCiBZ7KEerzBrKFvvb8fmgYuuDM21dxXNmw
	fuXnN1LCWajx9Wr1tOLsdsi2eKpXGtfNLfFQJYH3VC0u+pqqUdos394+L8MQwMHOMNRjQ0Rtd6vb8
	tvCAUEYg1mQODPFxwKw0gWdKE7eJS2mPXdJGlUnJ9nzK1l0vo1S7k9Oox1Le4ujZL7EXwTrPdVZsw
	0SKo2RbmgMqg54i6k3gXF5CdEwBkbALINR/4MzWtSF630kvNnXbw+l/L6JJJZ4AsR+0iYsAW2DcEo
	HHvUhDrA==;
Received: from localhost ([::1]:24832 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVv0B-002T6q-RQ; Wed, 29 May 2019 09:36:07 +0000
Received: from perdizione.investici.org ([2001:41d0:2:33d0::19]:47294) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVv06-002T6j-Ad
 for samba-technical@lists.samba.org; Wed, 29 May 2019 09:36:05 +0000
Received: from [94.23.50.208] (perdizione [94.23.50.208]) (Authenticated
 sender: anoopcs@autistici.org) by localhost (Postfix) with ESMTPSA id
 77635140EDB; Wed, 29 May 2019 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1559121371;
 bh=yGCKM66JfRMsKV9sb/dDxyZ7TL6Pgj6FZpiwsW+bybE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=S5kaRWMQw3GYKCeCJdrLdS+tJk9jw10NbS1aTA0rsp0EFwU3dj0jNAmfPn68s+3tE
 UeKKnRn9UMANX7STwszjRZ6R9C1SA4qY+efppG2fvUuXlJDZmEVcl6aqsyq1NWLfCM
 kZRAvXGjBtiVnq0+aVOSLixhCwIKg+4w1y5h8agI=
Message-ID: <85d10b88dd22f46e1b494af2184d8f1e1655492b.camel@cryptolab.net>
Subject: Re: [PATCH] Fix compile error with --enable-selftest
To: Ralph Boehme <slow@samba.org>
Date: Wed, 29 May 2019 14:46:06 +0530
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

Thanks for taking care of the typo :-)


