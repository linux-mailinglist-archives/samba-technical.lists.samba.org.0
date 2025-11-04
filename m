Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C9C31D75
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 16:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=2Oh/WjvuENhyt2AbpEcOk7+ysW0l/7aHgPEtTllkPzM=; b=Rb+mEAYuGQrc0MJGl6DIrvH4c5
	qhmCXbanGTudwV9+gmCU4tI8ZZPpiX5lgBcprt7ccFcfFfXXm2FuI/hEhDZuRB4cfCppBR7k7CBJz
	Ynod9u5tyOTu52cnU/8iG1FoNoamOm2sqeRaA8hVavDva7r9XcpORKyxst/RAWKsobCQ/8dTHWwbd
	eKMsObIEL3UBq3+KlNd1xtSs/OTy/WyNgWV5u6lp0ZRAdJnBio3QzA2OybuCaW+12kkuUjZc3wPUV
	MiCAGQmgxekplq4nkzgEy9/BopolhLKcwU7vM0Ws7kyBjsPSPp5svUZRTE2kpHTsar5m45hBZOs7Q
	lDUs1Pzg==;
Received: from ip6-localhost ([::1]:48870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGIzZ-00BTzi-Lt; Tue, 04 Nov 2025 15:30:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54270) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGIzV-00BTzb-2p
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 15:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=2Oh/WjvuENhyt2AbpEcOk7+ysW0l/7aHgPEtTllkPzM=; b=psdypzBHfg5aL1QuSiXY3WipZa
 aiYtyjdJHD9/Oz3ebMdKEuoMGFZJu6oGYpi8khSUOTFVvyLPf61JZfLantsUimS4+tMp64nIqiKko
 fFpShPKSYajq0q6XDXleVLHA4buDXq61rnwWdUQEl003jeI6STjwbU61936355n1V0Vve71WmikFG
 l0r3pXxZw7chQPNu2ArZfvMlHAeh+27D+mtFtWB+/5gHg6vs/gm1z6BhaXgY/TqIWZ1h6mDtq6kpE
 9rZeFO+myxY6oCrABhMMeFfoQKy3Qj2R/zh4OQjW/u8A9uywBAidiqOKy66e6T946/fWM5m/vGmjO
 I2QhwvSUCSxvGzTqMR2aAzVt8r5av4nDYB21oqgMe0lHqXLvhtkjTGzxxQVLOVryhEMSN+tQHM2Jv
 GvlzMHRsQmCzdDiIekN58JncRkIfFOXx82Z/RPBAooIQ3NotPXg0Dob5HFrbHfFHd1BM9M3RrdnlK
 8IrK8/HWm6ThLA8eWvsXLj9G;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGIzU-00CZ6a-16 for samba-technical@lists.samba.org;
 Tue, 04 Nov 2025 15:30:36 +0000
Message-ID: <047e13d0-0720-4e49-b13a-bfd4124c4028@samba.org>
Date: Tue, 4 Nov 2025 08:30:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Top 20 developers with open Merge Requests
To: samba-technical@lists.samba.org
References: <7684109.rdbgypaU67@magrathea>
Content-Language: en-US
In-Reply-To: <7684109.rdbgypaU67@magrathea>
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


On 11/4/25 02:46, Andreas Schneider via samba-technical wrote:
> | David Mulder      |       25 |
Those are primarily test conversions from SMB1 to SMB2. These are in 
various stages. Some are potentially ready to merge with rebase. Others 
still need a lot of work.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


