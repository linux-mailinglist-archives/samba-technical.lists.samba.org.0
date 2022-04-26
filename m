Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 505AF50F9DC
	for <lists+samba-technical@lfdr.de>; Tue, 26 Apr 2022 12:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zTPxNDU6K0LHiWYA1WMVJQYEdwf5RUkVT7vx+9zuQvU=; b=Swf3QVgTg1B6cgzVUFFH9QcQJv
	PPyNtoe3OD1jthNcjCXuRZ4R2qLdFCvSILyhxEDiCm8YNIMQxd3bVwfp9ICDLkVifHquhtsuQCvQj
	gYxU+ixJ1qi4TXf7pb711fVozdi/dd1L7Ma9qEtnuQhCUzpXxFRA6wBElGKLjNXuXZ/91sjGDjMAa
	XgBtqYlJmLb8SXpBxGv1dJYsV3qtu+1hXr0pQ1tEiBhxGv5v84FlScKYtTVEyKY9ulvDhID9II0CC
	G1A1xC/LcQslpsnZRlR7Q/eNTN3OEG4sFf/L6y+YDhwrOBMUo3t/BStepPvUEEpTwOZ0XDDL/LtiW
	p/PV1X/g==;
Received: from ip6-localhost ([::1]:28538 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njIBT-002Ej8-Du; Tue, 26 Apr 2022 10:12:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55882) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njIBL-002EiZ-TG; Tue, 26 Apr 2022 10:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=zTPxNDU6K0LHiWYA1WMVJQYEdwf5RUkVT7vx+9zuQvU=; b=YWlTgvCWDcdJytD+1T6EPIw6mk
 DTMWf5Z0XHGNqxma6en8DrweG36gQdet2e9VMiJT9lUKUDJLFGy6ZkFfmswSnVHZloeIDvCtxFVss
 y6ThwQ1Qa9GhhzLK3i+PJo5078W4hnGjfAJC2t9d68VUC4cTblR5VQ12TLf0KD5Y/obiW2wE9a8zA
 vhgmzrcbhbYopTm6AkXa08HAoOzYp/BQmTMZtBtHBiDg57uYATvRC6ur+bVd2h27OadnC3+JU6uS4
 hZ5/uRYJCKatFRVwRvTSK2cHqE+hx26WNGpRhsZ0sxmjtVMXAMthznMFcQszcx0EF1G6sb2jABsg4
 +qOB+FSHhaX0tjMSoAZh7oI4KmDptyvcKvaph9HsYkCZ4ja4R+gtoRWSAwfQvot6mC5fWsMaeLcfv
 rp4ST8JODvfnOAy8IDrGNwz2YZ/I7nnBYeqs00jrYsv/CgffVHsob3opLP82wtQFI+t5jCOxEFX9g
 u9yISekE4x0ZPFOMnYRdnji5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1njIBK-002Oxg-89; Tue, 26 Apr 2022 10:12:30 +0000
Date: Tue, 26 Apr 2022 12:12:24 +0200
To: "David C. Rankin via samba" <samba@lists.samba.org>
Subject: Re: [Samba] libICU 7.1 update to 14.6 build - [homes] no longer
 visible from iPhone Files app (IOS 14.8.1)
Message-ID: <20220426121224.7a61526d@samba.org>
In-Reply-To: <5c0ffbda-4961-3165-4ee9-6619802cf5de@gmail.com>
References: <5c0ffbda-4961-3165-4ee9-6619802cf5de@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: "David C. Rankin" <drankinatty@gmail.com>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

[cc'ing samba-technical]

Hi David,

I'd suggest that you open a bugzilla.samba.org ticket and attach a
network trace of the non-working share access attempt, preferably also
a working access trace from a libICU downgrade...

On Sat, 23 Apr 2022 01:34:56 -0500, David C. Rankin via samba wrote:

> All,
> 
>   This is a strange issue. 14.6 standalone, IOS 14.8.1 Files app. A few months
> back I had to add:
> 
> vfs object = fruit streams_xattr

I'm unfamiliar with the iOS Files client, but have you tried adding the
catia VFS module to your configuration above ("catia" before "fruit")?
I ask due to Ralph's comment in vfs_fruit.c:
  * The OS X client maps all NTFS illegal characters to the Unicode
  * private range. This module optionally stores the characters using
  * their native ASCII encoding using vfs_catia. If you're not enabling
  * this feature, you can skip catia from vfs modules.

That said, I wouldn't expect this mapping behaviour to affect [homes]
section handling.

Cheers, David

