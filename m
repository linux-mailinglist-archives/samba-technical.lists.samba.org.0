Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2BF41E837
	for <lists+samba-technical@lfdr.de>; Fri,  1 Oct 2021 09:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=BKhEB6H4+ldxz6bxZqfej8XVvsZ3R9emEfZv5+evmQc=; b=YoC0Xr5Dm7GVHl6jov9M5zw658
	AW+HeZsS3SxsfEArcJFGMzH+FwutoMRNcvXHtIUuD9PmM7RRlP6Zle+Gd+K1IMq3sBHXlJnV+iUJR
	8DCeRmC1i0TJ9LuwDBwKGjHZWkWZmqipuiWxi2ewMNCH3MrJngVsKWLpkpbZfPcdgAGJdzXeed+up
	7KfET+JufgXaIwmm+0MvKN1yBAJfK/zIFrQ1x6IgDvk8ZdeizbkPMwme8ExhKyzRPMzXUg56bik98
	ZgXW3J64JNn6tJNacNY5G/XxiBlpNQ70w+ct3qSpHRGoXJjuQ2ie651lGteTwAWnHNRzGA6TAlHr9
	sEdl/gGQ==;
Received: from ip6-localhost ([::1]:21080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mWCoA-003Js1-AY; Fri, 01 Oct 2021 07:18:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41698) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mWCnv-003Jrr-Vy
 for samba-technical@lists.samba.org; Fri, 01 Oct 2021 07:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=BKhEB6H4+ldxz6bxZqfej8XVvsZ3R9emEfZv5+evmQc=; b=IY0xWAA/MBdBG26N9IegnXJyrv
 L6uxYaAIr2iAO3cRKUxBD/ITIYt6Cl1Dml+YXUsCa47OEfiB1l/Er6NrgumEpSI1deyvuhzvvl1Jx
 2FpCE5JIEDrI/lbZMk7o2FhQ9c1v9NGUW3E2S3iNHD85kW/IhSunDHrUijixSDZ3Ru7yzRNpJ/VjT
 i/YO973VRDr+1QG00ymxgS4fWcRgSemmXQHophXQhe8uJ8s2RCDOdVjlhSWM8wLyJbKI46dbYsYWh
 iNd//QdlcTm8UR0rh3ZEN/7BveDVni/tiWcYETsf0oJWXBGdbjXrAlIx16tH54V+++0ZlSl6gsnpH
 wRqQlG5K2gPqREP6FR4H6dJWvcyxA1YTv2c/A+klsm0WwopaTuuSogEaQqM02JrO9J5+TeBmDOghK
 CpEtJ4OmmcBMXHOZ52p2wF2pXtsNHQeaYtv9/BMz1HzSHYa6UKFgxS0gWdcD2dxuggp1Rc7jRi8Ds
 ygruSelidwSaMtjF4J+l3CUy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mWCnt-0011Qt-Np; Fri, 01 Oct 2021 07:17:57 +0000
To: uri@samba.org
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Date: Fri, 01 Oct 2021 09:17:57 +0200
Message-ID: <10047099.26PrVxicsy@magrathea>
In-Reply-To: <E1mO98b-00Brye-VW@hrx0.samba.org>
References: <E1mO98b-00Brye-VW@hrx0.samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, September 9, 2021 3:46:01 AM CEST Andrew Bartlett wrote:
> The branch, master has been updated
>        via  4366c3bb71f gitlab-ci: run samba-fuzz autobuild target on Ubuntu
> 20.04-based image via  4f300d672a8 fuzzing/oss-fuzz: strip RUNPATH from
> dependencies via  f94b1d3b31f fuzzing/oss-fuzz: fix samba build script for
> Ubuntu 20.04 via  541f9ee5ab6 fuzzing/oss-fuzz: fix RPATH comments for
> post-Ubuntu-16.04 era via  e608dcd2d67 configure: allow configure script to
> accept parameters with spaces via  2fe8d3eeac4 fuzzing/oss-fuzz: fix image
> build recipe for Ubuntu 20.04 from  18e08c70900 docs: Avoid duplicate
> information on USER and PASSWD, reference the common section
> 
> https://git.samba.org/?p=samba.git;a=shortlog;h=master
> 
> 
> - Log -----------------------------------------------------------------
> commit e608dcd2d6736505022d0f9d1e008333bb70f1af
> Author: Uri Simchoni <uri@samba.org>
> Date:   Sat Sep 4 11:01:56 2021 +0300
> 
>     configure: allow configure script to accept parameters with spaces
> 
>     Specifically this enables passing two linker flags to the
> --fuzz-target-ldflags configure argument.
> 
>     Signed-off-by: Uri Simchoni <uri@samba.org>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>

Hi Uri,

this commit reverts the fix of e2962b4262fc4a7197a3fcbd010fcfaca781baea!

If you want to have spaces in parameters then put them in quotes like:

    ./configure '--fuzz-target-ldflags=wurst brot'


https://gitlab.com/samba-team/samba/-/merge_requests/2191


Best regards



	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



