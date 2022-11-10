Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DF579624C97
	for <lists+samba-technical@lfdr.de>; Thu, 10 Nov 2022 22:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IPalUv4f1DcM2QM1VflRRefJZ7iLecAl75Ba5U0j5Dg=; b=Xce96uifBaAU9QPMNJK+ZPlX7p
	fqKyXtf/exUG5PxaESLMI81aJFo4CUxZSSKfWNALmR4yonRRKmfHTzdNTb/aNVEO0WPafq4W7g2Ve
	ctMN2frGnRrnDgORNWVHLgAAE/q2FBdCM/rwSj2FWS/Z28SggYR8dww5XQ/U62iQDCYuDqPC/6loh
	KQgoKOSRGRcfUC6lnj4LINP1dxUkCaF8jJr6xPoym/iq4mxYxM6FHARq6JSXHTPestKFWO/1eL17k
	cwa4Yd9S1pMD5IQdkyHwsRYqv0UjXTUNhYbMpqigGdE0LHH5X0OuFSyKBNIPfQGomT9pE5ueQuyT2
	W1Ev1r6w==;
Received: from ip6-localhost ([::1]:18406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1otEma-00C4mk-7q; Thu, 10 Nov 2022 21:08:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1otEmT-00C4ma-Uz
 for samba-technical@lists.samba.org; Thu, 10 Nov 2022 21:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=IPalUv4f1DcM2QM1VflRRefJZ7iLecAl75Ba5U0j5Dg=; b=xZqSaY/g2OjD06sfh2pc3OQf6s
 gUH2ybF31CMlZrchLodNGn4/sbA82+drcXSsva0pDXJL4ZNmK7p3oMc2+FqGPRCIGiw7WV3Dznr7H
 TWACsh5BaUYJN3h6m9krSoFFNcPC71xKUMigR13SUzsv930baNF8ohzZALsZNzOYs1hGg8Q5ing/w
 aPduCXK5lncVT/jCBHUnzvkCfR7YdfpF9qH9HDOOD4OlbuDBkXpdwrhotGjJgz1ecB70Cuh7xUlW5
 obPAEQxqbz3e2KpH/LRYUlpeCgUufhF98HPSAvJN6Xzc87DKoPI12MxLpesv1aB18P2B9HTlB/WbM
 nLp8y+0G6GjmfBhn0LABFPmKZnDq49iqWbPxWeRcd8RFu4bXZfAwAQbrnU5DtDWhlcBuH6VoEdiyE
 eO45xDyuPDONVfWATNfAxlrM7zki7WxGoZfp17cwq2pGJ1onVK7f3bF9hAR4sLG+sfnYUICYPieuI
 TvA3njggu+WcfZONs4i8xOkQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1otEmT-0083Y7-4N; Thu, 10 Nov 2022 21:08:13 +0000
Date: Thu, 10 Nov 2022 13:08:10 -0800
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: FSCTL_READ_FILE_USN_DATA on "SmartScreen" alternate data stream
Message-ID: <Y21oOlU7jWxGmJL3@jeremy-acer>
References: <CAB5c7xqc7BfQ3dCA=Le9izqxzC=bzAWZpYzE4tFUv1N-_Ocfmw@mail.gmail.com>
 <Y21joyg1L6gJ9WAo@jeremy-acer>
 <CAB5c7xpxXEHH4y1uhq1egPgt9NxNH2Nv9XYR2Lq1=igBoqYgnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAB5c7xpxXEHH4y1uhq1egPgt9NxNH2Nv9XYR2Lq1=igBoqYgnA@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 10, 2022 at 04:03:28PM -0500, Andrew Walker via samba-technical wrote:
>> Can you give the entire call stack. Might be easier to just change the
>upper level code to pass on metadata_fsp(fsp) instead.
>
>Yeah, that's not a problem. I'll also attach my WIP torture test at bottom
>of this email to save you perhaps a little effort. Let me know if
>formatting gets blown up and I'll email git diff. Torture test against
>windows server succeeds BTW (STATUS_OK).

Yeah, the formatting got blown up. git diff please :-).

