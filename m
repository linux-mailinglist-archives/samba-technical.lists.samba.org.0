Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F53CB690
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 10:38:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=xOeGsZFqJNNULC7qqr2LL6UgS1T91gRMVCqzVyqqtEw=; b=2eeeqE7WZe31afYSTeFqXdZSu4
	TQY3g4fFZYxyxxoBoZmZ/264kBvJUsA5Gop6eKhTJ/5CgfhMC+/BDyFD4J0YokxoOZ2dsTAH0P2Ik
	mr7QGv9pzr6qXdiWcY2iINdakm/dUrzyam2kX/rDpGOdv8q96x/pQTG1JRc6XEDmUmNWZ14fFRZlx
	mxjsZiTJaM12P6NU4hn2n0N2Zddf+FPfdykVoghSrSaYyskt7+t5718Ru9VpeTQMm7lurtJD2DodT
	p3xCHRDfw9Zp2Z/Ss9ENq5WSdAo4GonDLglCj5YqhKYfv5MMnNtHqUwxbMDeaPDxqEv02YUqagQ8H
	6m2pc21g==;
Received: from localhost ([::1]:46786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGJ6Z-0013dO-Vr; Fri, 04 Oct 2019 08:38:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42662) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGJ6V-0013cs-0V
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 08:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=xOeGsZFqJNNULC7qqr2LL6UgS1T91gRMVCqzVyqqtEw=; b=cd4rt8s81a/sC6c1bIkCMP5eKr
 FDRYIOPnBZQ+WU7GnBF9tE72BKmDKkiTyzC/y6UclKz9isJDOXxQyvQIEev/ARy0zeElfSsyFnXY2
 RPNpzxTfrKd/SLSIgqwIMFDiH5vUfZeM7wxOPT6e52sF0ObCZ2HrO4VW1QD08cJNQTvU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGJ6U-0006P5-3Z; Fri, 04 Oct 2019 08:38:22 +0000
Subject: Re: Implementing SMB_VFS_FCNTL in Samba
To: Anoop C S <anoopcs@cryptolab.net>, samba-technical@lists.samba.org
References: <7024afc6236a656134f867288cdb37579425e3ee.camel@cryptolab.net>
 <20190923153107.GA4325@jeremy-ThinkPad-X1>
 <98add807a4ac55e5f401522fbdfd47ddf2358d16.camel@cryptolab.net>
 <e9469e1d026b34cf46c0012a463a2fbe610ffd17.camel@cryptolab.net>
 <a71d6def280a3c6125009f3d1eafff54f8f059b4.camel@cryptolab.net>
 <cb57dbab50e84cd24fdccd75530d11d5dbd002ed.camel@cryptolab.net>
Message-ID: <67b7870a-faed-78bd-8651-6e3226142e70@samba.org>
Date: Fri, 4 Oct 2019 10:38:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <cb57dbab50e84cd24fdccd75530d11d5dbd002ed.camel@cryptolab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/3/19 3:20 PM, Anoop C S via samba-technical wrote:
> On Thu, 2019-10-03 at 18:43 +0530, Anoop C S via samba-technical wrote:
>> OK. This should be it. I hope attached patch covers the missing part
>> where recent fcntl() commands are detected during configure. A
>> pipeline
>> has been completed successfully for the attached patches.
>>
>> https://gitlab.com/samba-team/devel/samba/pipelines/86263033
>>
>> Reviews are appreciated.
> 
> Please ignore the previous version which had a typo in checking
> HAVE_XX_XX inside vfs_default. Attaching the patches after correction.

nice addition, thanks!

One nitpick and one general question.

Please don't do function calls in if expressions:

if ((val = SMB_VFS_FCNTL(fsp, F_GETFL, 0)) == -1) {
    return -1;
}

Instead:

val = SMB_VFS_FCNTL(fsp, F_GETFL, 0);
if (val == -1) {
    return -1;
}

Then, I wonder why you make a copy of va_args in the time_audit and
full_audit VFS modules before calling the NEXT function. Can't we just
pass the va_list on to the NEXT function?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

