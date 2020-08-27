Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF6255083
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 23:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=vKZQ02gKdFZ23N9gMb+Jq7IjB4Ss/dF+WXUr0CAA3tM=; b=u+rLw4Lm8ac6P8p2GImLyK5KQ6
	r+ZyQ6kRekucGqyEPalBfcqX2fp4mtMnwnaq3In2X3hp8AIbU14h23ElRP4ZOosZ3KCHikQhJhhqZ
	0OSOOUMU9R/ikfci2kzQGd1lJ5hMFfp7UrGMU+7c8E6OtXaRa6I+oFKUoWV7sB7VHWri0waZGKpZA
	bbh+MwCmVbLxA78loCdm2peaqEAQnsKsZ2fq4Dspa+IoenVrD7TH37qFoKwp298BJMkGLU/UaTzjK
	JADx6sLVk0KFcBzVa6IrNVkJd9PCG8ZFjPXOKbFtVBY5mQ5lTDpPcFX+FFHmPSXh2sdaUH2VgF7nZ
	PVw9Q2DA==;
Received: from localhost ([::1]:59476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBPJn-0010ES-S7; Thu, 27 Aug 2020 21:20:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31980) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPJf-0010EJ-Mj
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=YTe0A6Hd9bWhHJomvpO81Cul0snoBvbIevuzDaJVf3s=; b=jWW/yv5QEkwf0753OPU60Hup73
 W3IGqB4L+h219yIMOZt0F2Vatqcy6i+LG5LmIhcmG0sZ7mv7S1zAvBP8sgXkE0QKFGcUc4tFTwlx9
 RsZLqrkLb8Hw/JsWCaDo8d1BqZ5DeSAJ0Xnv3m04cXV/9YmawTNYFkH7eDZtcpIvcFVo7JZK5XfOa
 uW64RNIj7UuzvrCCFz112fvwxAKd63dpTrRyqgKS+zB1QYt4vjhq+P/dE4q5OaogImXemN5sww2ZI
 dyuScWCKajc5Xw49Edqt+qwxvLxFkvt81AMr0Dqk5T09PyzYdQxJzTEE6fjSFE8BvD2Icm1m0N2dO
 wquBv0kSrg9eSziKG39U4IN4UyYFH4z8/U4xi+bZMYbRv7ZB2In4iojHgiK1eTVMot2UpA4FPaTKI
 xx3AWmu/+lp98X5Q+dDxEY1Gc+cS0UAWD+XuDALmdmUqwZlfMIbTLLF2AFoKziAHdY/u0l+BFd6YF
 0E0BHH4uh7kZJaqkW1ckc3Ar;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPJe-0004CY-KL
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:20:14 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBPJd-006iXJ-SE
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:20:14 +0000
MIME-Version: 1.0
Subject: Re: ctdb_mutex_ceph_rados_helper: fix deadlock via lock renewals
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-216@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-216@samba.org>
Date: Thu, 27 Aug 2020 21:20:13 +0000
Message-Id: <E1kBPJd-006iXJ-SE@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TmV3IGNvbW1lbnQgYnkgZG91Z2xhc2JhZ25hbGwgb24gU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkK
Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMjE2I2lzc3VlY29tbWVu
dC02ODIxOTcwODQKQ29tbWVudDoKcmVmZXJlbmNlZCBidWcgaHR0cHM6Ly9idWd6aWxsYS5zYW1i
YS5vcmcvc2hvd19idWcuY2dpP2lkPTEzNTQwIGlzIGZpeGVkLgo=
