Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B42840180F
	for <lists+samba-technical@lfdr.de>; Mon,  6 Sep 2021 10:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=LdRmYrZRb9hnH9VhQUynA1QmzYUkxstjSs55e/CyJ0s=; b=ICSVQ7jDD041n2S1Vi08NLcnxv
	bSJAlNxIdz4wwQqXwB39OUtz2MlvTlx5H/BUWz9I702/STFtszgbT529I526PeNidCTCxTGQxROVF
	tPDiq4nAM/mffG+/OhT1i12h0iX9mXg59mxOlbumcR4MEpPP4n98eCVItR41SMHzbkLVEmQDQayFw
	ZC4QV/BBtVSHEVcyHH8wntvyX4GcDl0CLnRzeUPkIAd+GU6jtCGX/xr/RLDPo0v/vuvzGeRVIltbY
	kY9URtyH5Q7a+CgHgQRjf7kIrgydLISJRj4LbsHutc/YxilFuBKeNnoqWTWMI9TXWRdeK4uKXC+3M
	W6AydfQQ==;
Received: from ip6-localhost ([::1]:32332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mNA4e-00DRi6-0b; Mon, 06 Sep 2021 08:33:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mNA4T-00DRhw-SF
 for samba-technical@lists.samba.org; Mon, 06 Sep 2021 08:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=LdRmYrZRb9hnH9VhQUynA1QmzYUkxstjSs55e/CyJ0s=; b=D/RqRvr45p71Dk/nxedwwFoC9m
 Kpon3L788F3LYR+X7Q3GcFs2VBpvild70HxMuzOTSCauZEFupvq4JYnMYpVFjriMspoM06VzgZwkr
 8edKJRNBT57hLvK85K8neqoFjygyt/JOyu8AX5R9XR5Tzsvd0HRKA8XcAVu4FWsjOH6238vSDrYvi
 EldA+LRnDoFqHmip5G0HzYpzYFcjU/yzvoUHfUiiib7cbtsNwqCRwUohqSSC5C5SmXB3XSeCwgPod
 T9/JCapRk3cynqRo+8dR/QyP5by79HHBAySLYrYEYz6mStSEBaMehj//MsTvOgtF+7k9hKsMtPTIR
 b0PP2S2t7o4B+ozHtZYztqVTVnbwxpvzNV6M27aOnl9SvaX5WWeUJTm0OHqU+hHQKAosCzb9foQ8r
 l+22IjLEvDCpEkV2GerCPGGEXXakJD542ueQ2wWTJWarun/a0DRI7gWf9Gji5oGesnhrZCXVXxaes
 QWrjPp0enjdO9rRRz2nibzQK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mNA4Q-004ryD-Og; Mon, 06 Sep 2021 08:33:39 +0000
Message-ID: <80f126c8d4b629f8dbf7e1583d6940e31934c458.camel@samba.org>
Subject: Re: OSS-fuzz needs some love
To: Uri Simchoni <uri@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Mon, 06 Sep 2021 20:33:35 +1200
In-Reply-To: <b316c4a8-23e0-b35d-033a-5176a271ba4b@samba.org>
References: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
 <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
 <2fc73976-5505-cbb9-7341-10c323b7a095@samba.org>
 <f2b1e57143e2fdfc2865de71412399d7c156333a.camel@samba.org>
 <b316c4a8-23e0-b35d-033a-5176a271ba4b@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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

On Sat, 2021-09-04 at 13:30 +0300, Uri Simchoni via samba-technical
wrote:
> What I have so far is in 
> https://gitlab.com/samba-team/samba/-/merge_requests/2152
> 
> I'll continue this in a few days hopefully.
> 
> One fuzzer, namely fuzz_parse_lpq_entry, doesn't pass check_build, 
> whereas the others pass the check_build of oss-fuzz (at least in address 
> sanitizer and libfuzzer mode). Our check_build.sh stops as soon as it 
> reaches fuzz_parse_lpq_entry so IDK if it passes the rest (probably yes 
> because of the oss-fuzz result).
> 
> The issue with fuzz_parse_lpq_entry seems to be that it references 
> libtracker-data.so without RPATH.

Remember that the way the system copies in the libraries that are
'needed' on the target is to use ldd.  If somehow the need for this
doesn't show up with ldd, it will be missed.

That might be due to our build rules or due to how libtracker-data.so
is brought in.  It also doesn't seem likely to be used by
fuzz_parse_lbq_entry so perhaps either the dependencies could be
trimmed or for fuzzing tracker support could be omitted (change the
configure options). 

Thanks so much for giving this a go!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



