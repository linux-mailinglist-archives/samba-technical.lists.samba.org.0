Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C96D61448C6
	for <lists+samba-technical@lfdr.de>; Wed, 22 Jan 2020 01:13:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=t/+Ik5VZ92Kco7FBFZXKjBiZ+gOcfh3NMYvvd1TU8aQ=; b=h6nq23WHn+bgZX2S5/RW3tqNNc
	GpUhtCsaEGol33VxYi4F9p65uH7aWcZjGO5G92NPqM8hO2z2Uxg7kIMsayrMiKGNitjSQNVG2sCnn
	oQFn9c/i+Xl0FwgBFKTU9kasth/uOa1AOohtMdKIZd+9N31uzDMZTUe/7DaWHQIev3pl/fnwvhGrg
	ktmxs/M6oCo4PlaSC7G5RN7aIhefuSwL3+RwExQc6bET9/RvUPgazJKbnw5Kj8NjozelmbBHWHL4l
	r4nnl0lKwl3xI4CCXqEeqUjfSWefiO5PTHkVzg4R+bJYkWCFAisVv2+zyEOArBy95pxYbyi5AiYVV
	Jjfupr5A==;
Received: from localhost ([::1]:21868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iu3cj-0049lb-9e; Wed, 22 Jan 2020 00:11:57 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:58710) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iu3cd-0049lU-IZ
 for samba-technical@lists.samba.org; Wed, 22 Jan 2020 00:11:54 +0000
Received: from [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 9B04780CB5; 
 Wed, 22 Jan 2020 13:11:30 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1579651890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=t/+Ik5VZ92Kco7FBFZXKjBiZ+gOcfh3NMYvvd1TU8aQ=;
 b=aTtatPU7eQlMd0NXwRe+w73e7bhtFiv+rm6iw0tCf8I0nfUR5l4WNiF1mF22J8ukEGQyEi
 v9L1d4Sb6r2acKsnITDaCV8CK38jHgUZlVoKBYQPlAlqp2t2utrcN/OwZcOdT/xBs/VyNE
 KlDPZCxn/5m3C37yntnxevDN5FsUHGBMC589skALmjvziiUrDHYMouAtXBS7xvf/Nu6oya
 yJ1YfqFEc3FssxRuV7k3iG7AOmOUzMu7V2g0gL2cWwmHD8xTksi3KMQHUZnRah0q+CK+Oo
 /hdAoitVm6BlbgQmuiYIa8+wvXevShKzmx9Sagmv2sbMCTs986DrKdcbcw7fsQ==
Subject: Re: fuzzers
To: David Disseldorp <ddiss@samba.org>,
 Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
References: <2546695.cijFyKqbAK@magrathea>
 <0f82d428-6115-a26a-dfd1-02e79e573c8a@catalyst.net.nz>
 <20200121143816.302b849d@samba.org>
Openpgp: preference=signencrypt
Message-ID: <7befbbde-de06-be06-4cba-6d155cdb1a1d@catalyst.net.nz>
Date: Wed, 22 Jan 2020 13:11:30 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200121143816.302b849d@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 22/01/20 2:38 AM, David Disseldorp wrote:
>> Should we adopt a convention similar to our BUG: links?
>> That is, add lines like this in our commits:
>>
>> OSS-Fuzz: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=19395
> 
> Given that OSS-Fuzz is evident from the URL, would it make sense to use
> a more generic "Fuzz: " tag? That could be reused with other fuzzing
> services.

Ha, well, that is a reasonable point.

Actually what we probably want is "Ref: ", because the point is not that
there was fuzzing involved, but that there is relevant remote
information or discussion. It could be a static analysis site, a Fedora
bug report, or even a lists.samba.org link.

cheers,
Douglas

