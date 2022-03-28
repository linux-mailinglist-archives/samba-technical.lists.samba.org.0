Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C44E8F49
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 09:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=9En9f22yN4/JeiS+DEwAf+4RYFP62sL8IsBM/QXO+Io=; b=atmlthhncB75G9yovXswwXspmN
	NselzGbIFQJ/ohB+ApuuT7L6pSlYoxW+E7GugmQqc/xwL6OMoYVIYq1PYmB9nez8P4Iag51eL5pMC
	6/HmvyP+4uvj7Kkm/v5xDSsM2dQy004dEgjT13rh43vBF/0L5t4qALru6G5M908L9B5ZhNMqpsh7o
	Z/x3FSd7D/8L48J5miO5EZ6ATsNjUsd7yP3+BkeCfGM2gkYACkuEKrWlbyKmfp3pOWzIK/+WVc99E
	jXPQ1A0nldT3jL5eNYCP3GXINm2gHnRQx7K2CMq9l5AmvF2jP/+HPCNRGItd8iNuXcdyQXU4HM1/7
	ugX3Cw2g==;
Received: from ip6-localhost ([::1]:35936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYk7s-005sp5-7K; Mon, 28 Mar 2022 07:49:20 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:47425) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYk7n-005sow-Ni
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 07:49:17 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D75AC40A1C
 for <samba-technical@lists.samba.org>; Mon, 28 Mar 2022 10:49:12 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id CD092352
 for <samba-technical@lists.samba.org>; Mon, 28 Mar 2022 10:45:26 +0300 (MSK)
Message-ID: <be4e95e0-a1b4-c1af-3201-9bb38ea1e822@msgid.tls.msk.ru>
Date: Mon, 28 Mar 2022 10:49:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: heimdal headers ordering (gssapi/gssapi.h, crypto-headers.h)
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <412176a7-bbb3-1937-357d-5325ec4f5d2d@msgid.tls.msk.ru>
 <0c857b0d-469d-7619-25e9-8a2459c60166@msgid.tls.msk.ru>
In-Reply-To: <0c857b0d-469d-7619-25e9-8a2459c60166@msgid.tls.msk.ru>
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

28.03.2022 10:21, Michael Tokarev via samba-technical wrote:
> 28.03.2022 10:14, Michael Tokarev via samba-technical wrote:
> ...
>> We should list heimdal_build/include *before* heimdal/include in
>> all cases. Yet the order is random, non-deterministic:
> 
> The include path is stored in a hash-like structure with
> randomness in waf, right?

And it pretty much seems to be the case. The build success
or failure depends on the source path.

In debian the automated build procedure by default
unpacks the source in a random directory like
/build/samba-XXXX/samba-4.16.0/.

It always builds fine in
/build/samba-HZ1vA1/samba-4.16.0+dfsg/ and it always fails in
/build/samba-HZ1vA0/samba-4.16.0+dfsg/ (note the 1 vs 0 at the
end of the second path component).

Who-heee!.. It is fun to hit bugs as hilarious as this one ;)

Now, please someone who have knowlege of python and waf,
please take a look at this.  Everything's under the fingers
now.

> It is not a set, it is an ordered list...

It should not be a set/hash which depends on the pathname :)

Thanks!

/mjt

