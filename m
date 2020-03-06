Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9DB17BF62
	for <lists+samba-technical@lfdr.de>; Fri,  6 Mar 2020 14:43:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=voI0csvC36AzZ4ZTYpHbBEpjGaEkaJIZJxtBpjPgffg=; b=XTJwPZOHcE7TR9I9QGNZCDTtv7
	mKedzmta3rzsiruAsLwDMrlUCqRYUNsGxSWzim81U9uMym9uSxuxVD89YvA4s78dJgGFZJkVu5+eE
	EJ7x7ObWfWx1WmvH9PA1C9kTt0zTk+qy4071tai3MthjjaQpOncxU1gr/mua2S6I2KmWfFkp/8Z+V
	X1/jNKl/hd8KWRR8QseoHMLzhdOvGX3PnfqzcntnNSJc9w0O8Y0ZwyKVx4LG+U58hfN5YqHL2R4b1
	uncYFJXW6nDlBWlXkW0431p6R6av2ZDLRIprkddCSg0xPaX5QOxisCc6ODUaF8Z3nIbwAHbo5HiA0
	w1NMFQtA==;
Received: from localhost ([::1]:27164 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jADEV-00FIcu-Ms; Fri, 06 Mar 2020 13:41:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30868) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jADEP-00FIcn-Qf
 for samba-technical@lists.samba.org; Fri, 06 Mar 2020 13:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=voI0csvC36AzZ4ZTYpHbBEpjGaEkaJIZJxtBpjPgffg=; b=GuKUmMmL/t3C1H8lgt0zz4Sg8p
 pjqfdDsUEhLEe7GYXsKa9CnEBHI59LSxVZ2RoA86qqGB46X3ipNERwnV3bZnnpGS6mk0iGD4YYSTC
 EPYpq4c2mpPVkGRSxDHOVgjHrw+BH2seDqgpqt0W446SKt9eNTIobdoh7whXPbp9IXhe33Wb93+ww
 8/cGK/CHiqfd2exIq2kB+QiQq6gCDvdeDpI7S9BH3cV3+5vIVDwvZ2Iseqdv59gBVm3rR0qtDbwt3
 qkmdfmz6uMJg4+3wEDjSqigL5q702EqybueqxBYuWqCDZfJkxDCjFA3dKsX8rb/J63xext2lmoS6k
 vkunDv3DRFu9OrB41zuG9Gqny7Vkhvys+luq4yO2xQGJIDIA9SyPDpk2hCVrqtXRG0XYfGkDUkipG
 brUxlxwuOu4GKs8cmdkeZcn35j6tIKAMFTA63ze3dIg0jANxpKoc2RHV2JoJMlCIk5GpwZBqR8Nqz
 SMfr14MkwEL/eFLKvkQr4Lin;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jADEO-0006kE-7y; Fri, 06 Mar 2020 13:41:36 +0000
Subject: Re: Using vfs_fruit alongside vfs_recycle
To: Isaac Boukris <iboukris@gmail.com>
References: <CAC-fF8Tc=3A=fBU5DpstKcg7YxYvi0ugFSBTAGSMz2tp6H1MFA@mail.gmail.com>
 <73341d2e-2a86-a43f-6fa5-dd1473cdef6e@samba.org>
 <5b8bae24-553b-25cf-b942-6d6b2404d8c0@samba.org>
 <CAC-fF8R8hsBuCeGQX99ZVY=C7vuEuCf2L+KNbdGARJorSEzoAA@mail.gmail.com>
Message-ID: <089d3ced-cf08-5276-daaa-54eb54b87850@samba.org>
Date: Fri, 6 Mar 2020 14:41:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAC-fF8R8hsBuCeGQX99ZVY=C7vuEuCf2L+KNbdGARJorSEzoAA@mail.gmail.com>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 3/6/20 um 12:48 PM schrieb Isaac Boukris:
> https://bugzilla.samba.org/show_bug.cgi?id=14316

thanks!

May I push the patch with your +1?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

