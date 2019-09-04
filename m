Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75037A7CFD
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 09:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=l+eiJea5tIQ6JjQprOn7OGQbGVHghSauVbSvdpDD04U=; b=ilQgRwyk8LsH8HMO2cXdE1RXAW
	vd5oVAfUPrL6RmJvsQRHLOin+CfIuZR4b4ExjmVJ4MlM3UAis3YYOGzHllIWqg6ZJlkLu8XJPh13v
	3sjiHazBAhk0fQPGVdQItkmKr68ny+F2mHdMBEmURho4fEdMA/o6iafy1WanvXAZgUBX8Hq6UVF2X
	G+HVs38S2gdKHp7V8m7BjeK/GjnUaIHXIF+pUXXtni/UMVcJGA5MvYkUonGp7Eve1UvwIEKFGPmby
	ryqAEE51osZeniSEI6KMzhqKFsuvEpX22MPmhPz2tc6wB8YfTs9pko91iGC3BnOb3oWBB1x5KHGSJ
	nqcUX7Sw==;
Received: from localhost ([::1]:41232 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5Q09-003L3c-Va; Wed, 04 Sep 2019 07:46:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29560) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Pzx-003L3T-1Q
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 07:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=l+eiJea5tIQ6JjQprOn7OGQbGVHghSauVbSvdpDD04U=; b=s5YzcC4gr9cuHtIRw4IVhF4sDC
 gZ6frzKWe9IHT+WpStj0Qi7NXpKYoZtarglsjU7QerZB6QgktaJh5+jHXW1uE6beQlDLLY/I/Lsn6
 /SnKPE3E6Q99PqYSdrgyi1LMFc0NDDh0B0OmrbZT//bTjIHvslWKmawVagd+SM8jld+I=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Pzw-0002tB-1l; Wed, 04 Sep 2019 07:46:36 +0000
Message-ID: <9b8897329db688e6b8904f636131922fc777c318.camel@samba.org>
Subject: Re: Test script test_net_ads.sh can't fail
To: Isaac Boukris <iboukris@redhat.com>, samba-technical@lists.samba.org
Date: Wed, 04 Sep 2019 19:46:29 +1200
In-Reply-To: <CAEiGmBL_1J4CBtKRcqx8JpSMTpMKFA6L6kBYpYYGsdXRXsfPaQ@mail.gmail.com>
References: <CAEiGmBL_1J4CBtKRcqx8JpSMTpMKFA6L6kBYpYYGsdXRXsfPaQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-09-04 at 09:20 +0200, Isaac Boukris via samba-technical
wrote:
> Hi,
> 
> I've submitted wip MR #765 and while working on a test, I realized it
> doesn't fail when it should, right after the first call to testit(),
> see:
> https://gitlab.com/samba-team/samba/merge_requests/765/diffs?commit_id=28f588b18c2f13c217d958914d8cbcc0c4a7368b
> 
> Any clues on this?

Failures in Samba tests are from the failure: lines not the exit
status.

Does that help explain it, or are you trying to make a more subtle
point I've missed?

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



