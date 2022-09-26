Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE365EA67E
	for <lists+samba-technical@lfdr.de>; Mon, 26 Sep 2022 14:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=bjjQodM8kB9hqpCraEcYQHr8v7g/GGAOCMpaxe1b93A=; b=sR4ppgxV1tbb06ZhazbOjBGJoT
	wSFlh2dhbdWGkBkM+FmbjXqgLxoq8dPcrtwr9hq+Da9HiLxBerZ3WbV6h9WSqIOLlIL5jQS9YnR9H
	Et3QgE18TZTwJ9sV4LXM6o1cm0u7RBcxhvyrbpxd6b0EFTFyA70mrE58XidqzYcAEL1J3EoJgFsRT
	l3aM7n4m8Vla4jJwmYUNobYe5ASUdq8qUceGJssnXlwkrx2hmZ5JR9pSvoanMCnkgBDgYts4Q1646
	RNUYTvjG4DPWpYx7mX3lnffDxH8bGPaulsIg2MJsJ5zAwns0auX2WJErU+WyB93daBZb5ku8eqrcl
	VXUkXvHw==;
Received: from ip6-localhost ([::1]:27364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ocnWT-004EQW-0Z; Mon, 26 Sep 2022 12:47:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58722) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ocnWO-004EQN-Al
 for samba-technical@lists.samba.org; Mon, 26 Sep 2022 12:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=bjjQodM8kB9hqpCraEcYQHr8v7g/GGAOCMpaxe1b93A=; b=HrZsHeLE4X1b5Xoh8+fwNHXM48
 Rt7n+oqEMemS3FA/FP1Vpo+FJMFX32Xt+5YJef53DZ2DUbipkk0gkSsDKCEx2n+6i58otl2NGgvHg
 pxDJRJMoD2gbBqE7ffGhYiGbT9122mhE8+5CU5kycOjIwBWt+A+GRXG6t/y1gzx5AsMANOb62sqw3
 371Wd+AQ/4eExlK+bG/KN4HbokDdVarfSsTIKY/4NWUI5bz/VdfwSi0urawon2h5or5ImgVd89ul0
 s38PE7KEh1jfQhi7W8clMjM/pw4iUFwlIuVa5Oj4+V4BnTyqhMoen1ipWO14mjFsqM1jKbGptIL+h
 AoKubcSCsmtXtdvv39ZVPRf6HzasIgK/BKHoCWdR/f04QbZBaqsS4+1PWrZUOg+QfXib4EkJ2pRra
 EEP5kxiVJzzzt14nB13Q7BynRN70JdGcLTfvET7Y0Wimy3m2DN5VPGJQ53x/ZI2E6gWpdoRuDJoKg
 ojwYnM7aQaY+f9ul3SZieJNh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ocnWF-001xyx-Ab
 for samba-technical@lists.samba.org; Mon, 26 Sep 2022 12:47:31 +0000
Message-ID: <8a491dec-658a-95be-b768-b6284ee5ec78@samba.org>
Date: Mon, 26 Sep 2022 06:45:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: SMB3 POSIX Spec draft
To: samba-technical@lists.samba.org
References: <9ae62eb6-613d-6347-62d0-15d5cc429150@samba.org>
 <afc1d4d9-6f14-f657-42ee-af9696f01d01@talpey.com>
Content-Language: en-US
In-Reply-To: <afc1d4d9-6f14-f657-42ee-af9696f01d01@talpey.com>
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 9/23/22 6:09 PM, Tom Talpey via samba-technical wrote:
> David, this is a great start! Organizing the markdown in the Microsoft
> document template layout looks good, and will make it easy to cross-
> reference - and who knows, maybe even merge!
>
> How do you want feedback? I'd prefer to use email, personally, so we
> can all see (and join) any discussion. Is samba-technical the best spot?
>
I'm fine with doing feedback via mailing list right here.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


