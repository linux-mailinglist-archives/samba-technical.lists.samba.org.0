Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 383046743FF
	for <lists+samba-technical@lfdr.de>; Thu, 19 Jan 2023 22:10:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GPyMCLbOvwmZF+LkNX+a8+UPGoM78KIPZWbfOrQeV+I=; b=ntuEuqAJuj8FEZKlEwPy0Du9eN
	AF5YgjLlp6nOJ4c+W4B+ydlTlrktL2/DBUTnMYBXeRRi12Y8RpmvdDA0ABeT1PAevghfr18mz3Hmu
	y2cy5jBef4BgtJFo2RqXgIF2l1X1XekkN+vm4bmDfxPCvgWNq/Ox+BNvvNiAkl31q/IRzvUk96y2L
	QHhhHuvnTS0FuGFm88weejwM79FVw5QS/+wIEWpHftOjntdF5NtQf2d6PIr+op1xydZOQrkgvN1XY
	bXMwyHbJ0295nqIAN6CvJ6sqPTyQvIHNW3z0Gv9ymTy1KczEtB/Yh9SJwxtw+yzBkh5B2bdSCJuzb
	iDCW4gqw==;
Received: from ip6-localhost ([::1]:48558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pIcAS-000vdW-Mf; Thu, 19 Jan 2023 21:09:52 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:43971) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pIcAL-000vdK-B4; Thu, 19 Jan 2023 21:09:49 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F361B40045;
 Thu, 19 Jan 2023 23:51:50 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D02B895;
 Thu, 19 Jan 2023 23:51:51 +0300 (MSK)
Message-ID: <3d48f09a-95e4-8733-af0e-7ee64231507f@msgid.tls.msk.ru>
Date: Thu, 19 Jan 2023 23:51:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Announce] Samba 4.18.0rc1 Available for Download
Content-Language: en-US
To: Nico Kadel-Garcia <nkadel@gmail.com>, Jule Anger <janger@samba.org>
References: <1f018166-c9d0-cacf-844c-f65cd3582846@samba.org>
 <CAOCN9rzCiLODkVaK-LYhp-F3pogBLUNwxWt8QwsPW3kU2uNZKQ@mail.gmail.com>
In-Reply-To: <CAOCN9rzCiLODkVaK-LYhp-F3pogBLUNwxWt8QwsPW3kU2uNZKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: samba-announce@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

19.01.2023 22:43, Nico Kadel-Garcia via samba-technical wrote:
> It looks talloc, ldb, talloc, tdb, and tevent also got updated.
> 
> Don't expect any of them to be compatible with RHEL until sssd can
> also be compiled with them updated, due to the .soname changes. It's
> possible to publish Samba with internal libraries, as well as with
> Heimdal, to avoid the dependency difficulties.

"Don't expect any of them to be compatible with RHEL".

Are the changes api-level backwards combatible (not abi)?
I mean, can samba 4.17 (and maybe 4.16) be compiled with
talloc/tdb/tevent from samba 4.18?

Thanks,

/mjt

