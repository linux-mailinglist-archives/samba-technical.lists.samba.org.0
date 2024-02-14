Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C8015854A19
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 14:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=tLWyEUTF/AAfsAS78u1gEmVfTG1UmIpTaNZ32SY+EZ8=; b=n1UyDe2qJDFk0k9GT7ywm4P0Mh
	YX69yHYpS3ZzFnV17czq/tLb1Zk/2lhxblRBosRy2h/bDTFkJBx5w9tVnaDKMIGSdJfMNj6EXYpEq
	/SPI9A1ouowmRiaEG2LPZCDCJRvEMg26VIYJahbBg8uw3/6hJJffZpjwp6LLew//WZ1ZFJtCLgVk3
	EGNBujxnIDj27NoUph4NBLC/51hHiKq4tOtJJ5zx8S5ZCDtdhvQv/35PBzkI5eTWf1nFn3UZC5sCX
	/mZZwjLSepyJv+++zwV9IqF98aRBRRpfYXIbw9LkDherTAPGkpe3TpfEPuUI+WF67pPXzpnonOgv3
	YdlUeEsw==;
Received: from ip6-localhost ([::1]:29518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raF0z-008Sr6-9v; Wed, 14 Feb 2024 13:09:29 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:43831) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raF0u-008Sqz-P0
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 13:09:26 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id BD8724D403;
 Wed, 14 Feb 2024 16:09:28 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6DB2B7ECC1;
 Wed, 14 Feb 2024 16:09:21 +0300 (MSK)
Message-ID: <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
Date: Wed, 14 Feb 2024 16:09:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Looking to once again re-bundle LDB
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
In-Reply-To: <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

14.02.2024 03:45, Andrew Bartlett via samba-technical:
...

>>> We would change the ldb modules dir to have the version string in it,
>>> so that modules are not installed for the wrong version.
>>
>> Sounds good.
> 
> I've chickened out of this small aspect.
> 
> It would mean a repackage of sssd for every single Samba version (well,
> LDB version, but they change pretty often), and that would make Samba
> security releases more painful, not less.

If ldb interface changes in the next version, it becomes incompatible with
existing sssd.  Moving ldb modules into version-specific subdir makes it
explicit, - user gets more friendly error message (at the very least,
something like "can't find modules") instead of a crash.

If, on the other hand, the version-specific subdir is changed in every
release no matter if the interface actually changed or not, that will be
more difficult indeed for no visible gain.

I don't think there will be real issues either way, - we'll sort it out
one way or another.  It's already impossible to provide "more recent
samba" to older release of a distribution without either breaking sssd
or providing sssd together with the new samba, it just has to be made
more explicit in the downstream packages.

BTW, there's also freeipa now, but I don't know if that one is possible
to use with samba compiled with (bundled) heimdal, - last time I come
across this (someone else mentioned it, I haven't looked myself), they
required samba built with MIT Kerberos.

Thanks,

/mjt

