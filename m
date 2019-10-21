Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B144DE6D0
	for <lists+samba-technical@lfdr.de>; Mon, 21 Oct 2019 10:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=esm2QjMkr1hlH3Fr1a39D8zuLUYZAhqA2KprujmU5XY=; b=cVlp0v6syQjkORCXH2ZFHiWdqz
	iGn017dj8ae4XnTpH3v6GyVr2OKewiD7yirWHUyK4YE+ovMFXnsZ1COLeSYGdoFNE44YnpPNqAhk6
	aNMkH3oJmzxmxaKzNquPYk4snvGdOZa9naMzzj1eKTzT49TYAcjeEYEt5knKMEMjylwMB1mqz++02
	mUP3lvxf7W2nXOe85DCls6Ru8avNeTDXWU9y8RgBzVPmJ/TJr8NkeA+sdZrFUeSHRjkcGc6w4+jUD
	Vyf/pqnhtS7L7NxHoZYbBz2N3kcadoSH7OvKW04qdJqM0ydtskiG6A/+rmT/vLNjMqqcWXYrUsT6b
	VZSAjEPw==;
Received: from localhost ([::1]:41552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMTGZ-0010Sc-2y; Mon, 21 Oct 2019 08:42:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMTGU-0010SU-Bu
 for samba-technical@lists.samba.org; Mon, 21 Oct 2019 08:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=esm2QjMkr1hlH3Fr1a39D8zuLUYZAhqA2KprujmU5XY=; b=lSnRjkzrS1lKRuqohf9UiZWUqR
 +vIA5y1vV8VOdWRtDZfpSLuoU30yL+f9GdlYEj41rDRHUItn1m4NAG01rJ4X7UIScIqSurJDx7pFC
 xhxAVo12W3HpWLdNrTnB8dBsQeMaZkhZ3sw7RpABl0RkRWeKQU6q5UgEt0KCizTQt1++q4sS71Dtd
 01FhDjTnpychgd9NbspttIWGUi92qs6AGW07j4yQsN1N67UsimxNfDwcq3b9MV4y0W1Qycwgo89rz
 nB9tCktpGPObEHdcDJ3jce7523Q5ibW/0ULE+SuYUEoaWDjqQk2VvhiRkG944M9pVf90Q7fgNSzVr
 4zWv7906P3+OsdhhNbdgiiC5kQkmGBh1G3AskZtACqgViUAbTStObT+CZVf8VkYVFRmpqPHuy1kp3
 Q9Dtb8myu3dXRUP8mJmeBVrAhLMSRaq7SeB+tkC8JKdU0/FGPYXTztRkIHfWrPyjalJdcy8ZY1LQe
 cvmu/5znfEVjYWe65C0O/zog;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMTGS-0007T6-Me
 for samba-technical@lists.samba.org; Mon, 21 Oct 2019 08:42:09 +0000
Subject: Re: [PATCH] build - use system asn1_compile to cross-compile Samba's
 bundled Heimdal
To: samba-technical <samba-technical@lists.samba.org>
References: <80f0d797-a4df-2694-f707-4dfb41b0bbdf@samba.org>
Message-ID: <fad66b32-418d-a14c-3770-7a2efccf750d@samba.org>
Date: Mon, 21 Oct 2019 11:42:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <80f0d797-a4df-2694-f707-4dfb41b0bbdf@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Two corrections to the account below:

1. For cross-build, it's been necessary to add 
--bundled-libraries='!asn1_compile,!compile_et' regardless of whether or 
not one sets COMPILE_ET / ASN_COMPILE (i.e. there's only one method, and 
setting COMPILE_ET can be used to override the lookup for compile_et 
program in the path).

2. Consequently, cross-building is broken without workaround in 4.11 - 
the patch in this thread can be used until this gets fixed.

Thanks,
Uri.

On 20/10/2019 9:37, Uri Simchoni wrote:
> Hi,
> 
> (Taking discussion from https://bugzilla.samba.org/show_bug.cgi?id=14164 
> to the list)
> 
> Attached is yet another cross-compilation fix which I submitted to 
> bugzilla for test by reporter before MR. The fix works for the reporter, 
>   but has been Nacked by Andrew, and I'd like to discuss this further here.
> 
> Background:
> - Heimdal build requires two tools, asn1_compile and compile_et, which 
> are binary programs.
> - In the native build of Samba with embedded Heimdal, we build them 
> first and use them to build the rest of Heimdal.
> - This fails on cross-build for obvious reasons.
> - One workaround (which I've been using when I was in the embedded Samba 
> business) is to build Samba natively, stash the binaries of asn1_compile 
> and compile_et somewhere, and set environment vars COMPILE_ET and 
> ASN1_COMPILE to point to these binaries.
> - A different workaround which is in common use (buildroot, OpenWRT, 
> LibreELEC to name just a few) is to *somehow* host-build compile_et and 
> asn1_compile and install them in the build's path, then run configure 
> with the flag --bundled-libraries='!asn1_compile,!compile_et'. This 
> would invoke a configuration test which finds the binaries in the path 
> and sets COMPILE_ET / ASN1_COMPILE accordingly. Let's call that "the 
> automatic method".
> - The "somehow" seems to mostly be building of stand-alone Heimdal 
> package. So Samba gets cross-built with asn1_compile that came from 
> stand-alone Heimdal, and compile_et which comes from either Heimdal or, 
> possibly, another package that produces this binary and has been 
> host-built such as e2fsprogs. Both might be overriden by what happens to 
> be installed on the build-host, if the distro doesn't take care to put 
> its built tools in the path before the system tools.
> - commit 8061983d4882f3ba3f12da71443b035d7b672eec broke the automatic 
> method, because it invokes the test to find binaries only if using 
> system Heimdal.
> 
> The attached patch fixes "the automatic method". Andrew Nacked it 
> because using some binary that we don't know where it came from is prone 
> to incompatibility issues. In fact, it appears that embedded vendors 
> routinely use a patch that removes inclusion of <unistd.h> from one of 
> Samba's libreplace files, just because of the automatic method, and this 
> patch works on 4.11 but breaks master. A better fix would be to get 
> Samba's build system to build asn1_compile and compile_et using the host 
> compiler.
> 
> After this long background, my response to the Nack:
> 
> 1. Does waf support this mixed-build method? Are there examples / 
> pointers? (I can try myself but any pointers would be welcome)
> 2. Shouldn't we "get things to the way they were" before supplying "the 
> perfect fix"? I fear of me running out of time and continuing this at a 
> much slower pace.
> 3. If we nack the fix, would it be correct to say that the current 
> situation, where "the automatic method" is invoked in system-heimdal 
> build makes no sense, as there's no need for asn1_compile / et_compile 
> with system Heimdal?
> 
> Thanks,
> Uri.


