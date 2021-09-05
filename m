Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C43E4400E7D
	for <lists+samba-technical@lfdr.de>; Sun,  5 Sep 2021 09:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=sgMP093FXtnRyUVG/ik3MGbT+EBzqa72m+QUrAEO4QM=; b=rC7Yshc6ceM0K7pKWvpUo57ZUm
	GuiuoFpqVO8j4XbR8EiFeHxTTPDnRsz3pvjnqenH7p+SdFeeqQWxr+/J+p0V6Q8BxE8pBsR6iFYF8
	zQnHXlh5tl7ctvlETUDRpWQbsanF+P2oORpJCCVE6/s23NPnQLZDfqcapUzV/ABs803wJD9fR5k9f
	XH+S3TvFfLr6n5esEe5ujxPcgknPwpcMFSwOz9gT5gl40auze/QTKarPiHwPsF56iUfLvC0NK25Lm
	WT6FZemDL2J21t+9O8J4mTgKu4r97LFCkcbTjp7skF62jKCAY/HUQbGvkUfwPd6vkhW3PPIJtjKAS
	8s2q7cbw==;
Received: from ip6-localhost ([::1]:26328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMm8D-00DNyv-2Y; Sun, 05 Sep 2021 06:59:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60958) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMm87-00DNym-CB
 for samba-technical@lists.samba.org; Sun, 05 Sep 2021 06:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=sgMP093FXtnRyUVG/ik3MGbT+EBzqa72m+QUrAEO4QM=; b=XtRAJcM+Ox/pSnIQ7d8ALeC/hJ
 FULCKYrbQ6ymNd/GtsVswIFsfem1QEdai3lq9Npned/kKoyz2Tvbi1M2hlhyT9bPhjMvPTHsrGrkQ
 G7B2gAkO/NBWlZkVi6Qg6BIIz5dWYf0+rC5rb70WjeW0C1bgEFNh54AaUFMOQIlu2DDh29yth9b9K
 h8838Tpl9nOfr/cC7Gx6OrqLBB6OFvnjEBLhHvsdOEg7Dt+S8b/PV1SnCQQbRWOk/EBH0JXQg0Bny
 gYD56yo2GKLGMbMfQfldRL6KxTU4JNpafrEBPXJD2u1Ojb7r+7YhvpwqLfAo7fM9BMz7eDf6cbG8H
 e2vqT/L0CvCHTWlr36jeGQXlE2lgvgxuT+CCUjvC+j09uvJQldyja0OOUPmYi3R4EaKLDoU+/rcLa
 HinvNyFA+t52B68MU7YQCRMWuAmakzcL+wCfGvA0U/LaRD55D8ZNJ7KL5i2kB/HDn3BJaeWzt5JEW
 4g8AyjV28R6fOs9pRE7RPMl9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMm82-004irf-AW; Sun, 05 Sep 2021 06:59:46 +0000
Subject: Re: OSS-fuzz needs some love
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
 <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
 <2fc73976-5505-cbb9-7341-10c323b7a095@samba.org>
 <f2b1e57143e2fdfc2865de71412399d7c156333a.camel@samba.org>
 <b316c4a8-23e0-b35d-033a-5176a271ba4b@samba.org>
Message-ID: <96071d4c-2d37-7f33-0700-897d46b79423@samba.org>
Date: Sun, 5 Sep 2021 09:59:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b316c4a8-23e0-b35d-033a-5176a271ba4b@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/4/21 1:30 PM, Uri Simchoni via samba-technical wrote:
<snip>
> 
> python infra/helper.py build_image samba
> python infra/helper.py build_fuzzers --sanitizer address --engine 
> libfuzzer --architecture x86_64
> python infra/helper.py check_build --sanitizer address --engine 
> libfuzzer --architecture x86_64
> 

That should be:

python infra/helper.py build_fuzzers --sanitizer address --engine 
libfuzzer --architecture x86_64 samba

python infra/helper.py check_build --sanitizer address --engine 
libfuzzer --architecture x86_64

