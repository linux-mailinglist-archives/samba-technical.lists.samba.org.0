Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA67158920C
	for <lists+samba-technical@lfdr.de>; Wed,  3 Aug 2022 20:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MA+gnPofh7m0h90TueToyzo3t+yzml63JRNV5q5y+mM=; b=DnLv9ZcAcRJSReHogH0XbYDjeO
	6DQFs3PhLoyr2cnL1kePir5bwOdbK1I/jfEAl8XH2ovz/D9Ccitok2dNbR8eJ9WCHsp0i7S3abJm/
	ja/p/T7wHFAMS8j7ZB3KDA0jJAkz56fIIvzg6Cdf4yGQT20/xJL8ry3Z2lNTiX0MeYYbWU7ObadZH
	3yWwM6iuzkDQoAQQUb0piYSn1j4MB4DHZEQTdV9zab2yPkpXvHme/IHNQb7UIAsTdFaDNvO/B5xYH
	DrLCzeGzJA1EdDY3xhNgGAzwCzPW1nE2MyKNchwZF/C2vaSvdaQ+Op+5aACqubG5OfwGFGpj3IGoB
	lZM2odEg==;
Received: from ip6-localhost ([::1]:24680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oJIm5-005FlC-UT; Wed, 03 Aug 2022 18:07:17 +0000
Received: from mx.cjr.nz ([51.158.111.142]:60810) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oJIm1-005Fl3-1e
 for samba-technical@lists.samba.org; Wed, 03 Aug 2022 18:07:15 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id D4A4B7FD17;
 Wed,  3 Aug 2022 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1659549012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MA+gnPofh7m0h90TueToyzo3t+yzml63JRNV5q5y+mM=;
 b=H8pbMXoR4BHlmgxonNr793NznJqZ9uF2fbyp4ntsh0kwo/o82AcslpT6B9H2AbXRXmPs5P
 TG+PG3ohHvY+M1ZIWTOTJ4yFSDVgfiQLJ4M3iDmlOIPxjJrxkxFP1uR4/qPb5vbYOOdFG2
 IMba8Ecuw1yIW4+GtisxxRPoTxdqgZvLqNlkl6K48rNPkPrF4MuC2T+kS2WILNKkPW0IfJ
 Lv7xgBOUBm3DRAsMeDs2PvCDCWfhyxxdjLdIxPFYeuEDGAnsPN4qVsmgm/kOyodA9DQiZW
 fkznHdHsqsrAbxXVOoYvgkyY/aAxhLOItY6Nyhde6silCD1nzBTlotJZv/fhSQ==
To: Enzo Matsumiya <ematsumiya@suse.de>, Jeff Layton <jlayton@kernel.org>
Subject: Re: [RFC PATCH 0/3] Rename "cifs" module to "smbfs"
In-Reply-To: <20220803144519.rn6ybbroedgmuaie@cyberdelia>
References: <20220801190933.27197-1-ematsumiya@suse.de>
 <c05f4fc668fa97e737758ab03030d7170c0edbd9.camel@kernel.org>
 <20220802193620.dyvt5qiszm2pobsr@cyberdelia>
 <6f3479265b446d180d71832fd0c12650b908ebe2.camel@kernel.org>
 <20220803144519.rn6ybbroedgmuaie@cyberdelia>
Date: Wed, 03 Aug 2022 14:50:17 -0300
Message-ID: <87fsidnrmu.fsf@cjr.nz>
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@cjr.nz>
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 pshilovsky@samba.org, tom@talpey.com, smfrench@gmail.com,
 linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Enzo Matsumiya <ematsumiya@suse.de> writes:

> A note on backports: I myself (and Paulo) do the backports for our SLE
> products, sometimes down to SLE11-SP4 (based on kernel 3.0) and I
> could not see what other issues could appear given if we backport this
> rename to released products.
>
> Of course, I don't know every process for every distro vendors, so if
> someone could provide feedback on this, I'd appreciate.
>
> @Paulo I'd like to hear your opinion on possible issues of future backports,
> if we backported this rename patch to SLES.

We all know that backports aren't usually easy to deal with --
especially when doing them on very old kernels.  So, if we're gonna make
them even more difficult, there must be a good reason like a new feature
or bugfix.  This rename simply doesn't justify all the trouble, IMO.

Besides, for any future fixes marked for stable after this rename, it's
gonna be tricky as well.  Of course, we can definitely handle them but
not worth the trouble, too.

Just to be clear, this is a NAK from me.

