Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6D862A049
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 18:28:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5J7nWETikFTbSkFlaWmv/W7hJZ3X6DCRTzpF1AZBFJI=; b=jUzHO5jwzxOhQuIZJ+xFpROKmo
	GQQpEcn9upRJaPJlG5S8zZ8S7LWfzTMGkrELVNt/mJ2xQbUTxIdiFfZp4So9TXBocPtcxnnYkbCB8
	7L5VsZbQq3/WvMAMGAVxmVOet52pvbEYzc+Jo5hPancOOihfbJSL5ottRDis54kmrTU3HbutwTNRt
	QlQk34oofapk8smhBvdTt+Bmfw7HBZGrUuW2U7SUuYEgH9GSULX/mLPPwyJofX8utWT04GwM9VVy/
	u6EMb3qPsTX3fLOpS+zTfZ3t/YQAjnpZNIyLgL7uSYS8qaIEa4Gjgjud2FxKYYNSFU5RZCtU1howG
	m8Dn15BQ==;
Received: from ip6-localhost ([::1]:49076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouziV-00DvXE-NK; Tue, 15 Nov 2022 17:27:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53442) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouziR-00DvX5-3F
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 17:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5J7nWETikFTbSkFlaWmv/W7hJZ3X6DCRTzpF1AZBFJI=; b=mSHyeXDMhndIm7ycTb6AcIp4yY
 wP8R9QXPOMW2tLCE9cOLd+ILcCSFMBbMRoN6VWlcGI46UrsEOGBXT4edqFiAHxKFWW5MAodPoGGmF
 1TzuNI8JFYGV/z4ORWjy+n8oYo8qFEuT+fICEKs1SkepzCtCsxIUeankY8NkDIWlSW5f32plkwXvh
 jIXSpmh/j+S/CMML2YGPuztgrz+RVfeQjwAU7BgmZB2OO0rPmvgkPfnQZ9oOdcHQBAiYp9ugg/3T3
 NqxquJNPAIO4y81l7Dx0JAef1IZRBrU7HfnKBT6qfazP+YUSb1fsDZ5lScxpnbyOCX9mjPbiRQ37V
 tLWTaHjeiwnkE1gSwYvYkT3r5eVgPGr3aww5922ONtMFZlx5oFoRUUOzYf+qiEAgJ5ARMeHy5asAb
 9fgnNy5BKGL/VmQUu/8tpyKi4nBERzgUK6BVpjrz6DQqHLj4+VKxUcR71eCh+vDSfmKDnrbIXOzSZ
 UrgfNbUuHuoVlMKjwcukXGOz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ouziP-008kLO-Hl; Tue, 15 Nov 2022 17:27:17 +0000
Date: Tue, 15 Nov 2022 09:27:14 -0800
To: Michael Weiser <michael.weiser@atos.net>
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Message-ID: <Y3PL8jDH0FT+TVKv@jeremy-acer>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
 <Yzsp/U5itUs486Ic@jeremy-acer> <YzsqwptGoGijMcib@jeremy-acer>
 <5b08d4aa-2d59-b5d6-07ad-9cc40438aeb1@puzzle-itc.de>
 <0698402c43a54ae6baf045e99e8c259c@atos.net>
 <29f2f344ce954367b65e54bac76bb2d8@atos.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <29f2f344ce954367b65e54bac76bb2d8@atos.net>
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
Cc: Daniel Kobras <kobras@puzzle-itc.de>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 15, 2022 at 09:33:17AM +0000, Michael Weiser wrote:
>Hi Daniel, Jeremy,
>
>> > Ok, I've just submitted the fix in
>> > <https://gitlab.com/samba-team/samba/-/merge_requests/2763>.
>
>> Thanks for your effort! We are in the meantime in the process of testing your
>> fix in the affected environment. I fully expect it to resolve the issue. Will
>> keep you posted.
>
>As (hopefully) final feedback on this issue I can report that we've deployed
>the fix in two affected environments without fallout. One is running RHEL 8.3
>with samba-4.11.2 the other RHEL 8.6 with samba-4.15.5. Backporting the patch
>was trivial.

Thanks, the fix has already gone into 4.17.next and will
be in the next 4.17 release.

