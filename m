Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B614E880A
	for <lists+samba-technical@lfdr.de>; Sun, 27 Mar 2022 16:19:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hNkyo7z72KFrIaHPYZibbfYag7JmvfA2QBHFldJQVFM=; b=6YsmAkVQ+RiM0imk8L7+qeoe10
	PpRZXj5GDBx+H7y6WDuJbI/7G5dS/rmoUejeb5YP/5X5OI7tqxacK/dFleRuKTNeMZM5BkVkNN7NH
	HI6c7F4aYRYx4GTE3XHUsoWM0YsNf8y1UJ5fOQ/FVTXJzkEiCeLAUFn7nN4QHNagB2fp6Dc7qa6kv
	ZGUF4q3wqcPC4S8Wqum75wxhA2OIBCn6tiIl/vpWKAA9USYP97mzHGLcio+htiVnXcWSnU5IwZf1s
	8FxWmVvFpkPv5p1z1FCVRQvZ77iGJIqZqnl0QMvgzksQxgSrs+LPxPPuU/NTlnHoktIfdx+GWkxIr
	ZhmzCwkg==;
Received: from ip6-localhost ([::1]:63866 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYTjy-005goW-0m; Sun, 27 Mar 2022 14:19:34 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:36763) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYTjs-005goM-Cy
 for samba-technical@lists.samba.org; Sun, 27 Mar 2022 14:19:30 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 34540408C3;
 Sun, 27 Mar 2022 17:19:23 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 75A8E36F;
 Sun, 27 Mar 2022 17:15:36 +0300 (MSK)
Message-ID: <16d846bb-45ae-ef7a-b70a-6c8354b9a771@msgid.tls.msk.ru>
Date: Sun, 27 Mar 2022 17:19:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: building 4.16 for debian (long)
Content-Language: en-US
To: Nico Kadel-Garcia <nkadel@gmail.com>
References: <006ec6d2-39be-80e9-94c5-946dfdd968d9@msgid.tls.msk.ru>
 <CAOCN9rzvTJq6fykhTXmEtkRq+aLRirUAWDFuvUSN1K-M15j9AA@mail.gmail.com>
In-Reply-To: <CAOCN9rzvTJq6fykhTXmEtkRq+aLRirUAWDFuvUSN1K-M15j9AA@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

27.03.2022 17:12, Nico Kadel-Garcia via samba-technical wrote:
> "Building on Debian" isn't enough information. Which release of Debian?

It doesn't matter since the same result is achieved on current stable
debian (bullseye) and current unstable "rolling release" (provided all
external dependencies are satisfied - and there's no new build dependencies
as far as I can see).

> The latest release has some critical dependencies, especially of a
> recent version. Do your steps work with the previous releases of
> Samba?

Yes ofcourse, the current steps definitely work with previous releases
of samba - this is exactly how samba package in debian is built.

The build problems I outlined are within samba, at least some of them,
and I described the reasons why it is so and provided the fixes for
some (or at least work-arounds).

My intention is to get some help with the samba build system, using
the issues I'm seeing as examples.

Thanks,

/mjt

